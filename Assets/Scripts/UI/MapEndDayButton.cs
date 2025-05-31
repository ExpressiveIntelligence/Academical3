using System;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
	public class MapEndDayButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
	{
		[SerializeField]
		private Button m_Button;

		[SerializeField]
		private GameObject m_LockedOverlay;

		[SerializeField]
		private GameObject m_Tooltip;

		[SerializeField]
		private TMP_Text m_TooltipText;

		public Action OnClick;

		private bool m_IsLocked;

		private void OnEnable()
		{
			m_Button.onClick.AddListener( HandleButtonClick );
		}

		private void OnDisable()
		{
			m_Button.onClick.RemoveListener( HandleButtonClick );
		}


		public void OnPointerEnter(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1.05f, 1.05f, 1.05f ), 0.1f );
			if ( m_IsLocked )
			{
				m_Tooltip.SetActive( true );
			}
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1f, 1f, 1f ), 0.1f );
			m_Tooltip.SetActive( false );
		}

		private void HandleButtonClick()
		{
			OnClick?.Invoke();
		}

		public void SetButtonLocked(bool isLocked)
		{
			m_IsLocked = isLocked;
			if ( isLocked )
			{
				m_Button.interactable = false;
				m_LockedOverlay.SetActive( true );
			}
			else
			{
				m_Button.interactable = true;
				m_LockedOverlay.SetActive( false );
			}
		}
	}
}
