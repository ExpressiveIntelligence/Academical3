using System.Collections.Generic;
using Anansi;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class MapView : UIComponent
	{
		[SerializeField]
		private GameManager m_GameManager;

		[SerializeField]
		private List<MapLocationButton> m_Buttons;

		[SerializeField]
		private Button m_AdvanceDayButton;

		public override void Show()
		{
			base.Show();
			UpdateLocationButtons();
		}

		protected override void SubscribeToEvents()
		{
			foreach ( MapLocationButton locationButton in m_Buttons )
			{
				locationButton.OnClick += HandleLocationSelected;
			}

			m_AdvanceDayButton.onClick.AddListener( HandleAdvanceDayClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			foreach ( MapLocationButton locationButton in m_Buttons )
			{
				locationButton.OnClick -= HandleLocationSelected;
			}

			m_AdvanceDayButton.onClick.RemoveListener( HandleAdvanceDayClicked );
		}

		private void HandleLocationSelected(Location location)
		{
			AudioManager.PlayDefaultButtonSound();
			Hide();
			m_GameManager.ChangeLocation( location );
		}

		private void HandleAdvanceDayClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			Hide();
			m_GameManager.AdvanceDay();
		}

		private void UpdateLocationButtons()
		{
			foreach ( MapLocationButton locationButton in m_Buttons )
			{
				bool hasMainStoryActions = m_GameManager.LocationHasRequiredActions(
					locationButton.Location
				);

				locationButton.SetMainStoryIconActive( hasMainStoryActions );

				bool hasSideStoryActions = m_GameManager.LocationHasAuxiliaryActions(
					locationButton.Location
				);

				locationButton.SetSideStoryIconActive( hasSideStoryActions );

				locationButton.SetButtonLocked( locationButton.Location.IsLocked );
			}
		}
	}
}
