using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Academical
{
	[DefaultExecutionOrder( 2 )]
	public class MainMenuManager : MonoBehaviour
	{
		#region Fields

		private AsyncOperation m_SceneLoadingOperation;

		#endregion

		#region Properties

		public static MainMenuManager Instance { get; private set; }

		#endregion

		#region Unity Messages

		private void Awake()
		{
			if ( Instance != null )
			{
				Debug.LogWarning( "Multiple MainMenuManager instances found. Destroying self." );
				Destroy( gameObject );
				return;
			}

			Instance = this;
		}

		void OnEnable()
		{
			GameEvents.LevelSelected += StartNewGame;
		}

		void OnDisable()
		{
			GameEvents.LevelSelected -= StartNewGame;
		}

		#endregion

		public void StartNewGame()
		{
			GameLevelSO scenario =
				ScenarioManager.GetScenario( GameStateManager.GetGameState().scenarioId );
			m_SceneLoadingOperation = SceneManager.LoadSceneAsync( scenario.Scene );
			StartCoroutine( LoadGameScene() );
		}

		public void StartGameFromSave()
		{
			GameLevelSO scenario =
				ScenarioManager.GetScenario( DataPersistenceManager.SaveData.scenarioId );
			m_SceneLoadingOperation = SceneManager.LoadSceneAsync( scenario.Scene );
			StartCoroutine( LoadGameScene() );
		}

		private IEnumerator LoadGameScene()
		{
			while ( !m_SceneLoadingOperation.isDone )
			{
				GameEvents.GameLoadingProgressUpdated?.Invoke(
					m_SceneLoadingOperation.progress );

				yield return null;
			}
		}
	}
}
