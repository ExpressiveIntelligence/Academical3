using System;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Academical
{
	public class NotificationAlertView : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
	{
		private float m_RemainingDuration = 0f;
		private bool m_IsDurationTimerPaused = true;
		private NotificationAlert m_AlertData;

		public Action OnNotificationShown;
		public Action OnNotificationHidden;

		[SerializeField]
		private TMP_Text m_NotificationText;

		private void Start()
		{
			gameObject.GetComponent<RectTransform>().position += new Vector3( 800f, 0f, 0f );
			OnNotificationHidden?.Invoke();
		}

		private void Update()
		{
			if (!m_IsDurationTimerPaused)
			{
				m_RemainingDuration -= Time.deltaTime;

				if (m_RemainingDuration <= 0f)
				{
					Hide();
				}
			}
		}

		/// <summary>
		/// Show the provided notification for the given amount of time
		/// </summary>
		/// <param name="alert"></param>
		/// <param name="duration"></param>
		public void Show(NotificationAlert alert, float duration)
		{
			gameObject.SetActive( true );
			m_NotificationText.text = alert.message;
			m_RemainingDuration = duration;
			m_IsDurationTimerPaused = false;
			m_AlertData = alert;
			LeanTween.moveX( gameObject.GetComponent<RectTransform>(), 0f, 0.5f );
			OnNotificationShown?.Invoke();
		}

		/// <summary>
		/// Hide the notification.
		/// </summary>
		public void Hide()
		{
			m_IsDurationTimerPaused = true;
			m_RemainingDuration = 0f;

			LeanTween.moveX( gameObject.GetComponent<RectTransform>(), 800f, 0.5f).setOnComplete(() =>
			{
				gameObject.SetActive( false );
				OnNotificationHidden?.Invoke();
			} );
			
		}

		public void OnPointerEnter(PointerEventData eventData)
		{
			m_IsDurationTimerPaused = true;
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			m_IsDurationTimerPaused = false;
		}

		public void OnPointerClick(PointerEventData eventData)
		{
			Hide();
			m_AlertData.onClickCallback?.Invoke();
		}
	}
}

