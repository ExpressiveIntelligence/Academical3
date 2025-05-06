using System;
using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages a queue of notifications and 
	/// </summary>
	public class NotificationManager : MonoBehaviour
	{
		/// <summary>
		/// The number of seconds that the notification is displayed before disappearing.
		/// </summary>
		[SerializeField]
		private float m_NotificationDurationSeconds;

		/// <summary>
		/// The prefab instantiated when displaying a notification
		/// </summary>
		[SerializeField]
		private NotificationAlertView m_NotificationAlertView;

		/// <summary>
		/// Reference to the global NotificationManage instance
		/// </summary>
		public static NotificationManager Instance { get; private set; }

		private Queue<NotificationAlert> m_NotificationQueue;
		private bool m_IsNotificationActive = true;


		private void Awake()
		{
			if (Instance != null)
			{
				Destroy( gameObject );
				return;
			}

			Instance = this;
			m_NotificationQueue = new Queue<NotificationAlert>();
		}

		private void OnEnable()
		{
			m_NotificationAlertView.OnNotificationShown += HandleNotificationShown;
			m_NotificationAlertView.OnNotificationHidden += HandleNotificationHidden;
		}

		private void OnDisable()
		{
			m_NotificationAlertView.OnNotificationShown -= HandleNotificationShown;
			m_NotificationAlertView.OnNotificationHidden -= HandleNotificationHidden;
		}

		private void Update()
		{
			if (!m_IsNotificationActive && m_NotificationQueue.Count > 0)
			{
				NotificationAlert alertData = m_NotificationQueue.Dequeue();
				m_NotificationAlertView.Show( alertData, m_NotificationDurationSeconds );
			}
		}

		private void HandleNotificationShown()
		{
			m_IsNotificationActive = true;
		}

		private void HandleNotificationHidden()
		{
			m_IsNotificationActive = false;
		}


		/// <summary>
		/// Queues a notification to be shown to the player.
		/// </summary>
		/// <param name="text">The message to display.</param>
		public void QueueNotification(string text)
		{
			m_NotificationQueue.Enqueue( new NotificationAlert( text ) );
		}

		/// <summary>
		/// Queues a notification to be shown to the player.
		/// </summary>
		/// <param name="text">The message to display.</param>
		/// <param name="onClickCallback">A callback executed when the notification is clicked.</param>
		public void QueueNotification(string text, Action onClickCallback)
		{
			m_NotificationQueue.Enqueue( new NotificationAlert( text, onClickCallback ) );
		}
	}
}

