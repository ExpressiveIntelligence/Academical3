using TMPro;
using UnityEngine;

namespace Academical
{
	public class DialogueHistoryEntryUI : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private TMP_Text m_SpeakerName;
		[SerializeField] private TMP_Text m_DialogueText;

		#endregion

		#region Public Methods

		public void SetSpeaker(string speaker)
		{
			m_SpeakerName.text = speaker;
		}

		public void SetText(string text)
		{
			m_DialogueText.text = text;
		}

		#endregion
	}
}
