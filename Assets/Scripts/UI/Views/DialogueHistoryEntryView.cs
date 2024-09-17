using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueHistoryEntryView : UIView
	{
		private Label m_SpeakerName;
		private Label m_DialogueText;

		public DialogueHistoryEntryView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_SpeakerName = m_TopElement.Q<Label>( "HistoryEntry__speaker" );
			m_DialogueText = m_TopElement.Q<Label>( "HistoryEntry__text" );
		}

		public void SetSpeakerName(string name)
		{
			m_SpeakerName.text = name;
		}

		public void SetDialogueText(string text)
		{
			m_DialogueText.text = text;
		}
	}
}
