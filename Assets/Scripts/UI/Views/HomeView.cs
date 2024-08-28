using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	public class HomeView : UIView
	{
		// Visual Elements
		Button m_NewGameButton;
		Button m_LoadGameButton;
		Button m_SettingsButton;
		Button m_CreditsButton;
		Button m_QuitButton;

		public HomeView(VisualElement topElement) : base( topElement )
		{

		}

		protected override void SetVisualElements()
		{
			m_NewGameButton = m_TopElement.Q<Button>( "Home__NewGameBtn" );
			m_LoadGameButton = m_TopElement.Q<Button>( "Home__LoadGameBtn" );
			m_SettingsButton = m_TopElement.Q<Button>( "Home__SettingsBtn" );
			m_CreditsButton = m_TopElement.Q<Button>( "Home__CreditsBtn" );
			m_QuitButton = m_TopElement.Q<Button>( "Home__QuitBtn" );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_NewGameButton.clicked += OnNewGameButtonClicked;
			m_LoadGameButton.clicked += OnLoadGameButtonClicked;
			m_SettingsButton.clicked += OnSettingsButtonClicked;
			m_CreditsButton.clicked += OnCreditsButtonClicked;
			m_QuitButton.clicked += OnQuitButtonClicked;
		}

		public override void Dispose()
		{
			m_NewGameButton.clicked -= OnNewGameButtonClicked;
			m_LoadGameButton.clicked -= OnLoadGameButtonClicked;
			m_SettingsButton.clicked -= OnSettingsButtonClicked;
			m_CreditsButton.clicked -= OnCreditsButtonClicked;
			m_QuitButton.clicked -= OnQuitButtonClicked;
		}

		void OnNewGameButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.NewGameScreenShown?.Invoke();
		}

		void OnLoadGameButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.LoadGameScreenShown?.Invoke();
		}

		void OnSettingsButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.SettingsScreenShown?.Invoke();
		}

		void OnCreditsButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.CreditsScreenShown?.Invoke();
		}

		void OnQuitButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			// Do nothing.
		}
	}
}
