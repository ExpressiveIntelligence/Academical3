using TDRS;
using TMPro;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Displays the current date and location in the HUD.
	/// </summary>
	public class DateLocationHudUI : MonoBehaviour
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private TMP_Text m_DateTextMesh;

		[SerializeField]
		private TMP_Text m_LocationTextMesh;

		[SerializeField]
		private GameManager m_GameManager;

		private void Update()
		{
			UpdateDate();
			UpdateLocation();
		}

		public void UpdateDate()
		{
			m_DateTextMesh.text = $"Day {m_GameManager.CurrentDate.Day}";
		}

		public void UpdateLocation()
		{
			// m_LocationTextMesh.text = m_GameManager.Player.Location.name;
		}
	}
}
