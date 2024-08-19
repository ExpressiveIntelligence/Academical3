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
		UIDocument m_MainMenuDocument;

		// Track the current and previous views to allow the back button to function.

		UIView m_CurrentView;
		UIView m_PreviousView;

		// Save reference to all views for easy disposal
		List<UIView> m_AllViews = new List<UIView>();

		UIView m_HomeView;      // Landing screen
		UIView m_SettingsView;  // Settings screen
		UIView m_NewGameView;   // New game screen
		UIView m_LoadGameView;  // Load game screen
		UIView m_CreditsView;   // Game credits screen

		// Names of UI Element nodes in the UXML tree of the Main Menu document.

		public const string k_HomeViewName = "HomeScreen";
		public const string k_SettingsViewName = "SettingsScreen";
		public const string k_NewGameViewName = "NewGameScreen";
		public const string k_LoadGameViewName = "LoadGameScreen";
		public const string k_CreditsViewName = "CreditsScreen";

		public UIDocument MainMenuDocument => m_MainMenuDocument;

		void OnEnable()
		{
			m_MainMenuDocument = GetComponent<UIDocument>();

			SetupViews();

			SubscribeToEvents();

			ShowModalView( m_HomeView );
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
			MainMenuUIEvents.HomeScreenShown += OnHomeScreenShown;
			MainMenuUIEvents.SettingsScreenShown += OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown += OnNewGameScreenShown;
			MainMenuUIEvents.LoadGameScreenShown += OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown += OnCreditsScreenShown;
		}

		void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.HomeScreenShown -= OnHomeScreenShown;
			MainMenuUIEvents.SettingsScreenShown -= OnSettingsScreenShown;
			MainMenuUIEvents.NewGameScreenShown -= OnNewGameScreenShown;
			MainMenuUIEvents.LoadGameScreenShown -= OnLoadGameScreenShown;
			MainMenuUIEvents.CreditsScreenShown -= OnCreditsScreenShown;
		}

		void SetupViews()
		{
			VisualElement root = m_MainMenuDocument.rootVisualElement;

			m_HomeView = new HomeView( root.Q<VisualElement>( k_HomeViewName ) );
			m_SettingsView = new SettingsView( root.Q<VisualElement>( k_SettingsViewName ) );
			m_NewGameView = new NewGameView( root.Q<VisualElement>( k_NewGameViewName ) );
			m_LoadGameView = new LoadGameView( root.Q<VisualElement>( k_LoadGameViewName ) );
			m_CreditsView = new CreditsView( root.Q<VisualElement>( k_CreditsViewName ) );

			m_AllViews.Add( m_HomeView );
			m_AllViews.Add( m_SettingsView );
			m_AllViews.Add( m_NewGameView );
			m_AllViews.Add( m_LoadGameView );
			m_AllViews.Add( m_CreditsView );

			m_HomeView.Hide();
			m_SettingsView.Hide();
			m_NewGameView.Hide();
			m_LoadGameView.Hide();
			m_CreditsView.Hide();
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

		void OnHomeScreenShown()
		{
			ShowModalView( m_HomeView );
		}

		void OnSettingsScreenShown()
		{
			ShowModalView( m_SettingsView );
		}

		void OnNewGameScreenShown()
		{
			ShowModalView( m_NewGameView );
		}

		void OnLoadGameScreenShown()
		{
			ShowModalView( m_LoadGameView );
		}

		void OnCreditsScreenShown()
		{
			ShowModalView( m_CreditsView );
		}
	}
}
