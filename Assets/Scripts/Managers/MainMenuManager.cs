using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Academical
{
	[DefaultExecutionOrder( 2 )]
	public class MainMenuManager : MonoBehaviour
	{
		#region Fields

		private UIComponent m_CurrentView;
		private UIComponent m_PreviousView;

		[SerializeField]
		private ScenarioManager m_ScenarioManager;

		[Header( "UI Screens" )]
		[SerializeField]
		private UIComponent m_MainMenu;

		[SerializeField]
		private UIComponent m_CreditsScreen;

		[SerializeField]
		private UIComponent m_SettingsScreen;

		// [SerializeField]
		// private UIComponent m_LoadGameScreen;

		[SerializeField]
		private UIComponent m_ScenarioSelectionScreen;

		[SerializeField]
		private LoadingGameScreen m_LoadingScreen;

		private AsyncOperation m_SceneLoadingOperation;

		#endregion

		#region Properties

		public static MainMenuManager Instance { get; private set; }

		public ScenarioManager ScenarioManager => m_ScenarioManager;

		#endregion

		#region Unity Messages

		private void Awake()
		{
			if ( Instance != null )
			{
				Debug.LogWarning( "Multiple MainMenuManager instances found. Destroying self." );
				Destroy( gameObject );
				return;
			}

			Instance = this;
		}

		void Start()
		{
			ShowHomeScreen();
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
			MainMenuUIEvents.HomeScreenShown += ShowHomeScreen;
			MainMenuUIEvents.SettingsScreenShown += ShowSettingsScreen;
			MainMenuUIEvents.NewGameScreenShown += ShowScenarioSelectionScreen;
			// MainMenuUIEvents.LoadGameScreenShown += ShowLoadGameScreen;
			MainMenuUIEvents.CreditsScreenShown += ShowCreditsScreen;
			MainMenuUIEvents.CreditsScreenHidden += HideCreditScreen;
			MainMenuUIEvents.NewGameScreenHidden += HideScenarioSelectionScreen;
			// MainMenuUIEvents.LoadGameScreenHidden += OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden += HideSettingsScreen;
			GameEvents.LevelSelected += StartNewGame;
		}

		void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.HomeScreenShown -= ShowHomeScreen;
			MainMenuUIEvents.SettingsScreenShown -= ShowSettingsScreen;
			MainMenuUIEvents.NewGameScreenShown -= ShowScenarioSelectionScreen;
			// MainMenuUIEvents.LoadGameScreenShown -= ShowLoadGameScreen;
			MainMenuUIEvents.CreditsScreenShown -= ShowCreditsScreen;
			MainMenuUIEvents.CreditsScreenHidden -= HideCreditScreen;
			MainMenuUIEvents.NewGameScreenHidden -= HideScenarioSelectionScreen;
			// MainMenuUIEvents.LoadGameScreenHidden -= OnLoadGameScreenHidden;
			MainMenuUIEvents.SettingsScreenHidden -= HideSettingsScreen;
			GameEvents.LevelSelected -= StartNewGame;
		}

		void SetupViews()
		{
			m_MainMenu.Hide();
			m_SettingsScreen.Hide();
			m_ScenarioSelectionScreen.Hide();
			// m_LoadGameScreen.Hide();
			m_CreditsScreen.Hide();
			m_LoadingScreen.Hide();
		}

		private void ShowScreen(UIComponent newView)
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

		public void ShowHomeScreen()
		{
			ShowScreen( m_MainMenu );
		}

		public void ShowSettingsScreen()
		{
			m_PreviousView = m_CurrentView;
			m_SettingsScreen.Show();
		}

		public void HideSettingsScreen()
		{
			m_SettingsScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		public void ShowScenarioSelectionScreen()
		{
			m_PreviousView = m_CurrentView;
			m_ScenarioSelectionScreen.Show();
		}

		public void HideScenarioSelectionScreen()
		{
			m_ScenarioSelectionScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		// public void ShowLoadGameScreen()
		// {
		// 	m_PreviousView = m_CurrentView;
		// 	m_LoadGameScreen.Show();
		// }

		// public void OnLoadGameScreenHidden()
		// {
		// 	m_LoadGameScreen.Hide();

		// 	if ( m_PreviousView != null )
		// 	{
		// 		m_PreviousView.Show();
		// 		m_CurrentView = m_PreviousView;
		// 		MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
		// 	}
		// }

		public void ShowCreditsScreen()
		{
			m_PreviousView = m_CurrentView;
			m_CreditsScreen.Show();
		}

		public void HideCreditScreen()
		{
			m_CreditsScreen.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		public void ShowLoadingScreen()
		{
			ShowScreen( m_LoadingScreen );
		}

		public void StartNewGame()
		{
			GameLevelSO scenario =
				ScenarioManager.GetScenario( GameStateManager.GetGameState().scenarioId );
			m_SceneLoadingOperation = SceneManager.LoadSceneAsync( scenario.Scene );
			StartCoroutine( LoadGameScene() );
		}

		public void StartGameFromSave()
		{
			GameLevelSO scenario =
				ScenarioManager.GetScenario( DataPersistenceManager.SaveData.scenarioId );
			m_SceneLoadingOperation = SceneManager.LoadSceneAsync( scenario.Scene );
			StartCoroutine( LoadGameScene() );
		}

		private IEnumerator LoadGameScene()
		{
			while ( !m_SceneLoadingOperation.isDone )
			{
				MainMenuUIEvents.GameLoadingProgressUpdated?.Invoke(
					m_SceneLoadingOperation.progress );

				yield return null;
			}
		}

		#endregion
	}
}
