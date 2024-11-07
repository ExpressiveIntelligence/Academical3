using System.Collections.Generic;
using System.Linq;
using Anansi;
using TDRS;
using UnityEngine;

namespace Academical
{
	[DefaultExecutionOrder( 2 )]
	public class GameManager : MonoBehaviour
	{
		[SerializeField]
		private Character m_Player;

		private Location m_CurrentLocation;

		/// <summary>
		/// Manages the underlying world simulation.
		/// </summary>
		[SerializeField]
		private SimulationController m_simulationController;

		/// <summary>
		/// Manages character relationships and all information in the logical database.
		/// </summary>
		[SerializeField]
		private SocialEngineController m_socialEngine;

		/// <summary>
		/// A reference to the script controlling the dialogue and story progression.
		/// </summary>
		[SerializeField]
		private DialogueManager m_dialogueManager;

		/// <summary>
		/// All storylets related to locations on the map.
		/// </summary>
		private Dictionary<string, Storylet> m_locationStorylets;

		/// <summary>
		/// All storylets related to actions the player can take at locations.
		/// </summary>
		private Dictionary<string, Storylet> m_actionStorylets;

		[SerializeField] private GameSettingsSO m_GameSettings;

		#region Properties

		/// <summary>
		/// A reference to the simulations database.
		/// </summary>
		public RePraxis.RePraxisDatabase DB => m_socialEngine.DB;

		/// <summary>
		/// A reference to the dialogue manager.
		/// </summary>
		public DialogueManager DialogueManager => m_dialogueManager;

		#endregion

		private void Awake()
		{
			m_locationStorylets = new Dictionary<string, Storylet>();
			m_actionStorylets = new Dictionary<string, Storylet>();
		}

		private void OnEnable()
		{
			GameEvents.LocationSelectModalShown += OnLocationSelectModalShown;
			GameEvents.ActionSelectModalShown += OnActionSelectModalShown;
			GameEvents.ActionSelected += OnActionSelected;
		}

		private void OnDisable()
		{
			GameEvents.LocationSelectModalShown -= OnLocationSelectModalShown;
			GameEvents.ActionSelectModalShown -= OnActionSelectModalShown;
			GameEvents.ActionSelected -= OnActionSelected;
		}

		private void Start()
		{
			GameEvents.GameHUDShown?.Invoke();
			SocialEngineController.Instance.Initialize();
			SocialEngineController.Instance.RegisterAgentsAndRelationships();
			m_simulationController.Initialize();
			m_dialogueManager.Story.DB = SocialEngineController.Instance.DB;
			m_dialogueManager.Initialize();
			RegisterExternalInkFunctions( m_dialogueManager.Story.InkStory );

			this.m_actionStorylets = m_dialogueManager.Story
				.GetStoryletsWithTags( "action" )
				.ToDictionary( s => s.ID );

			this.m_locationStorylets = m_dialogueManager.Story
				.GetStoryletsWithTags( "location" )
				.ToDictionary( s => s.ID );

			StartStory();
		}

		/// <summary>
		/// Start the story.
		/// </summary>
		public void StartStory()
		{
			Storylet startStorylet = m_dialogueManager.Story.GetStorylet( "start" );
			m_dialogueManager.RunStorylet( startStorylet );
		}

		/// <summary>
		/// Set the player's current location and change the background
		/// </summary>
		/// <param name="locationID"></param>
		/// <param name="tags"></param>
		public void SetPlayerLocation(string locationID)
		{
			Location location = m_simulationController.GetLocation( locationID );

			if ( m_Player.Location != location )
			{
				m_CurrentLocation = location;
				m_simulationController.SetCharacterLocation( m_Player, location );
				m_dialogueManager.SetBackground(
					new BackgroundInfo(
						locationID,
						new string[]
						{
							// Pass the time of day as an optional tag.
							$"~{m_simulationController.DateTime.TimeOfDay.ToString()}"
						}
					)
				);
			}
		}


		/// <summary>
		/// Get a list of all location storylets a player could execute.
		/// </summary>
		/// <returns></returns>
		public List<StoryletInstance> GetEligibleLocationStorylets()
		{
			List<StoryletInstance> instances = new List<StoryletInstance>();
			HashSet<string> eligibleLocations = new HashSet<string>(
				m_CurrentLocation.ConnectedLocations.Select( s => s.UniqueID )
			);

			foreach ( var (uid, storylet) in m_locationStorylets )
			{
				// Skip storylets still on cooldown
				if ( storylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !storylet.IsRepeatable && storylet.TimesPlayed > 0 ) continue;

				if ( !eligibleLocations.Contains( storylet.ID ) ) continue;

				// Query the social engine database
				if ( storylet.Precondition != null )
				{
					var results = storylet.Precondition.Query.Run( DB );

					if ( !results.Success ) continue;

					if ( results.Bindings.Length > 0 )
					{
						foreach ( var bindingDict in results.Bindings )
						{
							instances.Add(
								new StoryletInstance( storylet, bindingDict, storylet.Weight ) );
						}
					}
					else
					{
						instances.Add(
							new StoryletInstance(
								storylet, new Dictionary<string, object>(), storylet.Weight ) );
					}
				}
				else
				{
					instances.Add( new StoryletInstance(
						storylet,
						new Dictionary<string, object>(),
						storylet.Weight
					) );
				}
			}

			return instances;
		}

		/// <summary>
		/// Get a list of all action storylets a player could execute.
		/// </summary>
		/// <returns></returns>
		public List<StoryletInstance> GetEligibleActionStorylets()
		{
			List<StoryletInstance> instances = new List<StoryletInstance>();

			foreach ( var (uid, storylet) in m_actionStorylets )
			{
				// Skip storylets still on cooldown
				if ( storylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !storylet.IsRepeatable && storylet.TimesPlayed > 0 ) continue;

				// Query the social engine database
				if ( storylet.Precondition != null )
				{
					var results = storylet.Precondition.Query.Run( DB );

					if ( !results.Success ) continue;

					if ( results.Bindings.Length > 0 )
					{
						foreach ( var bindingDict in results.Bindings )
						{
							instances.Add(
								new StoryletInstance( storylet, bindingDict, storylet.Weight ) );
						}
					}
					else
					{
						instances.Add(
							new StoryletInstance(
								storylet, new Dictionary<string, object>(), storylet.Weight ) );
					}
				}
				else
				{
					instances.Add(
						new StoryletInstance(
							storylet,
							new Dictionary<string, object>(),
							storylet.Weight
						)
					);
				}
			}

			return instances;
		}

		private void RegisterExternalInkFunctions(Ink.Runtime.Story story)
		{
			story.BindExternalFunction(
				"SetPlayerLocation",
				(string locationID) =>
				{
					this.SetPlayerLocation( locationID );
				}
			);

			story.BindExternalFunction(
				"GetOpinion",
				(string subject, string target) =>
				{
					return this.m_socialEngine.State
						.GetRelationship( subject, target )
						.Stats.GetStat( "Opinion" ).Value;
				}
			);

			story.BindExternalFunction(
				"SetCurrentLocation",
				(string locationId) =>
				{
					Location location = m_simulationController.GetLocation( locationId );

					if ( m_CurrentLocation != location )
					{
						m_CurrentLocation = location;
						DB.Insert( $"currentLocation!{locationId}" );
						m_dialogueManager.SetBackground(
							new BackgroundInfo(
								locationId,
								new string[0]
							)
						);
					}
				}
			);
		}

		private void OnActionSelectModalShown()
		{
			GameEvents.AvailableActionsUpdated?.Invoke( GetEligibleActionStorylets() );
		}

		private void OnLocationSelectModalShown()
		{
			GameEvents.AvailableLocationsUpdated?.Invoke( GetEligibleLocationStorylets() );

		}

		private void OnActionSelected(StoryletInstance action)
		{
			m_dialogueManager.RunStoryletInstance( action );
		}
	}
}
