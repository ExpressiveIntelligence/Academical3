using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages a list of game levels that players can select between when starting the game.
	/// </summary>
	public class GameLevelManager : MonoBehaviour
	{
		[SerializeField]
		private GameLevelSO[] m_Levels;

		[SerializeField]
		public bool m_DontDestroyOnLoad;

		public static GameLevelManager Instance { get; private set; }

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( this );
				return;
			}

			Instance = this;

			if ( m_DontDestroyOnLoad )
			{
				DontDestroyOnLoad( this );
			}
		}

		/// <summary>
		/// Retrieve game level data using a string Id.
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public GameLevelSO GetLevelById(string id)
		{
			foreach ( GameLevelSO level in m_Levels )
			{
				if ( level.id == id )
				{
					return level;
				}
			}

			return null;
		}

		/// <summary>
		/// Get all level data.
		/// </summary>
		/// <returns></returns>
		public GameLevelSO[] GetAllLevels()
		{
			return m_Levels;
		}
	}
}
