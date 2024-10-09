using UnityEngine;
using Anansi;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems;

namespace Academical
{
	[RequireComponent( typeof( EventTrigger ) )]
	public class DialogueChoiceButton : UIComponent, IPointerEnterHandler, IPointerExitHandler
	{
		#region Fields

		[SerializeField]
		private Button m_Button;

		[SerializeField]
		private TMP_Text m_ButtonLabel;

		private Choice m_ChoiceData;

		#endregion

		#region Public Methods

		public void SetChoiceData(Choice choice)
		{
			m_ChoiceData = choice;
			m_ButtonLabel.text = choice.Text;
		}

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_Button.onClick.AddListener( OnClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_Button.onClick.RemoveListener( OnClicked );
		}

		#endregion

		#region Private Methods

		private void OnClicked()
		{
			DialogueEvents.ChoicesHidden?.Invoke();
			DialogueEvents.ChoiceSelected?.Invoke( m_ChoiceData );
		}

		public void OnPointerEnter(PointerEventData data)
		{
			ShowTooltip();
		}

		public void OnPointerExit(PointerEventData data)
		{
			HideTooltip();
		}

		private void ShowTooltip()
		{
			GameEvents.ChoiceTooltipShown?.Invoke( m_ChoiceData );
		}

		private void HideTooltip()
		{
			GameEvents.ChoiceTooltipHidden();
		}

		#endregion
	}
}
