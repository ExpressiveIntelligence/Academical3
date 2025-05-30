using UnityEngine;

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
