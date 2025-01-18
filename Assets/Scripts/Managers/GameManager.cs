using System.Collections.Generic;
using System.Linq;
using Anansi;
using TDRS;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// The game
	/// </summary>
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
			GameLevelSO currentLevel = GameStateManager.GetLevel();

			if ( currentLevel != null )
			{
				m_dialogueManager.SetStory( new Story( currentLevel.InkScript.text ) );
			}

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
		public List<LocationStoryletInfo> GetEligibleLocationStorylets()
		{
			List<LocationStoryletInfo> locationInfo = new List<LocationStoryletInfo>();

			foreach ( var location in m_CurrentLocation.ConnectedLocations )
			{
				if ( !m_locationStorylets.ContainsKey( location.UniqueID ) ) continue;

				Storylet locationStorylet = m_locationStorylets[location.UniqueID];

				// Skip storylets still on cooldown
				if ( locationStorylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !locationStorylet.IsRepeatable && locationStorylet.TimesPlayed > 0 ) continue;

				bool hasRequiredActions = LocationHasRequiredActions( location );
				bool hasAuxiliaryActions = LocationHasAuxiliaryActions( location );

				// Query the social engine database
				if ( locationStorylet.Precondition != null )
				{
					var results = locationStorylet.Precondition.Query.Run( DB );

					if ( !results.Success ) continue;

					if ( results.Bindings.Length > 0 )
					{
						foreach ( var bindingDict in results.Bindings )
						{
							locationInfo.Add(
								new LocationStoryletInfo(
									new StoryletInstance(
										locationStorylet, bindingDict, locationStorylet.Weight )
								)
								{
									hasAuxiliaryActivities = hasAuxiliaryActions,
									hasRequiredActivities = hasRequiredActions
								}
							);
						}
					}
					else
					{
						locationInfo.Add(
							new LocationStoryletInfo(
								new StoryletInstance(
									locationStorylet,
									new Dictionary<string, object>(),
									locationStorylet.Weight
								)
							)
							{
								hasAuxiliaryActivities = hasAuxiliaryActions,
								hasRequiredActivities = hasRequiredActions
							}
						);
					}
				}
				else
				{
					locationInfo.Add(
						new LocationStoryletInfo(
							new StoryletInstance(
								locationStorylet,
								new Dictionary<string, object>(),
								locationStorylet.Weight
							)
						)
						{
							hasAuxiliaryActivities = hasAuxiliaryActions,
							hasRequiredActivities = hasRequiredActions
						}
					);
				}
			}

			return locationInfo;
		}

		public bool LocationHasAuxiliaryActions(Location location)
		{
			foreach ( var (_, actionStorylet) in m_actionStorylets )
			{
				if ( !actionStorylet.Tags.Contains( location.UniqueID ) ) continue;

				if ( !actionStorylet.Tags.Contains( "auxiliary" ) ) continue;

				// Skip storylets still on cooldown
				if ( actionStorylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !actionStorylet.IsRepeatable && actionStorylet.TimesPlayed > 0 ) continue;

				// Query the social engine database. If the query passes, then
				// this action still need to be taken.
				if ( actionStorylet.Precondition != null )
				{
					var results = actionStorylet.Precondition.Query.Run( DB );

					if ( results.Success )
					{
						return true;
					}
				}
				else
				{
					return true;
				}
			}

			return false;
		}

		public bool LocationHasRequiredActions(Location location)
		{
			foreach ( var (_, actionStorylet) in m_actionStorylets )
			{
				if ( !actionStorylet.Tags.Contains( location.UniqueID ) ) continue;

				if ( !actionStorylet.Tags.Contains( "required" ) ) continue;

				// Skip storylets still on cooldown
				if ( actionStorylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !actionStorylet.IsRepeatable && actionStorylet.TimesPlayed > 0 ) continue;

				// Query the social engine database. If the query passes, then
				// this action still need to be taken.
				if ( actionStorylet.Precondition != null )
				{
					var results = actionStorylet.Precondition.Query.Run( DB );

					if ( results.Success )
					{
						return true;
					}
				}
				else
				{
					return true;
				}
			}

			return false;
		}

		/// <summary>
		/// Get a list of all action storylets a player could execute.
		/// </summary>
		/// <returns></returns>
		public List<ActionStoryletInfo> GetEligibleActionStorylets(Location location)
		{
			List<ActionStoryletInfo> actionInfo = new List<ActionStoryletInfo>();

			foreach ( var (uid, storylet) in m_actionStorylets )
			{
				if ( !storylet.Tags.Contains( location.UniqueID ) ) continue;

				// Skip storylets still on cooldown
				if ( storylet.CooldownTimeRemaining > 0 ) continue;

				// Skip storylets that are not repeatable
				if ( !storylet.IsRepeatable && storylet.TimesPlayed > 0 ) continue;

				bool isRequired = storylet.Tags.Contains( "required" );
				bool isAuxiliary = storylet.Tags.Contains( "auxiliary" );

				// Query the social engine database
				if ( storylet.Precondition != null )
				{
					var results = storylet.Precondition.Query.Run( DB );

					if ( !results.Success ) continue;

					if ( results.Bindings.Length > 0 )
					{
						foreach ( var bindingDict in results.Bindings )
						{
							actionInfo.Add(
								new ActionStoryletInfo(
									new StoryletInstance( storylet, bindingDict, storylet.Weight )
								)
								{
									isAuxiliaryAction = isAuxiliary,
									isRequiredAction = isRequired
								}
							);
						}
					}
					else
					{
						actionInfo.Add(
							new ActionStoryletInfo(
								new StoryletInstance(
									storylet, new Dictionary<string, object>(), storylet.Weight )
							)
							{
								isAuxiliaryAction = isAuxiliary,
								isRequiredAction = isRequired
							}
						);
					}
				}
				else
				{
					actionInfo.Add(
						new ActionStoryletInfo(
							new StoryletInstance(
								storylet, new Dictionary<string, object>(), storylet.Weight )
						)
						{
							isAuxiliaryAction = isAuxiliary,
							isRequiredAction = isRequired
						}
					);
				}
			}

			return actionInfo;
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

			story.BindExternalFunction(
				"HasUnseenAuxiliaryActions",
				() =>
				{
					foreach ( var (_, actionStorylet) in m_actionStorylets )
					{
						if ( !actionStorylet.Tags.Contains( "auxiliary" ) ) continue;

						// Skip storylets still on cooldown
						if ( actionStorylet.CooldownTimeRemaining > 0 ) continue;

						// Skip storylets that are not repeatable
						if ( !actionStorylet.IsRepeatable && actionStorylet.TimesPlayed > 0 ) continue;

						// Query the social engine database. If the query passes, then
						// this action still need to be taken.
						if ( actionStorylet.Precondition != null )
						{
							var results = actionStorylet.Precondition.Query.Run( DB );

							if ( results.Success )
							{
								return true;
							}
						}
						else
						{
							return true;
						}
					}

					return false;
				}
			);

			story.BindExternalFunction(
				"HasUnseenRequiredActions",
				() =>
				{
					foreach ( var (_, actionStorylet) in m_actionStorylets )
					{
						if ( !actionStorylet.Tags.Contains( "required" ) ) continue;

						// Skip storylets still on cooldown
						if ( actionStorylet.CooldownTimeRemaining > 0 ) continue;

						// Skip storylets that are not repeatable
						if ( !actionStorylet.IsRepeatable && actionStorylet.TimesPlayed > 0 ) continue;

						// Query the social engine database. If the query passes, then
						// this action still need to be taken.
						if ( actionStorylet.Precondition != null )
						{
							var results = actionStorylet.Precondition.Query.Run( DB );

							if ( results.Success )
							{
								return true;
							}
						}
						else
						{
							return true;
						}
					}

					return false;
				}
			);

			story.BindExternalFunction(
				"FadeToBlack",
				// Fade the screen to black after a given delay
				(float delaySeconds) =>
				{
					GameEvents.OnFadeToBlack( delaySeconds );
				}
			);

			story.BindExternalFunction(
				"FadeFromBlack",
				// Fade the screen from black after a given delay
				(float delaySeconds) =>
				{
					GameEvents.OnFadeFromBlack( delaySeconds );
				}
			);
		}

		private void OnActionSelectModalShown()
		{
			GameEvents.AvailableActionsUpdated?.Invoke( GetEligibleActionStorylets( m_CurrentLocation ) );
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
