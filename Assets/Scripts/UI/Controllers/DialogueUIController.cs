using System.Collections;
using Anansi;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class DialogueUIController : UIComponent
	{
		#region Fields

		/// <summary>
		/// A reference to the coroutine that handles displaying dialogue using the typewriter
		/// effect.
		/// </summary>
		private Coroutine m_typingCoroutine = null;

		/// <summary>
		/// Should the typing coroutine skip to the end of the dialogue line.
		/// </summary>
		private bool m_skipTypewriterEffect = false;

		/// <summary>
		/// Delay in seconds between showing characters in the GUI.
		/// </summary>
		[Header( "Text Display" )]
		private TextSpeed m_TextSpeed;

		[SerializeField]
		private float m_TypingDelaySlow = 0.2f;

		[SerializeField]
		private float m_TypingDelayDefault = 0.08f;

		[SerializeField]
		private float m_TypingDelayFast = 0.02f;

		private float m_TypingDelaySeconds;

		[Header( "UI Elements" )]
		[SerializeField]
		private TMP_Text m_SpeakerName;

		[SerializeField]
		private TMP_Text m_DialogueText;

		[SerializeField]
		private Button m_AdvanceDialogueButton;

		#endregion

		#region Properties

		/// <summary>
		/// Is the controller currently typing text to the dialogue box.
		/// </summary>
		public bool IsTyping { get; private set; }

		#endregion

		#region Unity Messages

		private void Start()
		{
			GameSettings gameSettings = SettingsManager.Settings;
			OnSettingsUpdated( gameSettings );
		}

		private void Update()
		{
			// m_TypingDelaySeconds = k_TypeWriterDelaySeconds * (1.0f - m_TextSpeed);
			if ( Input.GetKeyUp( KeyCode.Space ) )
			{
				JumpToEndOfText();
			}
		}

		#endregion

		#region Public Methods

		public override void Show()
		{
			base.Show();
			GameSettings gameSettings = SettingsManager.Settings;
			OnSettingsUpdated( gameSettings );
		}

		/// <summary>
		/// Bypass the typewriter effect and display the full line of text.
		/// </summary>
		public void JumpToEndOfText()
		{
			if ( IsTyping ) m_skipTypewriterEffect = true;
		}

		public void SetSpeakerName(string name)
		{
			m_SpeakerName.text = name;
		}

		public void SetDialogueText(string text)
		{
			m_DialogueText.text = text;
			m_DialogueText.maxVisibleCharacters = text.Length;
		}

		public void SetAdvanceDialogueButtonEnabled(bool isEnabled)
		{
			m_AdvanceDialogueButton.interactable = isEnabled;
		}

		#endregion

		#region Private Methods

		protected override void SubscribeToEvents()
		{
			DialogueEvents.DialogueStarted += HandleDialogueStarted;
			DialogueEvents.DialogueEnded += HandleDialogueEnded;
			m_AdvanceDialogueButton.onClick.AddListener( HandleAdvanceDialogueButtonClicked );
			DialogueEvents.OnNextDialogueLine += HandleDialogueLine;
			DialogueEvents.SpeakerChanged += OnSpeakerChanged;
			GameEvents.SettingsUpdated += OnSettingsUpdated;
		}

		protected override void UnsubscribeFromEvents()
		{
			DialogueEvents.DialogueStarted -= HandleDialogueStarted;
			DialogueEvents.DialogueEnded -= HandleDialogueEnded;
			m_AdvanceDialogueButton.onClick.RemoveListener( HandleAdvanceDialogueButtonClicked );
			DialogueEvents.OnNextDialogueLine -= HandleDialogueLine;
			DialogueEvents.SpeakerChanged -= OnSpeakerChanged;
			GameEvents.SettingsUpdated -= OnSettingsUpdated;
		}

		private void OnSettingsUpdated(GameSettings gameSettings)
		{
			m_TextSpeed = gameSettings.TextSpeed;

			switch ( m_TextSpeed )
			{
				case TextSpeed.SLOW:
					m_TypingDelaySeconds = m_TypingDelaySlow;
					break;
				case TextSpeed.DEFAULT:
					m_TypingDelaySeconds = m_TypingDelayDefault;
					break;
				case TextSpeed.FAST:
					m_TypingDelaySeconds = m_TypingDelayFast;
					break;
				default:
					m_TypingDelaySeconds = m_TypingDelayDefault;
					break;
			}
		}

		private void OnSpeakerChanged(SpeakerInfo info)
		{
			if ( info == null )
			{
				SetSpeakerName( "" );
			}
			else
			{
				SetSpeakerName( info.SpeakerName );
			}
		}

		private void HandleDialogueStarted()
		{
			Show();
		}

		private void HandleDialogueEnded()
		{
			Hide();
		}

		private void HandleAdvanceDialogueButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			DialogueEvents.DialogueAdvanced?.Invoke();
			// SetAdvanceDialogueButtonEnabled( false );
		}

		private void HandleDialogueLine(string text)
		{
			if ( m_typingCoroutine != null )
			{
				StopCoroutine( m_typingCoroutine );
				m_typingCoroutine = null;
			}

			m_typingCoroutine = StartCoroutine( DisplayTextCoroutine( text ) );
		}

		/// <summary>
		/// Displays text using a typewriter effect where each character appears once at a time.
		/// </summary>
		/// <returns></returns>
		private IEnumerator DisplayTextCoroutine(string text)
		{
			SetAdvanceDialogueButtonEnabled( false );

			if ( text == "" )
			{
				// Do Nothing
			}
			else if ( m_TextSpeed == TextSpeed.NO_DELAY )
			{
				m_DialogueText.text = text;
			}
			else
			{
				IsTyping = true;
				m_DialogueText.text = text;
				m_DialogueText.maxVisibleCharacters = 0;

				for ( int i = 0; i <= text.Length; i++ )
				{
					if ( m_skipTypewriterEffect )
					{
						break;
					}

					m_DialogueText.maxVisibleCharacters = i;
					yield return new WaitForSeconds( m_TypingDelaySeconds );
				}
			}

			IsTyping = false;
			m_skipTypewriterEffect = false;
			m_DialogueText.maxVisibleCharacters = text.Length;

			SetAdvanceDialogueButtonEnabled( true );
		}

		#endregion
	}
}
