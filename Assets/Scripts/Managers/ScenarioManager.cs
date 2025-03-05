using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages a list of scenarios that players can select between when starting the game.
	/// </summary>
	public class ScenarioManager : MonoBehaviour
	{
		[SerializeField]
		private string m_ResourcesPath = "Levels";

		[SerializeField]
		private GameLevelSO[] m_Scenarios;

		private Dictionary<string, GameLevelSO> m_AllScenarios = new Dictionary<string, GameLevelSO>();

		public static ScenarioManager Instance { get; private set; }

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( this );
				return;
			}

			Instance = this;
			LoadScenariosFromInspector();
			LoadScenariosFromResources();
			DontDestroyOnLoad( this );
		}


		/// <summary>
		/// Get a scenario using its unique ID.
		/// </summary>
		/// <param name="scenarioId"></param>
		/// <returns></returns>
		public static GameLevelSO GetScenario(string scenarioId)
		{
			Instance.m_AllScenarios.TryGetValue( scenarioId, out var scenario );
			return scenario;
		}

		/// <summary>
		/// Get all scenarios.
		/// </summary>
		/// <returns></returns>
		public static GameLevelSO[] GetAllScenarios()
		{
			return Instance.m_AllScenarios.Values.ToArray();
		}

		/// <summary>
		/// Load scenario scriptable objects provided in the inspector.
		/// </summary>
		private void LoadScenariosFromInspector()
		{
			foreach ( GameLevelSO entry in m_Scenarios )
			{
				m_AllScenarios[entry.ScenarioId] = entry;
			}
		}

		/// <summary>
		/// Load scenario scriptable objects from the resources folder.
		/// </summary>
		private void LoadScenariosFromResources()
		{
			GameLevelSO[] scenarios = Resources.LoadAll<GameLevelSO>( m_ResourcesPath );
			foreach ( GameLevelSO entry in scenarios )
			{
				m_AllScenarios[entry.ScenarioId] = entry;
			}
		}
	}
}
