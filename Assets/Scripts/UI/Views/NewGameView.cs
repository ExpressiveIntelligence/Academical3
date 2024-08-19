using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	public class NewGameView : UIView
	{
		// Visual Elements
		Button m_BackButton;

		public NewGameView(VisualElement topElement) : base( topElement )
		{

		}

		protected override void SetVisualElements()
		{
			m_BackButton = m_TopElement.Q<Button>( "BackBtn" );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_BackButton.clicked += OnBackButtonClicked;
		}

		public override void Dispose()
		{
			m_BackButton.clicked -= OnBackButtonClicked;
		}

		void OnBackButtonClicked()
		{
			MainMenuUIEvents.HomeScreenShown?.Invoke();
		}
	}
}
