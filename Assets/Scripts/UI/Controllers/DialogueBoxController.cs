using System.Collections;
using System.Text;
using UnityEngine;

namespace Academical
{
	public class DialoguePanelController : MonoBehaviour
	{
		#region Constants

		/// <summary>
		/// The base delay time (in seconds) between characters for the type writer effect.
		/// </summary>
		public const float k_TypeWriterDelaySeconds = 0.4f;

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
		/// The time delay between displaying the next character during the typewriter effect.
		/// </summary>
		[SerializeField]
		private GameSettingsSO m_GameSettings;

		/// <summary>
		/// The current choice to select in the dialogue (-1 halts dialogue progression)
		/// </summary>
		private int m_userChoiceIndex = -1;

		/// <summary>
		/// Delay in seconds between showing characters in the GUI.
		/// </summary>
		[Header( "Text Display" )]
		[SerializeField] private float m_TypingSpeed = k_TypeWriterDelaySeconds;

		#endregion

		#region Properties

		/// <summary>
		/// Is the controller currently typing text to the dialogue box.
		/// </summary>
		public bool IsTyping { get; private set; }

		#endregion

		#region Unity Messages

		private void OnEnable()
		{
			SubscribeToEvents();
		}

		private void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		private void Update()
		{
			m_TypingSpeed = k_TypeWriterDelaySeconds * (1.0f - m_GameSettings.TextSpeed);
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

		#endregion

		#region Private Methods

		private void SubscribeToEvents()
		{
			DialogueEvents.DialogueStarted += HandleDialogueStarted;
			DialogueEvents.DialogueEnded += HandleDialogueEnded;
			DialogueEvents.AdvanceDialogueButtonClicked += HandleAdvanceDialogueButtonClicked;
			DialogueEvents.OnNextDialogueLine += HandleDialogueLine;
		}

		private void UnsubscribeFromEvents()
		{
			DialogueEvents.DialogueStarted -= HandleDialogueStarted;
			DialogueEvents.DialogueEnded -= HandleDialogueEnded;
			DialogueEvents.AdvanceDialogueButtonClicked -= HandleAdvanceDialogueButtonClicked;
			DialogueEvents.OnNextDialogueLine -= HandleDialogueLine;
		}

		private void HandleDialogueStarted()
		{
			DialogueEvents.DialogueUIShown?.Invoke();
		}

		private void HandleDialogueEnded()
		{
			DialogueEvents.DialogueUIHidden?.Invoke();
		}

		private void HandleAdvanceDialogueButtonClicked()
		{
			DialogueEvents.DialogueAdvanced?.Invoke();
			DialogueEvents.AdvanceDialogueButtonDisabled?.Invoke();
		}

		private void HandleDialogueLine(string text)
		{
			// if ( m_typingCoroutine != null ) StopCoroutine( m_typingCoroutine );

			// IsTyping = true;

			// DialogueEvents.AdvanceDialogueButtonDisabled?.Invoke();

			// m_typingCoroutine = StartCoroutine( DisplayTextCoroutine( text ) );
			DialogueEvents.DialogueTextChanged?.Invoke( text );
			DialogueEvents.AdvanceDialogueButtonEnabled?.Invoke();
		}

		/// <summary>
		/// A callback executed when a choice button is clicked in the choice dialog box
		/// </summary>
		/// <param name="choiceIndex"></param>
		private void HandleChoiceSelection(int choiceIndex)
		{
			m_userChoiceIndex = choiceIndex;
		}

		/// <summary>
		/// Displays text using a typewriter effect where each character appears once at a time.
		/// </summary>
		/// <returns></returns>
		private IEnumerator DisplayTextCoroutine(string text)
		{
			DialogueEvents.AdvanceDialogueButtonDisabled?.Invoke();

			if ( text != "" )
			{
				StringBuilder dialogueTextBuffer = new StringBuilder();
				DialogueEvents.DialogueTextChanged?.Invoke( dialogueTextBuffer.ToString() );

				foreach ( char letter in text.ToCharArray() )
				{
					if ( m_skipTypewriterEffect )
					{
						DialogueEvents.DialogueTextChanged?.Invoke( text );
						m_skipTypewriterEffect = false;
						break;
					}

					dialogueTextBuffer.Append( letter );
					DialogueEvents.DialogueTextChanged?.Invoke( dialogueTextBuffer.ToString() );
					yield return new WaitForSeconds( m_TypingSpeed );
				}
			}

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
			DialogueEvents.AdvanceDialogueButtonEnabled?.Invoke();
			IsTyping = false;
			// }
		}

		#endregion
	}
}
