using TMPro;
using UnityEngine;

namespace Academical
{
	public class DilemmaStepUI : MonoBehaviour
	{
		[SerializeField]
		private TMP_Text m_Text;

		public void SetText(string text)
		{
			m_Text.text = text;
		}
	}
}

