using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	public class CreditsView : UIView
	{
		// Visual Elements
		Button m_BackButton;

		public CreditsView(VisualElement topElement) : base( topElement )
		{

		}

		protected override void SetVisualElements()
		{
			m_BackButton = m_TopElement.Q<Button>( "Credits__BackBtn" );
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
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.CreditsScreenHidden?.Invoke();
		}
	}
}
