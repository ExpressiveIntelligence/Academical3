using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// A UI Toolkit implementation of the InteractionPanel included
	/// with Anansi version 0.5.
	/// </summary>
	public class InteractionPanelView : UIView
	{
		private Button m_ChooseActionButton;
		private Button m_ViewQuestsButton;
		private Button m_ChooseLocationButton;

		public InteractionPanelView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_ChooseActionButton = m_TopElement.Q<Button>( "InteractionPanel__ChooseActionButton" );
			m_ViewQuestsButton = m_TopElement.Q<Button>( "InteractionPanel__ViewQuestsButton" );
			m_ChooseLocationButton = m_TopElement.Q<Button>(
				"InteractionPanel__ChooseLocationButton" );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_ChooseActionButton.clicked += OnChooseActionButtonClicked;
			m_ViewQuestsButton.clicked += OnViewQuestsButtonClicked;
			m_ChooseLocationButton.clicked += OnChooseLocationButtonClicked;
		}

		public override void Dispose()
		{
			m_ChooseActionButton.clicked -= OnChooseActionButtonClicked;
			m_ViewQuestsButton.clicked -= OnViewQuestsButtonClicked;
			m_ChooseLocationButton.clicked -= OnChooseLocationButtonClicked;
		}

		private void OnChooseActionButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.ActionSelectModalShown?.Invoke();
		}

		private void OnViewQuestsButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.QuestsViewShown?.Invoke();
		}

		private void OnChooseLocationButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.LocationSelectModalShown?.Invoke();
		}
	}
}
