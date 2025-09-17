using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Academical
{
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

			AudioManager.PlayMusicImmediate( "Lobby Time", loop: true, volume: 1f );
		}

		void OnEnable()
		{
			GameEvents.LevelSelected += StartGame;
		}

		void OnDisable()
		{
			GameEvents.LevelSelected -= StartGame;
		}

		#endregion

		public void StartGame()
		{
			if ( DataPersistenceManager.SaveData == null )
			{
				GameStateManager.NewGame();
			}

			m_SceneLoadingOperation = SceneManager.LoadSceneAsync(
				GameStateManager.Instance.LevelData.scenePath );
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
