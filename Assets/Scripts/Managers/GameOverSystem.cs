using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Listens for changes to the current day and ends the game
	/// when the last day of the game is reached.
	/// </summary>
	public class GameOverSystem : MonoBehaviour
	{
		[SerializeField]
		private GameOverScreenUI m_GameOverScreen;

		[SerializeField]
		private int m_LastDay;

		private void OnEnable()
		{
			GameEvents.OnDayAdvanced += HandleDayAdvanced;
		}

		private void OnDisable()
		{
			GameEvents.OnDayAdvanced -= HandleDayAdvanced;
		}

		private void HandleDayAdvanced(int day)
		{
			if ( day >= m_LastDay )
			{
				EndGame();
			}
		}

		private void EndGame()
		{
			m_GameOverScreen.Show();
		}
	}
}


