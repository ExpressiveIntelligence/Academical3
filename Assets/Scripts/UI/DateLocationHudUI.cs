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
			m_DateTextMesh.text = $"{m_GameManager.CurrentDate.DayEventLabel}";
		}

		public void UpdateLocation()
		{
			if ( m_GameManager.Player.Location != null )
			{
				m_LocationTextMesh.text = m_GameManager.Player.Location.DisplayName;
			}
			else
			{ 
				m_LocationTextMesh.text = "";
			}
		}
	}
}
