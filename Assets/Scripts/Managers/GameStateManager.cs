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

			//Safety check GameLevelSO. If there's no main.json, the build crashes.
			if ( m_LevelData.inkScript == null )
			{
				string[] searchFolder = new string[] { "Assets" };
				string[] guids = AssetDatabase.FindAssets( "glob:main.json", searchFolder );
				//TODO: Move Logging errors to a constants file.
				if ( guids.Length == 0 )
				{
					Debug.LogError( "No main.json found in assets! Build will not execute properly." );
				}
				else if ( guids.Length > 1 )
				{
					Debug.LogError( "More than one main.json found in assets! Please ensure there is only one entry (main) JSON in the project." );
				}
				else
				{
					var inkStoryJsonPath = AssetDatabase.GUIDToAssetPath( guids[0] );
					m_LevelData.inkScript = (TextAsset)AssetDatabase.LoadAssetAtPath( inkStoryJsonPath, typeof( TextAsset ) );
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
