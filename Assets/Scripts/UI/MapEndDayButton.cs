using UnityEngine;
using UnityEngine.EventSystems;

namespace Academical
{
	public class MapEndDayButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
	{
		public void OnPointerEnter(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1.05f, 1.05f, 1.05f ), 0.1f );
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			LeanTween.scale( gameObject, new Vector3( 1f, 1f, 1f ), 0.1f );
		}
	}
}
