using UnityEngine;

namespace Academical
{
	/// <summary>
	/// A singleton class that manages the player's setting preferences;
	/// </summary>
	public class SettingsManager : MonoBehaviour
	{
		private const string k_SettingsPlayerPrefKey = "settings";

		[SerializeField]
		private GameSettings m_Settings;

		public static SettingsManager Instance { get; private set; }

		public static GameSettings Settings => Instance.m_Settings;

		private void Awake()
		{
			if ( Instance != null )
			{
				Debug.LogWarning( "Multiple SettingsManager instances found. Destroying self." );
				Destroy( gameObject );
				return;
			}

			Instance = this;
			GameSettings playerPrefSettings = LoadSettingsFromPlayerPrefs();
			if ( playerPrefSettings != null )
			{
				UpdateSettings( playerPrefSettings );
			}
			else
			{
				UpdateSettings( new GameSettings() );
			}

			DontDestroyOnLoad( this );
		}

		public static void UpdateSettings(GameSettings settings)
		{
			Instance.m_Settings = new GameSettings( settings );
			Instance.SaveSettingsToPlayerPrefs();
			GameEvents.SettingsUpdated?.Invoke( Instance.m_Settings );
		}

		private void SaveSettingsToPlayerPrefs()
		{
			string settingsJson = JsonUtility.ToJson( m_Settings );
			PlayerPrefs.SetString( k_SettingsPlayerPrefKey, settingsJson );
		}

		private GameSettings LoadSettingsFromPlayerPrefs()
		{
			if ( PlayerPrefs.HasKey( k_SettingsPlayerPrefKey ) )
			{
				string settingsJson = PlayerPrefs.GetString( k_SettingsPlayerPrefKey );
				GameSettings gameSettings = JsonUtility.FromJson<GameSettings>( settingsJson );
				return gameSettings;
			}

			return null;
		}
	}
}
