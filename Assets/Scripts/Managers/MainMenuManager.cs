using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Academical
{
	[DefaultExecutionOrder( 2 )]
	public class MainMenuManager : MonoBehaviour
	{
		#region Fields

		[Header( "Story Scenarios" )]
		[SerializeField] private GameLevelSO[] m_Scenarios;

		private UIComponent m_CurrentView;
		private UIComponent m_PreviousView;

		[Header( "UI Screens" )]
		[SerializeField]
		private UIComponent m_MainMenu;
		[SerializeField]
		private UIComponent m_CreditsScreen;
		[SerializeField]
		private UIComponent m_SettingsScreen;
		[SerializeField]
		private UIComponent m_LoadGameScreen;
		[SerializeField]
		private UIComponent m_ScenarioSelectionScreen;

		#endregion

		#region Unity Messages

		void Start()
		{
			MainMenuUIEvents.HomeScreenShown?.Invoke();
		}

		void OnEnable()
		{
			SetupViews();

			SubscribeToEvents();
		}

		void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		#endregion

		#region Private Methods

		void SubscribeToEvents()
		{
			MainMenuUIEvents.HomeScreenShown += OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown += OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown += OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown += OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown += OnCreditsScreenShown;
			MainMenuUIEvents.CreditsScreenHidden += OnCreditScreenHidden;
			MainMenuUIEvents.NewGameScreenHidden += OnScenarioSelectionScreenHidden;
			MainMenuUIEvents.LoadGameScreenHidden += OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden += OnSettingsScreenHidden;
			GameEvents.LevelSelected += OnLevelSelected;
			MainMenuUIEvents.NewGameScreenShown += OnScenarioSelectionShown;
		}

		void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.HomeScreenShown -= OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown -= OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown -= OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown -= OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown -= OnCreditsScreenShown;
			MainMenuUIEvents.CreditsScreenHidden -= OnCreditScreenHidden;
			MainMenuUIEvents.NewGameScreenHidden -= OnScenarioSelectionScreenHidden;
			MainMenuUIEvents.LoadGameScreenHidden -= OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden -= OnSettingsScreenHidden;
			GameEvents.LevelSelected -= OnLevelSelected;
			MainMenuUIEvents.NewGameScreenShown -= OnScenarioSelectionShown;
		}

		void SetupViews()
		{
			m_MainMenu.Hide();
			m_SettingsScreen.Hide();
			m_ScenarioSelectionScreen.Hide();
			// m_LoadGameScreen.Hide();
			m_CreditsScreen.Hide();
		}

		void ShowScreen(UIComponent newView)
		{
			if ( m_CurrentView != null )
			{
				m_CurrentView.Hide();
			}

			m_PreviousView = m_CurrentView;
			m_CurrentView = newView;

			if ( m_CurrentView != null )
			{
				m_CurrentView.Show();
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		void OnMainMenuScreenShown()
		{
			ShowScreen( m_MainMenu );
		}

		void OnSettingsScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_SettingsScreen.Show();
		}

		void OnSettingsScreenHidden()
		{
			m_SettingsScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		void OnScenarioSelectionScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_ScenarioSelectionScreen.Show();
		}

		void OnScenarioSelectionScreenHidden()
		{
			m_ScenarioSelectionScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		void OnLoadGameScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_LoadGameScreen.Show();
		}

		void OnLoadGameScreenHidden()
		{
			m_LoadGameScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		void OnCreditsScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_CreditsScreen.Show();
		}

		void OnCreditScreenHidden()
		{
			m_CreditsScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		private void OnLevelSelected(GameLevelSO scenarioData)
		{
			SceneManager.LoadScene( scenarioData.Scene );
		}

		private void OnScenarioSelectionShown()
		{
			NewGameScreenEvents.LevelsUpdated?.Invoke( m_Scenarios.ToList() );
		}

		#endregion
	}
}
