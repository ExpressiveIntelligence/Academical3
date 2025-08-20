using System.Collections.Generic;
using Anansi;
using UnityEngine;

namespace Academical
{
	public class MapView : UIComponent
	{
		[SerializeField]
		private GameManager m_GameManager;

		[SerializeField]
		private List<MapLocationButton> m_Buttons;

		[SerializeField]
		private MapEndDayButton m_AdvanceDayButton;

		public override void Show()
		{
			base.Show();
			UpdateLocationButtons();
			UpdateAdvanceDayButton();
		}

		protected override void SubscribeToEvents()
		{
			foreach ( MapLocationButton locationButton in m_Buttons )
			{
				locationButton.OnClick += HandleLocationSelected;
			}

			m_AdvanceDayButton.OnClick += HandleAdvanceDayClicked;
		}

		protected override void UnsubscribeFromEvents()
		{
			foreach ( MapLocationButton locationButton in m_Buttons )
			{
				locationButton.OnClick -= HandleLocationSelected;
			}

			m_AdvanceDayButton.OnClick -= HandleAdvanceDayClicked;
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

		private void UpdateAdvanceDayButton()
		{
			bool unseenContentPresent = false;
			// Check if we are in a debug mode that ignores requirments
			if ( EnvironmentConstants.DayRequirementsEnabled )
			{
				// Check if the player has required content they need to visit
				unseenContentPresent = GameManager.Instance.ExistsUnseenRequiredContentForDay();
			}
			m_AdvanceDayButton.SetButtonLocked( unseenContentPresent );
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
