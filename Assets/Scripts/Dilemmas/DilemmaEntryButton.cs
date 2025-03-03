using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class DilemmaEntryButton : MonoBehaviour
	{
		private Button m_Button;
		private TMP_Text m_ButtonTextMesh;
		private int m_DilemmaIndex;

		public Action<int> OnClick;

		private void Awake()
		{
			m_Button = GetComponent<Button>();
			m_ButtonTextMesh = GetComponentInChildren<TMP_Text>();
		}

		private void OnEnable()
		{
			m_Button.onClick.AddListener( HandleButtonClicked );
		}

		private void OnDisable()
		{
			m_Button.onClick.RemoveListener( HandleButtonClicked );
		}

		public void SetText(string text)
		{
			m_ButtonTextMesh.text = text;
		}

		public void SetDilemmaIndex(int index)
		{
			m_DilemmaIndex = index;
		}

		private void HandleButtonClicked()
		{
			OnClick?.Invoke( m_DilemmaIndex );
		}
	}
}
