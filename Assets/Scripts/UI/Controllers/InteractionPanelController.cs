using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class InteractionPanelController : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private Button m_ActionSelectButton;
		[SerializeField] private Button m_LocationSelectButton;

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_ActionSelectButton.onClick.AddListener( OnActionSelectButtonClicked );
			m_LocationSelectButton.onClick.AddListener( OnLocationSelectButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_ActionSelectButton.onClick.RemoveListener( OnActionSelectButtonClicked );
			m_LocationSelectButton.onClick.RemoveListener( OnLocationSelectButtonClicked );
		}

		#endregion

		#region Private Methods

		private void OnActionSelectButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.ActionSelectModalShown?.Invoke();
		}

		private void OnLocationSelectButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			// GameEvents.LocationSelectModalShown?.Invoke();
		}

		#endregion
	}
}
