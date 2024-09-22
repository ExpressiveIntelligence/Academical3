using UnityEngine;

namespace Academical
{
	public class LegacyUIManager : MonoBehaviour
	{
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
		private UIComponent m_DialogueHistoryScreen;
		[SerializeField]
		private UIComponent m_ScenarioSelectionScreen;

		void OnEnable()
		{
			SetupViews();

			SubscribeToEvents();
		}

		void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		void SubscribeToEvents()
		{
			MainMenuUIEvents.HomeScreenShown += OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown += OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown += OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown += OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown += OnCreditsScreenShown;
			MainMenuUIEvents.DialogueHistoryShown += OnDialogueHistoryScreenShown;
			MainMenuUIEvents.CreditsScreenHidden += OnCreditScreenHidden;
			MainMenuUIEvents.NewGameScreenHidden += OnScenarioSelectionScreenHidden;
			MainMenuUIEvents.DialogueHistoryHidden += OnDialogueHistoryScreenHidden;
			MainMenuUIEvents.LoadGameScreenHidden += OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden += OnSettingsScreenHidden;
			GameEvents.GameUIShown += OnDialogueScreenShown;
		}

		void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.HomeScreenShown -= OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown -= OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown -= OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown -= OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown -= OnCreditsScreenShown;
			MainMenuUIEvents.DialogueHistoryShown -= OnDialogueHistoryScreenShown;
			MainMenuUIEvents.CreditsScreenHidden -= OnCreditScreenHidden;
			MainMenuUIEvents.NewGameScreenHidden -= OnScenarioSelectionScreenHidden;
			MainMenuUIEvents.DialogueHistoryHidden -= OnDialogueHistoryScreenHidden;
			MainMenuUIEvents.LoadGameScreenHidden -= OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden -= OnSettingsScreenHidden;
			GameEvents.GameUIShown -= OnDialogueScreenShown;
		}

		void SetupViews()
		{
			// m_AllViews.Add( m_MainMenuScreen );
			// m_AllViews.Add( m_SettingsScreen );
			// m_AllViews.Add( m_ScenarioSelectionScreen );
			// m_AllViews.Add( m_LoadGameScreen );
			// // m_AllViews.Add( m_SaveGameScreen );
			// m_AllViews.Add( m_CreditsScreen );
			// m_AllViews.Add( m_DialogueScreen );
			// // m_AllViews.Add( m_DialogueHistoryScreen );

			m_MainMenu.Hide();
			m_SettingsScreen.Hide();
			m_ScenarioSelectionScreen.Hide();
			// m_LoadGameScreen.Hide();
			// m_SaveGameScreen.Hide();
			m_CreditsScreen.Hide();
			m_DialogueHistoryScreen.Hide();
			// m_DialogueHistoryScreen.Hide();
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

		void OnDialogueScreenShown()
		{
			// ShowScreen( m_DialogueScreen );
		}

		void OnDialogueHistoryScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_DialogueHistoryScreen.Show();
		}

		void OnDialogueHistoryScreenHidden()
		{
			m_DialogueHistoryScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

	}
}
