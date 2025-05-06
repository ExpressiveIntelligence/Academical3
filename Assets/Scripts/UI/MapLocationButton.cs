using System;
using Anansi;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
	public class MapLocationButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
	{
		[SerializeField]
		private Location m_Location;

		[SerializeField]
		private GameObject m_MainStoryIcon;

		[SerializeField]
		private GameObject m_SideStoryIcon;

		[SerializeField]
		private GameObject m_LockedOverlay;

		[SerializeField]
		private Button m_Button;

		[SerializeField]
		private GameObject m_Tooltip;

		[SerializeField]
		private TMP_Text m_TooltipText;

		private bool m_IsLocked;

		public Action<Location> OnClick;

		public Location Location => m_Location;

		private void Start()
		{
			m_Tooltip.SetActive( false );
			SetButtonLocked( false );
			SetMainStoryIconActive( false );
			SetSideStoryIconActive( false );
		}

		private void OnEnable()
		{
			m_Button.onClick.AddListener( HandleButtonClick );
		}

		private void OnDisable()
		{
			m_Button.onClick.RemoveListener( HandleButtonClick );
		}

		private void HandleButtonClick()
		{
			OnClick?.Invoke( m_Location );
		}

		public void OnPointerEnter(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1.05f, 1.05f, 1.05f ), 0.1f );
			if ( m_IsLocked && Location.LockMessage != "" )
			{
				m_Tooltip.SetActive( true );
				m_TooltipText.text = Location.LockMessage;
			}
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1f, 1f, 1f ), 0.1f );
			m_Tooltip.SetActive( false );
		}

		public void SetButtonLocked(bool isLocked)
		{
			m_IsLocked = isLocked;
			if ( isLocked )
			{
				m_Button.interactable = false;
				SetMainStoryIconActive( false );
				SetSideStoryIconActive( false );
				m_LockedOverlay.SetActive( true );
			}
			else
			{
				m_Button.interactable = true;
				m_LockedOverlay.SetActive( false );
			}
		}

		public void SetMainStoryIconActive(bool isActive)
		{
			m_MainStoryIcon.SetActive( isActive );
		}

		public void SetSideStoryIconActive(bool isActive)
		{
			m_SideStoryIcon.SetActive( isActive );
		}
	}
}
