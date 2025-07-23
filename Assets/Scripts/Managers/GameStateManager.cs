using UnityEngine;
using UnityEditor;

namespace Academical
{
	/// <summary>
	/// Maintains the game state across scenes.
	/// </summary>
	public class GameStateManager : MonoBehaviour
	{
		[SerializeField]
		private GameLevelSO m_LevelData;

		private GameState m_GameState;

		public static GameStateManager Instance { get; private set; }

		public GameLevelSO LevelData => m_LevelData;

		private void Awake()
		{
			if ( Instance != null )
			{
				Debug.LogWarning( "Multiple GameStateManager instances found. Destroying self." );
				Destroy( gameObject );
				return;
			}

			Instance = this;
			m_GameState = new GameState();
			DontDestroyOnLoad( gameObject );

			//Safety check GameLevelSO. If there's no main.json, the game crashes. This will attempt to load the main.json from the resources folder.
			//TODO: Refactor into a util class - used in multiple classes.
			if ( m_LevelData.inkScript == null )
			{
				m_LevelData.inkScript = Resources.Load<TextAsset>( "main" );
				//If we still failed to fetch, log an error
				if ( m_LevelData.inkScript == null )
				{
					Debug.LogError( "No main.json in Resources! Please recompile Ink; game will crash without it." );
				}
			}
		}

		public static void NewGame()
		{
			Instance.m_GameState = new GameState();
		}

		public static void SetGameState(GameState gameState)
		{
			if ( Instance != null )
			{
				Instance.m_GameState = gameState;
			}
		}

		public static GameState GetGameState()
		{
			if ( Instance != null )
			{
				return Instance.m_GameState;
			}

			return null;
		}
	}
}
