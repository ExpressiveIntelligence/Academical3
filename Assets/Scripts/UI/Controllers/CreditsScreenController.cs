using UnityEngine;
using UnityEngine.UI;


namespace Academical
{
	public class CreditsScreenController : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private Button m_BackButton;

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( OnBackButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( OnBackButtonClicked );
		}

		#endregion

		#region Private Methods

		private void OnBackButtonClicked()
		{
			Hide();
			AudioManager.PlayDefaultButtonSound();
		}

		#endregion
	}
}
