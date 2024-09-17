using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueBoxView : UIView
	{
		private Label m_SpeakerName;
		private Label m_DialogueText;
		private Button m_AdvanceDialogueButton;

		public DialogueBoxView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_SpeakerName = m_TopElement.Q<Label>( "DialogueBox__speaker" );
			m_DialogueText = m_TopElement.Q<Label>( "DialogueBox__text" );
			m_AdvanceDialogueButton = m_TopElement.Q<Button>( "DialogueBox__advanceButton" );
		}

		protected override void RegisterButtonCallbacks()
		{
			DialogueEvents.AdvanceDialogueButtonDisabled += HandleAdvanceDialogueDisabled;
			DialogueEvents.AdvanceDialogueButtonEnabled += HandleAdvanceDialogueEnabled;
			DialogueEvents.DialogueTextChanged += HandleDialogueTextChanged;
			DialogueEvents.SpeakerNameChanged += HandleSpeakerNameChange;
			DialogueEvents.DialogueUIShown += HandleDialogueUIShown;
			m_AdvanceDialogueButton.clicked += OnAdvanceDialogueButtonClicked;
		}

		public override void Dispose()
		{
			DialogueEvents.AdvanceDialogueButtonDisabled -= HandleAdvanceDialogueDisabled;
			DialogueEvents.AdvanceDialogueButtonEnabled -= HandleAdvanceDialogueEnabled;
			DialogueEvents.DialogueTextChanged -= HandleDialogueTextChanged;
			DialogueEvents.SpeakerNameChanged -= HandleSpeakerNameChange;
			DialogueEvents.DialogueUIShown -= HandleDialogueUIShown;
			m_AdvanceDialogueButton.clicked -= OnAdvanceDialogueButtonClicked;
		}

		public void SetSpeakerName(string name)
		{
			m_SpeakerName.text = name;
		}

		public void SetText(string text)
		{
			m_DialogueText.text = text;
		}

		public void SetAdvanceDialogueButtonEnabled(bool isEnabled)
		{
			if ( isEnabled )
			{
				m_AdvanceDialogueButton.style.display = DisplayStyle.Flex;
			}
			else
			{
				m_AdvanceDialogueButton.style.display = DisplayStyle.None;
			}
		}

		private void OnAdvanceDialogueButtonClicked()
		{
			DialogueEvents.AdvanceDialogueButtonClicked?.Invoke();
		}

		private void HandleAdvanceDialogueDisabled()
		{
			SetAdvanceDialogueButtonEnabled( false );
		}

		private void HandleAdvanceDialogueEnabled()
		{
			SetAdvanceDialogueButtonEnabled( true );
		}

		private void HandleDialogueTextChanged(string text)
		{
			SetText( text );
		}

		private void HandleSpeakerNameChange(string text)
		{
			SetSpeakerName( text );
		}

		private void HandleDialogueUIShown()
		{
			Show();
		}
	}
}
