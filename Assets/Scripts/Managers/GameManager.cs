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

		private void Start()
		{
			GameEvents.GameUIShown?.Invoke();
			SocialEngineController.Instance.Initialize();
			SocialEngineController.Instance.RegisterAgentsAndRelationships();
			m_simulationController.Initialize();
			// m_dialogueManager.OnRegisterExternalFunctions += this.RegisterExternalInkFunctions;
			// m_dialogueManager.Story.DB = SocialEngineController.Instance.DB;
			// m_dialogueManager.Initialize();

			this.m_actionStorylets = m_dialogueManager.Story
				.GetStoryletsWithTags( "action" )
				.ToDictionary( s => s.ID );

			this.m_locationStorylets = m_dialogueManager.Story
				.GetStoryletsWithTags( "location" )
				.ToDictionary( s => s.ID );

			GameEvents.GameUIShown?.Invoke();

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

	}
}
