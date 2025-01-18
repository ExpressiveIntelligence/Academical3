using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Academical
{
	/// <summary>
	/// Manages a list of scenarios that players can select between when starting the game.
	/// </summary>
	public class ScenarioManager : MonoBehaviour
	{
		[SerializeField]
		private GameLevelSO[] m_Scenarios;

		private AsyncOperation m_SceneLoadingOperation;


		public GameLevelSO[] Scenarios => m_Scenarios;

		public void StartGame(string sceneName)
		{
			m_SceneLoadingOperation = SceneManager.LoadSceneAsync( sceneName );
			StartCoroutine( LoadGameScene() );
		}

		private IEnumerator LoadGameScene()
		{
			while ( !m_SceneLoadingOperation.isDone )
			{
				MainMenuUIEvents.GameLoadingProgressUpdated?.Invoke(
					m_SceneLoadingOperation.progress );

				yield return null;
			}
		}
	}
}
