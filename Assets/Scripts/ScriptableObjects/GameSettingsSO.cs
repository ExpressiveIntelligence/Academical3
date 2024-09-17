using UnityEngine;
using UnityEngine.Audio;

namespace Academical
{
	/// <summary>
	/// GameSettingsSO is a Scriptable object that holds setting for audio, text presentation,
	/// and level loading.
	/// </summary>
	[CreateAssetMenu( fileName = "GameSettings", menuName = "Academical/GameSettings", order = 1 )]
	public class GameSettingsSO : ScriptableObject
	{
		// Default ScriptableObject data
		const float k_DefaultMasterVolume = 1f;
		const float k_DefaultSFXVolume = 1f;
		const float k_DefaultMusicVolume = 0f;
		const float k_DefaultTextSpeed = 0.5f;

		[Header( "Game Settings" )]
		[Tooltip( "The level to load when starting the main game" )]
		public GameLevelSO gameLevel;

		[Tooltip( "The speed at which text is presented" )]
		[Range( 0.0f, 1.0f )]
		[SerializeField] private float m_TextSpeed = k_DefaultTextSpeed;

		[Header( "Mixer" )]
		[Tooltip( "The AudioMixer that controls the audio levels for the game" )]
		[SerializeField] private AudioMixer m_AudioMixer;

		[Header( "Volume Settings" )]
		[Tooltip( "The master volume level (0 to 1)" )]
		[Range( 0.0f, 1.0f )]
		[SerializeField] private float m_MasterVolume = k_DefaultMasterVolume;

		[Tooltip( "The sound effects volume level (0 to 1)" )]
		[Range( 0.0f, 1.0f )]
		[SerializeField] private float m_SoundEffectsVolume = k_DefaultSFXVolume;

		[Tooltip( "The music volume level (0 to 1)" )]
		[Range( 0.0f, 1.0f )]
		[SerializeField] private float m_MusicVolume = k_DefaultMusicVolume;

		[Header( "Mute Settings" )]
		[Tooltip( "Mute or unmute the master volume" )]
		[SerializeField] private bool m_IsMasterMuted = false;

		[Tooltip( "Mute or unmute the sound effects volume" )]
		[SerializeField] private bool m_IsSoundEffectsMuted = false;

		[Tooltip( "Mute or unmute the music volume" )]
		[SerializeField] private bool m_IsMusicMuted = false;

		public AudioMixer AudioMixer => m_AudioMixer;

		public float TextSpeed { get => m_TextSpeed; set => m_TextSpeed = value; }
		public float MasterVolume { get => m_MasterVolume; set => m_MasterVolume = value; }
		public float SoundEffectsVolume { get => m_SoundEffectsVolume; set => m_SoundEffectsVolume = value; }
		public float MusicVolume { get => m_MusicVolume; set => m_MusicVolume = value; }

		public bool IsMasterMuted { get => m_IsMasterMuted; set => m_IsMasterMuted = value; }
		public bool IsSoundEffectsMuted { get => m_IsSoundEffectsMuted; set => m_IsSoundEffectsMuted = value; }
		public bool IsMusicMuted { get => m_IsMusicMuted; set => m_IsMusicMuted = value; }

		private void OnEnable()
		{
			SettingsEvents.TextSpeedChanged += OnTextSpeedChanged;
			SettingsEvents.MasterVolumeChanged += OnMasterVolumeChanged;
			SettingsEvents.MusicVolumeChanged += OnMusicVolumeChanged;
			SettingsEvents.SFXVolumeChanged += OnSFXVolumeChanged;
		}

		private void OnDisable()
		{
			SettingsEvents.TextSpeedChanged -= OnTextSpeedChanged;
			SettingsEvents.MasterVolumeChanged -= OnMasterVolumeChanged;
			SettingsEvents.MusicVolumeChanged -= OnMusicVolumeChanged;
			SettingsEvents.SFXVolumeChanged -= OnSFXVolumeChanged;
		}

		//Update the text speed when the event is triggered
		private void OnTextSpeedChanged(float speed)
		{
			TextSpeed = speed;
		}

		// Update the master volume when the event is triggered.
		private void OnMasterVolumeChanged(float volume)
		{
			MasterVolume = volume;
		}

		// Update the sound effects volume when the event is triggered.
		private void OnSFXVolumeChanged(float volume)
		{
			SoundEffectsVolume = volume;
		}

		// Update the music volume when the event is triggered.
		private void OnMusicVolumeChanged(float volume)
		{
			MusicVolume = volume;
		}
	}
}
