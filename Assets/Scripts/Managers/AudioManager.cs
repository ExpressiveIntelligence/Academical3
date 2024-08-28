// Code adapted from: Dragon Crashers UI Toolkit Sample
using UnityEngine;
using UnityEngine.Audio;

namespace Academical
{
	public class AudioManager : MonoBehaviour
	{
		public static string MusicGroup = "Music";
		public static string SfxGroup = "SFX";

		private const string k_Parameter = "Volume";

		[SerializeField] private AudioMixer m_MainAudioMixer;

		[Header( "UI Sounds" )]
		[Tooltip( "Button Click" )]
		[SerializeField] private AudioClip m_DefaultButtonSound;

		[Header( "Game Sounds" )]
		[Tooltip( "Sound played when the player accomplishes something." )]
		[SerializeField] private AudioClip m_SuccessSound;

		[Tooltip( "Sound played when a notification is shown." )]
		[SerializeField] private AudioClip m_NotificationSound;

		[Tooltip( "Sounds played when the player fails at something." )]
		[SerializeField] private AudioClip m_FailureSound;

		void OnEnable()
		{
			SettingsScreenEvents.SettingsUpdated += OnSettingsUpdated;
		}

		void OnDisable()
		{
			SettingsScreenEvents.SettingsUpdated -= OnSettingsUpdated;
		}

		private void OnSettingsUpdated(GameData gameData)
		{
			// use the gameData to set the music and sfx volume
			SetVolume( MusicGroup + k_Parameter, gameData.musicVolume / 100f );
			SetVolume( SfxGroup + k_Parameter, gameData.sfxVolume / 100f );
		}

		// return an AudioMixerGroup by name
		public static AudioMixerGroup GetAudioMixerGroup(string groupName)
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();

			if ( audioManager == null )
				return null;

			if ( audioManager.m_MainAudioMixer == null )
				return null;

			AudioMixerGroup[] groups = audioManager.m_MainAudioMixer.FindMatchingGroups( groupName );

			foreach ( AudioMixerGroup match in groups )
			{
				if ( match.ToString() == groupName )
					return match;
			}
			return null;

		}

		// convert linear value between 0 and 1 to decibels
		public static float GetDecibelValue(float linearValue)
		{
			// commonly used for linear to decibel conversion
			float conversionFactor = 20f;

			float decibelValue = (linearValue != 0) ? conversionFactor * Mathf.Log10( linearValue ) : -144f;
			return decibelValue;
		}

		// convert decibel value to a range between 0 and 1
		public static float GetLinearValue(float decibelValue)
		{
			float conversionFactor = 20f;

			return Mathf.Pow( 10f, decibelValue / conversionFactor );

		}

		// converts linear value between 0 and 1 into decibels and sets AudioMixer level
		public static void SetVolume(string groupName, float linearValue)
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return;

			float decibelValue = GetDecibelValue( linearValue );

			if ( audioManager.m_MainAudioMixer != null )
			{
				audioManager.m_MainAudioMixer.SetFloat( groupName, decibelValue );
			}
		}

		public static float GetVolume(string groupName)
		{

			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return 0f;

			float decibelValue = 0f;
			if ( audioManager.m_MainAudioMixer != null )
			{
				audioManager.m_MainAudioMixer.GetFloat( groupName, out decibelValue );
			}
			return GetLinearValue( decibelValue );
		}

		public static void PlayDefaultButtonSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return;

			PlayOneSFX( audioManager.m_DefaultButtonSound, Vector3.zero );
		}

		public static void PlaySuccessSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return;

			PlayOneSFX( audioManager.m_SuccessSound, Vector3.zero );
		}

		public static void PlayNotificationSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return;

			PlayOneSFX( audioManager.m_NotificationSound, Vector3.zero );
		}

		public static void PlayFailureSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if ( audioManager == null )
				return;

			PlayOneSFX( audioManager.m_FailureSound, Vector3.zero );
		}

		public static void PlayOneSFX(AudioClip clip, Vector3 sfxPosition)
		{
			if ( clip == null )
				return;

			GameObject sfxInstance = new GameObject( clip.name );
			sfxInstance.transform.position = sfxPosition;

			AudioSource source = sfxInstance.AddComponent<AudioSource>();
			source.clip = clip;
			source.Play();

			// set the mixer group (e.g. music, sfx, etc.)
			source.outputAudioMixerGroup = GetAudioMixerGroup( SfxGroup );

			// destroy after clip length
			Destroy( sfxInstance, clip.length );
		}


	}
}
