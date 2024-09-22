using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	public class SettingsView : UIView
	{
		private Slider m_TextSpeedSlider;
		private Slider m_MasterVolumeSlider;
		private Slider m_SfxVolumeSlider;
		private Slider m_MusicVolumeSlider;
		private Button m_BackButton;

		public SettingsView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_TextSpeedSlider = m_TopElement.Q<Slider>( "Settings__textSpeed" );
			m_MasterVolumeSlider = m_TopElement.Q<Slider>( "Settings__masterVolume" );
			m_SfxVolumeSlider = m_TopElement.Q<Slider>( "Settings__sfxVolume" );
			m_MusicVolumeSlider = m_TopElement.Q<Slider>( "Settings__musicVolume" );
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
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.SettingsScreenHidden?.Invoke();
		}
	}
}
