using UnityEngine;
using UnityEngine.EventSystems;

namespace Academical
{
	/// <summary>
	/// Component attached to the UI components that scales the UI when the player's
	/// mouse hovers over the UI component.
	/// </summary>
	public class HoverTweenScale : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
	{
		[SerializeField]
		private Vector3 m_HoverScale;

		[SerializeField]
		private float m_TransitionTime;

		private Vector3 m_DefaultScale;

		private void Start()
		{
			m_DefaultScale = transform.localScale;
		}

		public void OnPointerEnter(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, m_HoverScale, m_TransitionTime );
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, m_DefaultScale, m_TransitionTime );
		}
	}
}
