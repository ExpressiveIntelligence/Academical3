using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// Manager for all the parts of the Main Menu UI.
	///
	/// This class us based on the UIManager class included in the Unity
	/// UI Toolkit Dragon Crashers sample project. It uses one top-level
	/// UXML and one UI document to manage things.
	/// </summary>
	[RequireComponent( typeof( UIDocument ) )]
	public class UIManager : MonoBehaviour
	{
		UIDocument m_UIDocument;

		// Track the current and previous views to allow the back button to function.

		UIView m_CurrentView;
		UIView m_PreviousView;

		// Save reference to all views for easy disposal

		List<UIView> m_AllViews = new List<UIView>();

		// References to each individual screen

		UIView m_MainMenuScreen;
		UIView m_SettingsScreen;
		UIView m_ScenarioSelectionScreen;
		UIView m_LoadGameScreen;
		UIView m_SaveGameScreen;
		UIView m_CreditsScreen;
		UIView m_DialogueScreen;
		UIView m_DialogueHistoryScreen;

		// Names of UI Element nodes in the UXML tree of the Main Menu document.

		public const string k_MainMenuScreenName = "HomeScreen";
		public const string k_SettingsScreenName = "SettingsScreen";
		public const string k_ScenarioSelectionScreenName = "NewGameScreen";
		public const string k_LoadGameScreenName = "LoadGameScreen";
		public const string k_SaveGameScreenName = "SaveGameScreen";
		public const string k_CreditsScreenName = "CreditsScreen";
		public const string k_DialogueScreenName = "GameUI";
		public const string k_DialogueHistoryScreenName = "DialogueHistoryScreen";

		public UIDocument MainMenuDocument => m_UIDocument;

		void OnEnable()
		{
			m_UIDocument = GetComponent<UIDocument>();

			SetupViews();

			SubscribeToEvents();
		}

		void OnDisable()
		{
			UnsubscribeFromEvents();

			foreach ( UIView view in m_AllViews )
			{
				view.Dispose();
			}
		}

		void SubscribeToEvents()
		{
			MainMenuUIEvents.HomeScreenShown += OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown += OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown += OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown += OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown += OnCreditsScreenShown;
			GameEvents.GameUIShown += OnDialogueScreenShown;
		}

		void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.HomeScreenShown -= OnMainMenuScreenShown;
			MainMenuUIEvents.SettingsScreenShown -= OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown -= OnScenarioSelectionScreenShown;
			MainMenuUIEvents.LoadGameScreenShown -= OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown -= OnCreditsScreenShown;
			GameEvents.GameUIShown -= OnDialogueScreenShown;
		}

		void SetupViews()
		{
			VisualElement root = m_UIDocument.rootVisualElement;

			m_MainMenuScreen = new HomeView( root.Q<VisualElement>( k_MainMenuScreenName ) );
			m_SettingsScreen = new SettingsView( root.Q<VisualElement>( k_SettingsScreenName ) );
			m_ScenarioSelectionScreen = new NewGameView( root.Q<VisualElement>( k_ScenarioSelectionScreenName ) );
			m_LoadGameScreen = new LoadGameView( root.Q<VisualElement>( k_LoadGameScreenName ) );
			m_CreditsScreen = new CreditsView( root.Q<VisualElement>( k_CreditsScreenName ) );
			m_DialogueScreen = new GameUIView( root.Q<VisualElement>( k_DialogueScreenName ) );

			m_AllViews.Add( m_MainMenuScreen );
			m_AllViews.Add( m_SettingsScreen );
			m_AllViews.Add( m_ScenarioSelectionScreen );
			m_AllViews.Add( m_LoadGameScreen );
			// m_AllViews.Add( m_SaveGameScreen );
			m_AllViews.Add( m_CreditsScreen );
			m_AllViews.Add( m_DialogueScreen );
			// m_AllViews.Add( m_DialogueHistoryScreen );

			m_MainMenuScreen.Hide();
			m_SettingsScreen.Hide();
			m_ScenarioSelectionScreen.Hide();
			m_LoadGameScreen.Hide();
			// m_SaveGameScreen.Hide();
			m_CreditsScreen.Hide();
			m_DialogueScreen.Hide();
			// m_DialogueHistoryScreen.Hide();
		}

		void ShowModalView(UIView newView)
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
			ShowModalView( m_MainMenuScreen );
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

		}

		void OnCreditsScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_CreditsScreen.Show();
		}

		void OnCreditScreenHidden()
		{

		}

		void OnDialogueScreenShown()
		{
			ShowModalView( m_DialogueScreen );
		}

		void OnDialogueHistoryScreenShown()
		{

		}

		void OnDialogueHistoryScreenHidden()
		{

		}
	}
}
