using TMPro;
using UnityEngine;
using UnityEngine.UI;


namespace Academical
{
	/// <summary>
	/// UI Controller class for the main menu of the game
	/// </summary>
	public class MainMenuController : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private Button m_ScenarioSelectButton;
		[SerializeField] private Button m_LoadGameButton;
		[SerializeField] private Button m_SettingsButton;
		[SerializeField] private Button m_CreditsButton;
		[SerializeField] private Button m_ExitButton;
		[SerializeField] private TMP_Text m_VersionText;

		#endregion

		#region Protected Methods

		private void Start()
		{
			m_VersionText.text = $"Version: {Application.version}";
		}

		protected override void SubscribeToEvents()
		{
			m_ScenarioSelectButton.onClick.AddListener( OnScenarioSelectButtonClicked );
			m_LoadGameButton.onClick.AddListener( OnLoadGameButtonClicked );
			m_SettingsButton.onClick.AddListener( OnSettingsButtonClicked );
			m_CreditsButton.onClick.AddListener( OnCreditsButtonClicked );
			m_ExitButton.onClick.AddListener( OnExitButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_ScenarioSelectButton.onClick.RemoveListener( OnScenarioSelectButtonClicked );
			m_LoadGameButton.onClick.RemoveListener( OnLoadGameButtonClicked );
			m_SettingsButton.onClick.RemoveListener( OnSettingsButtonClicked );
			m_CreditsButton.onClick.RemoveListener( OnCreditsButtonClicked );
			m_ExitButton.onClick.RemoveListener( OnExitButtonClicked );
		}

		#endregion

		#region Private Methods

		private void OnScenarioSelectButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.NewGameScreenShown?.Invoke();
		}

		private void OnLoadGameButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.LoadGameScreenShown?.Invoke();
		}

		private void OnSettingsButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.SettingsScreenShown?.Invoke();
		}

		private void OnCreditsButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.CreditsScreenShown?.Invoke();
		}

		private void OnExitButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			Application.Quit();
		}

		#endregion
	}
}
