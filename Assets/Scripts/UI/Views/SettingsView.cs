using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	public class SettingsView : UIView
	{
		// Visual elements

		Slider m_TextSpeedSlider;
		Button m_BackButton;

		public SettingsView(VisualElement topElement) : base( topElement )
		{

		}

		protected override void SetVisualElements()
		{
			m_BackButton = m_TopElement.Q( "BackBtn" ) as Button;
		}

		protected override void RegisterButtonCallbacks()
		{
			m_BackButton.RegisterCallback<ClickEvent>( BackButtonClick );
		}

		public override void Dispose()
		{
			m_BackButton.UnregisterCallback<ClickEvent>( BackButtonClick );
		}

		private void BackButtonClick(ClickEvent evt)
		{
			MainMenuUIEvents.HomeScreenShown?.Invoke();
		}
	}
}
