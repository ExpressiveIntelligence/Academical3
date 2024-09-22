using UnityEngine;
using Anansi;
using UnityEngine.UI;
using TMPro;

namespace Academical
{
	public class DialogueChoiceButton : UIComponent
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

		private void OnMouseEnter()
		{
			ShowTooltip();
		}

		private void OnMouseExit()
		{
			HideTooltip();
		}

		private void ShowTooltip()
		{

		}

		private void HideTooltip()
		{

		}

		#endregion
	}
}
