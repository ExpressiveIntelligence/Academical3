using UnityEngine;
using UnityEngine.UI;
using TMPro;


namespace Academical
{
	public class SettingsScreenController : UIComponent
	{
		#region region

		[Header( "UI Elements" )]
		[SerializeField] private Button m_BackButton;
		[SerializeField] private Slider m_TextSpeedSlider;
		[SerializeField] private TMP_Text m_TextSpeedValueLabel;
		[SerializeField] private Slider m_MasterVolumeSlider;
		[SerializeField] private TMP_Text m_MasterVolumeValueLabel;
		[SerializeField] private Slider m_BGMVolumeSlider;
		[SerializeField] private TMP_Text m_BGMVolumeValueLabel;
		[SerializeField] private Slider m_SFXVolumeSlider;
		[SerializeField] private TMP_Text m_SFXVolumeValueLabel;

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( OnBackButtonClicked );
			m_TextSpeedSlider.onValueChanged.AddListener( OnTextSpeedChanged );
			m_MasterVolumeSlider.onValueChanged.AddListener( OnMasterVolumeChanged );
			m_BGMVolumeSlider.onValueChanged.AddListener( OnBGMVolumeChanged );
			m_SFXVolumeSlider.onValueChanged.AddListener( OnSFXVolumeChanged );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( OnBackButtonClicked );
			m_TextSpeedSlider.onValueChanged.RemoveListener( OnTextSpeedChanged );
			m_MasterVolumeSlider.onValueChanged.RemoveListener( OnMasterVolumeChanged );
			m_BGMVolumeSlider.onValueChanged.RemoveListener( OnBGMVolumeChanged );
			m_SFXVolumeSlider.onValueChanged.RemoveListener( OnSFXVolumeChanged );
		}

		#endregion

		#region Private Methods

		public void OnBackButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.SettingsScreenHidden?.Invoke();
		}

		public void OnMasterVolumeChanged(float value)
		{
			m_MasterVolumeValueLabel.text = $"{(int)value}";
			SettingsEvents.MasterVolumeChanged?.Invoke( value );
		}

		public void OnBGMVolumeChanged(float value)
		{
			m_BGMVolumeValueLabel.text = $"{(int)value}";
			SettingsEvents.MusicVolumeChanged?.Invoke( value );
		}

		public void OnSFXVolumeChanged(float value)
		{
			m_SFXVolumeValueLabel.text = $"{(int)value}";
			SettingsEvents.SFXVolumeChanged?.Invoke( value );
		}

		public void OnTextSpeedChanged(float value)
		{
			m_TextSpeedValueLabel.text = $"{(int)value}";
			SettingsEvents.TextSpeedChanged?.Invoke( value );
		}

		#endregion
	}
}
