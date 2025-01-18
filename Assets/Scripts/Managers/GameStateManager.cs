using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Maintains the game state across scenes.
	/// </summary>
	public class GameStateManager : MonoBehaviour
	{
		private GameState m_GameState;

		[SerializeField]
		private GameLevelSO m_GameLevel;

		public static GameStateManager Instance { get; private set; }

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
			m_GameLevel = null;
			DontDestroyOnLoad( gameObject );
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

		public static GameLevelSO GetLevel()
		{
			if ( Instance != null )
			{
				return Instance.m_GameLevel;
			}

			return null;
		}

		public static void SetGameLevel(GameLevelSO gameLevel)
		{
			if ( Instance != null )
			{
				Instance.m_GameLevel = gameLevel;
			}
		}
	}
}
