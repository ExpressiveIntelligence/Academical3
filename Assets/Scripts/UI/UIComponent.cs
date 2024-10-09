using UnityEngine;

namespace Academical
{
	[RequireComponent( typeof( CanvasGroup ) )]
	public abstract class UIComponent : MonoBehaviour
	{
		[Header( "Visibility" )]
		[SerializeField] private bool m_HideOnAwake;

		private CanvasGroup m_CanvasGroup;

		protected virtual void Awake()
		{
			m_CanvasGroup = GetComponent<CanvasGroup>();

			if ( m_HideOnAwake )
			{
				Hide();
			}
		}

		protected virtual void OnEnable()
		{
			SubscribeToEvents();
		}

		protected virtual void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		protected virtual void SubscribeToEvents()
		{
			// Do Nothing
		}

		protected virtual void UnsubscribeFromEvents()
		{
			// Do Nothing
		}

		public virtual void Show()
		{
			m_CanvasGroup.alpha = 1;
			m_CanvasGroup.interactable = true;
			m_CanvasGroup.blocksRaycasts = true;
		}

		public virtual void Hide()
		{
			m_CanvasGroup.alpha = 0;
			m_CanvasGroup.interactable = false;
			m_CanvasGroup.blocksRaycasts = false;
		}
	}
}
