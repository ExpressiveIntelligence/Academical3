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
		[SerializeField] private TMP_Dropdown m_TextSpeedDropdown;
		[SerializeField] private Slider m_MasterVolumeSlider;
		[SerializeField] private TMP_Text m_MasterVolumeValueLabel;
		[SerializeField] private Slider m_BGMVolumeSlider;
		[SerializeField] private TMP_Text m_BGMVolumeValueLabel;
		[SerializeField] private Slider m_SFXVolumeSlider;
		[SerializeField] private TMP_Text m_SFXVolumeValueLabel;

		private GameSettings m_GameSettings;

		#endregion

		#region Unity Lifecycle Methods

		protected override void Awake()
		{
			base.Awake();
			m_GameSettings = new GameSettings();
		}

		#endregion

		#region Public Methods

		public override void Show()
		{
			base.Show();
			UpdateSettingControls( SettingsManager.Settings );
		}

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( OnBackButtonClicked );
			m_TextSpeedDropdown.onValueChanged.AddListener( OnTextSpeedChanged );
			m_MasterVolumeSlider.onValueChanged.AddListener( OnMasterVolumeChanged );
			m_BGMVolumeSlider.onValueChanged.AddListener( OnBGMVolumeChanged );
			m_SFXVolumeSlider.onValueChanged.AddListener( OnSFXVolumeChanged );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( OnBackButtonClicked );
			m_TextSpeedDropdown.onValueChanged.RemoveListener( OnTextSpeedChanged );
			m_MasterVolumeSlider.onValueChanged.RemoveListener( OnMasterVolumeChanged );
			m_BGMVolumeSlider.onValueChanged.RemoveListener( OnBGMVolumeChanged );
			m_SFXVolumeSlider.onValueChanged.RemoveListener( OnSFXVolumeChanged );
		}

		#endregion

		#region Private Methods

		private void UpdateSettingControls(GameSettings gameSettings)
		{
			m_GameSettings = new GameSettings( gameSettings );
			SetMasterVolume( gameSettings.MasterVolume );
			SetSfxVolume( gameSettings.SfxVolume );
			SetMusicVolume( gameSettings.MusicVolume );
			SetTextSpeed( gameSettings.TextSpeed );
		}

		public void OnBackButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
		}

		public void SetMasterVolume(float value)
		{
			m_MasterVolumeValueLabel.text = $"{(int)value}";
			m_GameSettings.MasterVolume = (int)value;
			m_MasterVolumeSlider.SetValueWithoutNotify( value );

		}

		public void SetSfxVolume(float value)
		{
			m_SFXVolumeValueLabel.text = $"{(int)value}";
			m_GameSettings.SfxVolume = (int)value;
			m_SFXVolumeSlider.SetValueWithoutNotify( value );
		}

		public void SetMusicVolume(float value)
		{
			m_BGMVolumeValueLabel.text = $"{(int)value}";
			m_GameSettings.MusicVolume = (int)value;
			m_BGMVolumeSlider.SetValueWithoutNotify( value );
		}

		public void SetTextSpeed(TextSpeed value)
		{
			m_GameSettings.TextSpeed = value;
			m_TextSpeedDropdown.SetValueWithoutNotify( (int)value );
		}

		public void OnMasterVolumeChanged(float value)
		{
			SetMasterVolume( value );
			SettingsManager.UpdateSettings( m_GameSettings );
		}

		public void OnBGMVolumeChanged(float value)
		{
			SetMusicVolume( value );
			SettingsManager.UpdateSettings( m_GameSettings );
		}

		public void OnSFXVolumeChanged(float value)
		{
			SetSfxVolume( value );
			SettingsManager.UpdateSettings( m_GameSettings );
		}

		public void OnTextSpeedChanged(int value)
		{
			AudioManager.PlayDefaultButtonSound();
			SetTextSpeed( (TextSpeed)value );
			SettingsManager.UpdateSettings( m_GameSettings );
		}

		#endregion
	}
}
