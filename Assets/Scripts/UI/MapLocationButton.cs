using System;
using Anansi;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
	public class MapLocationButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler, IPointerUpHandler
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

		//We need to add highlighting behavior to mask on hover
		public Image Mask;
		private Color m_HighlightColor;
		private Color m_NormalColor;
		private Color m_PressedColor;
		private Color m_SelectedColor;

		private bool m_IsPressed;
		private bool m_IsInside;

		private void Start()
		{
			m_Tooltip.SetActive( false );
			SetButtonLocked( false );
			SetMainStoryIconActive( false );
			SetSideStoryIconActive( false );
			m_HighlightColor = m_Button.colors.highlightedColor;
			m_NormalColor = m_Button.colors.normalColor;
			m_PressedColor = m_Button.colors.pressedColor;
			m_SelectedColor = m_Button.colors.selectedColor;
			m_IsPressed = false;
			m_IsInside = false;

		}

		private void OnEnable()
		{
			Mask.color = m_NormalColor;
		}

		public void OnPointerEnter(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1.05f, 1.05f, 1.05f ), 0.1f );
			Mask.color = m_HighlightColor;
			m_IsInside = true;

			if ( m_IsLocked && Location.LockMessage != "" )
			{
				m_Tooltip.SetActive( true );
				m_TooltipText.text = Location.LockMessage;
			}
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1f, 1f, 1f ), 0.1f );
			m_IsInside = false;
			if ( !m_IsPressed )
			{
				Mask.color = m_NormalColor;
			}
			m_Tooltip.SetActive( false );
		}


		public void OnPointerDown(PointerEventData e)
		{
			Mask.color = m_PressedColor;
			m_IsPressed = true;
		}
		public void OnPointerUp(PointerEventData e)
		{
			if ( m_IsInside )
			{
				Mask.color = m_SelectedColor;
				OnClick?.Invoke( m_Location );
			}
			else
			{
				Mask.color = m_NormalColor;
			}
			m_IsPressed = false;
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
