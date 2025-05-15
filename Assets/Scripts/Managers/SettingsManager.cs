using UnityEngine;

namespace Academical
{
	/// <summary>
	/// The <c>SettingsManager</c> is responsible tracking the current values
	/// for various game settings like audio and text speed. This class is a
	/// singleton. There should not be more than one instance of this
	/// MonoBehaviour in a single scene. This class automatically saves and
	/// load settings values from the current platform's PlayerPrefs
	/// location.
	/// </summary>
	public class SettingsManager : MonoBehaviour
	{
		/// <summary>
		/// The key used to store settings JSON within PlayerPrefs.
		/// </summary>
		private const string k_SettingsPlayerPrefKey = "settings";

		/// <summary>
		/// Toggle if the SettingsManager should be destroyed when loading a new scene.
		/// </summary>
		[SerializeField]
		private bool m_DontDestroyOnLoad;

		/// <summary>
		/// The current settings values.
		/// </summary>
		[SerializeField]
		private GameSettings m_Settings;

		/// <summary>
		/// The current SettingsManager singleton instance.
		/// </summary>
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

			if ( m_DontDestroyOnLoad )
			{
				DontDestroyOnLoad( this );
			}
		}

		private void Start()
		{
			// Attempt to load settings from PlayerPrefs
			// If it succeeds, update the settings with those loaded in
			// otherwise, just pass a new settings object.
			GameSettings playerPrefSettings = LoadSettingsFromPlayerPrefs();
			if ( playerPrefSettings != null )
			{
				UpdateSettings( playerPrefSettings );
			}
			else
			{
				UpdateSettings( new GameSettings() );
			}
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

		/// <summary>
		/// Load a GameSettings instance from PlayerPrefs
		/// </summary>
		/// <returns>GameSettings or null if none found in PlayerPrefs.</returns>
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
