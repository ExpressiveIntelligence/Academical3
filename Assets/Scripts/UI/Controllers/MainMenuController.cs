using UnityEngine;


namespace Academical
{
	/// <summary>
	/// UI Controller class for the entire main menu.
	/// </summary>
	public class MainMenuController : MonoBehaviour
	{
		// private UIManager m_UIManager;

		private void Awake()
		{
			// m_UIManager = FindObjectOfType<UIManager>();
		}

		private void Start()
		{
			MainMenuUIEvents.HomeScreenShown?.Invoke();
			// m_UIManager.ShowMainMenuHome();
		}
	}
}
