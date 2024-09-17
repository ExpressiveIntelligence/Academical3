using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueToolbarView : UIView
	{
		private Button m_HistoryButton;

		public DialogueToolbarView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_HistoryButton = m_TopElement.Q<Button>( "DialogueToolbar__historyButton" );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_HistoryButton.clicked += OnHistoryButtonClicked;
		}

		public override void Dispose()
		{
			m_HistoryButton.clicked -= OnHistoryButtonClicked;
		}

		private void OnHistoryButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			DialogueEvents.DialogueHistoryShown?.Invoke();
		}
	}
}
