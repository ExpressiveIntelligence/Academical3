using System.Collections;
using System.Text;
using Anansi;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class DialogueUIController : UIComponent
	{
		#region Constants

		/// <summary>
		/// The base delay time (in seconds) between characters for the type writer effect.
		/// </summary>
		public const float k_TypeWriterDelaySeconds = 0.1f;

		#endregion

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
		// [Range( 0f, 1f )]
		// [SerializeField] private float m_TextSpeed = 1f;
		[SerializeField] private float m_TypingDelaySeconds = k_TypeWriterDelaySeconds;

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
			if ( isEnabled )
			{
				m_AdvanceDialogueButton.gameObject.SetActive( true );
			}
			else
			{
				m_AdvanceDialogueButton.gameObject.SetActive( false );
			}
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
		}

		protected override void UnsubscribeFromEvents()
		{
			DialogueEvents.DialogueStarted -= HandleDialogueStarted;
			DialogueEvents.DialogueEnded -= HandleDialogueEnded;
			m_AdvanceDialogueButton.onClick.RemoveListener( HandleAdvanceDialogueButtonClicked );
			DialogueEvents.OnNextDialogueLine -= HandleDialogueLine;
			DialogueEvents.SpeakerChanged -= OnSpeakerChanged;
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
			SetAdvanceDialogueButtonEnabled( false );
		}

		private void HandleDialogueLine(string text)
		{
			if ( m_typingCoroutine != null ) StopCoroutine( m_typingCoroutine );

			m_typingCoroutine = StartCoroutine( DisplayTextCoroutine( text ) );
		}

		/// <summary>
		/// Displays text using a typewriter effect where each character appears once at a time.
		/// </summary>
		/// <returns></returns>
		private IEnumerator DisplayTextCoroutine(string text)
		{
			SetAdvanceDialogueButtonEnabled( false );

			if ( text != "" )
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

				IsTyping = false;
				m_skipTypewriterEffect = false;
				m_DialogueText.maxVisibleCharacters = text.Length;
			}

			SetAdvanceDialogueButtonEnabled( true );

			// if ( m_DialogueManager.IsWaitingForInput )
			// {
			// 	m_inputPanel.HandleGetInput( m_DialogueManager.InputRequest );

			// 	yield return new WaitUntil( () => !m_DialogueManager.IsWaitingForInput );

			// 	m_inputPanel.Hide();

			// 	AdvanceDialogue();
			// }

			// if ( m_DialogueManager.Story.HasChoices() )
			// {
			// 	var choices = m_DialogueManager.FilteredChoices;
			// 	m_DialogueChoiceOptionsView.Show();

			// 	foreach ( var c in choices )
			// 	{
			// 		m_DialogueChoiceOptionsView.AddChoice( c );
			// 	}

			// 	yield return new WaitUntil( () => m_userChoiceIndex != -1 );

			// 	m_DialogueChoiceOptionsView.Hide();

			// 	m_DialogueManager.Story.ChooseChoiceIndex( m_userChoiceIndex );

			// 	m_userChoiceIndex = -1;

			// 	IsTyping = false;

			// 	// AdvanceDialogue();
			// }
			// else
			// {

			// }
		}

		#endregion
	}
}
