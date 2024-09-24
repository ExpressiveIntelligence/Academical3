using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class EffectTooltipEntry : MonoBehaviour
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private TMP_Text m_Text;

		[SerializeField]
		private Image m_Icon;

		public void SetText(string text)
		{
			m_Text.text = text;
		}

		public void SetIcon(Sprite icon)
		{
			m_Icon.sprite = icon;
		}
	}
}
