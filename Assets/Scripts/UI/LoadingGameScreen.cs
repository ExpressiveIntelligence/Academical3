using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	/// <summary>
	/// Screen shown to the player when loading a new game from the main menu.
	/// </summary>
	public class LoadingGameScreen : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Image m_LoadingProgressBar;

		protected override void SubscribeToEvents()
		{
			MainMenuUIEvents.GameLoadingProgressUpdated += UpdateProgressBar;
		}

		protected override void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.GameLoadingProgressUpdated -= UpdateProgressBar;
		}

		private void UpdateProgressBar(float progress)
		{
			m_LoadingProgressBar.fillAmount = progress;
		}
	}
}
