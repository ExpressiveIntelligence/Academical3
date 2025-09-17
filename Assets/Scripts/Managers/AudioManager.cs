// Code adapted from: Dragon Crashers UI Toolkit Sample
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
	public class AudioManager : MonoBehaviour
	{
		public const string k_MasterGroup = "Master";
		public const string k_MusicGroup  = "Music";
		public const string k_SfxGroup    = "SFX";
		private const string k_Parameter  = "_Volume";

		[SerializeField] private AudioMixer m_MainAudioMixer;

		[Header("UI Sounds")]
		[Tooltip("Button Click")]
		[SerializeField] private AudioClip m_DefaultButtonSound;

		[Header("Game Sounds")]
		[Tooltip("Sound played when the player accomplishes something.")]
		[SerializeField] private AudioClip m_SuccessSound;

		[Tooltip("Sound played when a notification is shown.")]
		[SerializeField] private AudioClip m_NotificationSound;

		[Tooltip("Sounds played when the player fails at something.")]
		[SerializeField] private AudioClip m_FailureSound;

		// === Music Manager Additions ===
		[Header("Music (Optional)")]
		[Tooltip("Provide clips here (referenced by clip name), or leave empty and place files in Resources/Music to load by name at runtime.")]
		[SerializeField] private List<AudioClip> m_MusicClips = new List<AudioClip>();

		[Tooltip("Default crossfade duration when switching tracks.")]
		[SerializeField] private float m_DefaultMusicFadeSeconds = 1.0f;

		[Tooltip("Per-track volume (0..1) applied on the AudioSource. Mixer 'Music' group still controls overall music level.")]
		[SerializeField] [Range(0f, 1f)] private float m_DefaultTrackVolume = 1.0f;

		[Tooltip("If true, this AudioManager won't be destroyed between scene loads.")]
		[SerializeField] private bool m_PersistAcrossScenes = false;

		private readonly Dictionary<string, AudioClip> m_MusicByName = new Dictionary<string, AudioClip>();
		private AudioSource m_MusicA;
		private AudioSource m_MusicB;
		private AudioSource m_ActiveMusic;
		private AudioSource m_IdleMusic;
		private Coroutine m_CrossfadeCo;

		// Base (pre-multiplied) volumes for the two music sources.
		// On non-WebGL, these are the actual AudioSource.volume values.
		// On WebGL, final source volume = base * Master * Music.
		private float m_ActiveBaseVol = 0f;
		private float m_IdleBaseVol = 0f;

		public static AudioManager Instance { get; private set; }

		private void Awake()
		{
			if (Instance == null)
			{
				Instance = this;
				if (m_PersistAcrossScenes)
					DontDestroyOnLoad(gameObject);

				// Build double-buffered music sources
				m_MusicA = CreateMusicSource("Music_A");
				m_MusicB = CreateMusicSource("Music_B");
				m_ActiveMusic = m_MusicA;
				m_IdleMusic   = m_MusicB;

				// Index music clips by name for quick lookup
				for (int i = 0; i < m_MusicClips.Count; i++)
				{
					TryIndexMusic(m_MusicClips[i]);
				}
			}
			else
			{
				Destroy(this);
			}
		}

		private void Start()
		{
			GameSettings gameSettings = SettingsManager.Settings;
			OnSettingsUpdated(gameSettings);
		}

		void OnEnable()
		{
			GameEvents.SettingsUpdated += OnSettingsUpdated;
		}

		void OnDisable()
		{
			GameEvents.SettingsUpdated -= OnSettingsUpdated;
		}

		private void OnSettingsUpdated(GameSettings gameSettings)
		{
			// use the GameState to set the music and sfx volume
			SetVolume(k_MasterGroup + k_Parameter, gameSettings.MasterVolume / 100f);
			SetVolume(k_MusicGroup  + k_Parameter, gameSettings.MusicVolume  / 100f);
			SetVolume(k_SfxGroup    + k_Parameter, gameSettings.SfxVolume    / 100f);

#if UNITY_WEBGL
			// On WebGL we can't rely on mixer groups for per-group attenuation in the same way.
			// Keep currently-playing music sources in sync with Master & Music levels.
			ApplyWebGLMusicVolumes();
#endif
		}

		// =========================
		// Existing SFX / Mixer API
		// =========================

		// return an AudioMixerGroup by name
		public static AudioMixerGroup GetAudioMixerGroup(string groupName)
		{
			if (Instance == null)
				return null;

			if (Instance.m_MainAudioMixer == null)
				return null;

			AudioMixerGroup[] groups = Instance.m_MainAudioMixer.FindMatchingGroups(groupName);

			foreach (AudioMixerGroup match in groups)
			{
				if (match.ToString() == groupName)
					return match;
			}
			return null;
		}

		// convert linear value between 0 and 1 to decibels
		public static float GetDecibelValue(float linearValue)
		{
			// commonly used for linear to decibel conversion
			float conversionFactor = 20f;
			float decibelValue = (linearValue != 0) ? conversionFactor * Mathf.Log10(linearValue) : -144f;
			return decibelValue;
		}

		// convert decibel value to a range between 0 and 1
		public static float GetLinearValue(float decibelValue)
		{
			float conversionFactor = 20f;
			return Mathf.Pow(10f, decibelValue / conversionFactor);
		}

		// converts linear value between 0 and 1 into decibels and sets AudioMixer level
		public static void SetVolume(string groupName, float linearValue)
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return;

			float decibelValue = GetDecibelValue(linearValue);

			if (audioManager.m_MainAudioMixer != null)
			{
				audioManager.m_MainAudioMixer.SetFloat(groupName, decibelValue);
			}
		}

		public static float GetVolume(string groupName)
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return 0f;

			float decibelValue = 0f;
			if (audioManager.m_MainAudioMixer != null)
			{
				audioManager.m_MainAudioMixer.GetFloat(groupName, out decibelValue);
			}
			return GetLinearValue(decibelValue);
		}

		public static void PlayDefaultButtonSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return;

			PlayOneSFX(audioManager.m_DefaultButtonSound, Vector3.zero);
		}

		public static void PlaySuccessSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return;

			PlayOneSFX(audioManager.m_SuccessSound, Vector3.zero);
		}

		public static void PlayNotificationSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return;

			PlayOneSFX(audioManager.m_NotificationSound, Vector3.zero);
		}

		public static void PlayFailureSound()
		{
			AudioManager audioManager = FindObjectOfType<AudioManager>();
			if (audioManager == null)
				return;

			PlayOneSFX(audioManager.m_FailureSound, Vector3.zero);
		}

		public static void PlayOneSFX(AudioClip clip, Vector3 sfxPosition)
		{
			if (clip == null)
				return;

			GameObject sfxInstance = new GameObject(clip.name);
			sfxInstance.transform.position = sfxPosition;

			AudioSource source = sfxInstance.AddComponent<AudioSource>();
			source.clip = clip;

#if UNITY_WEBGL
			// Apply Master * SFX on WebGL explicitly so SFX always obey settings.
			float master = GetVolume(k_MasterGroup + k_Parameter);
			float sfx    = GetVolume(k_SfxGroup    + k_Parameter);
			source.volume = Mathf.Clamp01(master * sfx);
#else
			// set the mixer group (e.g. music, sfx, etc.)
			source.outputAudioMixerGroup = GetAudioMixerGroup(k_SfxGroup);
#endif

			source.Play();

			// destroy after clip length
			Destroy(sfxInstance, clip.length);
		}

		// =========================
		// Music: Crossfade / Play
		// =========================

		/// <summary>Play a track immediately by name (no fade). Looks in Music Library first, then Resources/Music/&lt;name&gt;.</summary>
		public static void PlayMusicImmediate(string clipName, bool loop = true, float volume = -1f)
		{
			if (Instance == null) return;
			Instance.Music_PlayImmediateByName(clipName, loop, volume);
		}

		/// <summary>Play a track immediately by clip (no fade).</summary>
		public static void PlayMusicImmediate(AudioClip clip, bool loop = true, float volume = -1f)
		{
			if (Instance == null) return;
			Instance.Music_PlayImmediate(clip, loop, volume);
		}

		/// <summary>Crossfade to a track by name. If the same track is active, just updates loop/volume.</summary>
		public static void CrossfadeMusicTo(string clipName, float fadeSeconds = -1f, bool loop = true, float volume = -1f)
		{
			if (Instance == null) return;
			Instance.Music_CrossfadeToByName(clipName, fadeSeconds, loop, volume);
		}

		/// <summary>Crossfade to a track by clip. If the same track is active, just updates loop/volume.</summary>
		public static void CrossfadeMusicTo(AudioClip clip, float fadeSeconds = -1f, bool loop = true, float volume = -1f)
		{
			if (Instance == null) return;
			Instance.Music_CrossfadeTo(clip, fadeSeconds, loop, volume);
		}

		/// <summary>Stop music with an optional fade out.</summary>
		public static void StopMusic(float fadeOutSeconds = 0.5f)
		{
			if (Instance == null) return;
			Instance.Music_Stop(fadeOutSeconds);
		}

		public static string CurrentMusicTrackName
		{
			get
			{
				if (Instance == null || Instance.m_ActiveMusic == null || Instance.m_ActiveMusic.clip == null)
					return null;
				return Instance.m_ActiveMusic.clip.name;
			}
		}

		public static bool IsMusicPlaying
		{
			get
			{
				return (Instance != null && Instance.m_ActiveMusic != null && Instance.m_ActiveMusic.isPlaying);
			}
		}

		// ---- Instance-side Music Implementation ----

		private AudioSource CreateMusicSource(string childName)
		{
			var go = new GameObject(childName);
			go.transform.SetParent(transform, false);
			var src = go.AddComponent<AudioSource>();
			src.playOnAwake = false;
			src.loop = true;     // caller can override per call
			src.volume = 0f;
			src.spatialBlend = 0f; // 2D

#if UNITY_WEBGL
			// No mixer group assignment on WebGL path (matches SFX approach)
			src.volume = 0f; // will be set via base * Master * Music
#else
			var musicGroup = GetAudioMixerGroup(k_MusicGroup);
			if (musicGroup != null)
				src.outputAudioMixerGroup = musicGroup;
#endif
			return src;
		}

		private void TryIndexMusic(AudioClip clip)
		{
			if (clip == null) return;
			string key = clip.name.Trim().ToLowerInvariant();
			if (!m_MusicByName.ContainsKey(key))
				m_MusicByName.Add(key, clip);
		}

		private AudioClip ResolveMusicByName(string name)
		{
			if (string.IsNullOrEmpty(name)) return null;
			string key = name.Trim().ToLowerInvariant();

			AudioClip found;
			if (m_MusicByName.TryGetValue(key, out found))
				return found;

			// Fallback: Resources/Music/<name> or lowercased
			AudioClip res = Resources.Load<AudioClip>("Music/" + name);
			if (res == null && name != key)
				res = Resources.Load<AudioClip>("Music/" + key);

			if (res != null)
			{
				TryIndexMusic(res);
				return res;
			}

			Debug.LogWarning("[AudioManager] Music not found: " + name + " (add to Music Library or place under Resources/Music)");
			return null;
		}

		private void Music_PlayImmediateByName(string clipName, bool loop, float volume)
		{
			AudioClip clip = ResolveMusicByName(clipName);
			if (clip == null) return;
			Music_PlayImmediate(clip, loop, volume);
		}

		private void Music_PlayImmediate(AudioClip clip, bool loop, float volume)
		{
			if (clip == null) return;

			if (m_CrossfadeCo != null) { StopCoroutine(m_CrossfadeCo); m_CrossfadeCo = null; }

			// Prepare active
			m_ActiveMusic.Stop();
			m_ActiveMusic.clip = clip;
			m_ActiveMusic.loop = loop;
			m_ActiveBaseVol    = (volume >= 0f ? Mathf.Clamp01(volume) : m_DefaultTrackVolume);
			m_ActiveMusic.time = 0f;

#if UNITY_WEBGL
			ApplyWebGLMusicVolumes(); // sets actual source volumes using base * Master * Music
#else
			m_ActiveMusic.volume = m_ActiveBaseVol;
#endif
			m_ActiveMusic.Play();

			// Ensure idle is silent / cleared
			m_IdleMusic.Stop();
			m_IdleMusic.clip = null;
			m_IdleMusic.volume = 0f;
			m_IdleBaseVol = 0f;
		}

		private void Music_CrossfadeToByName(string clipName, float fadeSeconds, bool loop, float volume)
		{
			AudioClip clip = ResolveMusicByName(clipName);
			if (clip == null) return;
			Music_CrossfadeTo(clip, fadeSeconds, loop, volume);
		}

		private void Music_CrossfadeTo(AudioClip clip, float fadeSeconds, bool loop, float volume)
		{
			if (clip == null) return;

			if (fadeSeconds < 0f) fadeSeconds = m_DefaultMusicFadeSeconds;
			float targetBaseVol = (volume < 0f ? m_DefaultTrackVolume : Mathf.Clamp01(volume));

			// Same clip already active? Just update props.
			if (m_ActiveMusic.clip == clip)
			{
				m_ActiveMusic.loop = loop;
				m_ActiveBaseVol = targetBaseVol;
#if UNITY_WEBGL
				ApplyWebGLMusicVolumes();
#else
				m_ActiveMusic.volume = m_ActiveBaseVol;
#endif
				if (!m_ActiveMusic.isPlaying) m_ActiveMusic.Play();
				return;
			}

			// Prep idle
			m_IdleMusic.Stop();
			m_IdleMusic.clip = clip;
			m_IdleMusic.loop = loop;
			m_IdleMusic.time = 0f;
			m_IdleBaseVol = 0f;
#if UNITY_WEBGL
			ApplyWebGLMusicVolumes();
#else
			m_IdleMusic.volume = 0f;
#endif
			m_IdleMusic.Play();

			if (m_CrossfadeCo != null) StopCoroutine(m_CrossfadeCo);
			m_CrossfadeCo = StartCoroutine(CoCrossfade(m_ActiveMusic, m_IdleMusic, fadeSeconds, targetBaseVol, delegate
			{
				// swap active/idle + their base volumes
				AudioSource tmp = m_ActiveMusic; m_ActiveMusic = m_IdleMusic; m_IdleMusic = tmp;
				float tmpVol = m_ActiveBaseVol; m_ActiveBaseVol = m_IdleBaseVol; m_IdleBaseVol = tmpVol;

				// clean idle
				m_IdleMusic.Stop();
				m_IdleMusic.clip = null;
				m_IdleMusic.volume = 0f;
				m_IdleBaseVol = 0f;

#if UNITY_WEBGL
				ApplyWebGLMusicVolumes();
#endif
			}));
		}

		private void Music_Stop(float fadeOutSeconds)
		{
			if (m_CrossfadeCo != null) { StopCoroutine(m_CrossfadeCo); m_CrossfadeCo = null; }

			if (fadeOutSeconds <= 0f)
			{
				m_ActiveMusic.Stop(); m_IdleMusic.Stop();
				m_ActiveMusic.clip = null; m_IdleMusic.clip = null;
				m_ActiveMusic.volume = 0f; m_IdleMusic.volume = 0f;
				m_ActiveBaseVol = 0f; m_IdleBaseVol = 0f;
				return;
			}

			StartCoroutine(CoFadeOutThenStop(m_ActiveMusic, fadeOutSeconds));
			m_IdleMusic.Stop();
			m_IdleMusic.clip = null;
			m_IdleMusic.volume = 0f;
			m_IdleBaseVol = 0f;
		}

		private IEnumerator CoCrossfade(AudioSource from, AudioSource to, float seconds, float toTargetBaseVol, System.Action onDone)
		{
			if (seconds <= 0f)
			{
				// instant
				if (from != null) { m_ActiveBaseVol = (from == m_ActiveMusic) ? 0f : m_ActiveBaseVol; from.volume = 0f; }
				if (to   != null) { m_IdleBaseVol   = (to   == m_IdleMusic)   ? toTargetBaseVol : m_IdleBaseVol; to.volume = toTargetBaseVol; }
#if UNITY_WEBGL
				ApplyWebGLMusicVolumes();
#endif
				if (onDone != null) onDone();
				yield break;
			}

			// Figure out which base volumes map to which source
			bool fromIsActive = (from == m_ActiveMusic);
			float startFromBase = fromIsActive ? m_ActiveBaseVol : m_IdleBaseVol;
			float startToBase   = to   == m_IdleMusic ? m_IdleBaseVol : m_ActiveBaseVol;

			float t = 0f;
			while (t < seconds)
			{
				t += Time.unscaledDeltaTime; // ignore pause
				float k = Mathf.Clamp01(t / seconds);

				float newFromBase = Mathf.Lerp(startFromBase, 0f, k);
				float newToBase   = Mathf.Lerp(startToBase,   toTargetBaseVol, k);

				// assign back to the correct base variables
				if (fromIsActive) m_ActiveBaseVol = newFromBase; else m_IdleBaseVol = newFromBase;
				if (to   == m_IdleMusic) m_IdleBaseVol = newToBase; else m_ActiveBaseVol = newToBase;

#if UNITY_WEBGL
				// Final volumes = base * Master * Music
				ApplyWebGLMusicVolumes();
#else
				from.volume = (fromIsActive ? m_ActiveBaseVol : m_IdleBaseVol);
				to.volume   = (to   == m_IdleMusic ? m_IdleBaseVol : m_ActiveBaseVol);
#endif
				yield return null;
			}

			// Finalize
			if (fromIsActive) m_ActiveBaseVol = 0f; else m_IdleBaseVol = 0f;
			if (to   == m_IdleMusic) m_IdleBaseVol = toTargetBaseVol; else m_ActiveBaseVol = toTargetBaseVol;

#if UNITY_WEBGL
			ApplyWebGLMusicVolumes();
#else
			from.volume = 0f;
			to.volume   = toTargetBaseVol;
#endif

			if (onDone != null) onDone();
		}

		private IEnumerator CoFadeOutThenStop(AudioSource src, float seconds)
		{
			if (src == null || !src.isPlaying) yield break;

			// Determine which base volume to adjust
			bool srcIsActive = (src == m_ActiveMusic);
			float startBase = srcIsActive ? m_ActiveBaseVol : m_IdleBaseVol;

			float t = 0f;
			while (t < seconds)
			{
				t += Time.unscaledDeltaTime;
				float newBase = Mathf.Lerp(startBase, 0f, t / seconds);
				if (srcIsActive) m_ActiveBaseVol = newBase; else m_IdleBaseVol = newBase;

#if UNITY_WEBGL
				ApplyWebGLMusicVolumes();
#else
				src.volume = newBase;
#endif
				yield return null;
			}
			src.Stop();
			src.clip = null;
#if UNITY_WEBGL
			if (srcIsActive) m_ActiveBaseVol = 0f; else m_IdleBaseVol = 0f;
			ApplyWebGLMusicVolumes();
#else
			src.volume = 0f;
			if (srcIsActive) m_ActiveBaseVol = 0f; else m_IdleBaseVol = 0f;
#endif
		}

#if UNITY_WEBGL
		// Keep WebGL source volumes in sync with mixer scalars since we don't route through groups here.
		// Final volume per music source = base * Master * Music.
		private void ApplyWebGLMusicVolumes()
		{
			float master = GetVolume(k_MasterGroup + k_Parameter);
			float music  = GetVolume(k_MusicGroup  + k_Parameter);
			float mm = Mathf.Clamp01(master * music);

			if (m_ActiveMusic != null)
				m_ActiveMusic.volume = Mathf.Clamp01(m_ActiveBaseVol) * mm;

			if (m_IdleMusic != null)
				m_IdleMusic.volume   = Mathf.Clamp01(m_IdleBaseVol)   * mm;
		}
#endif
	}
}
