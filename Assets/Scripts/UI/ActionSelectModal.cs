using System.Collections.Generic;
using Anansi;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class ActionSelectModal : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private GameObject m_ChoiceButtonContainer;
		[SerializeField] private Button m_CloseButton;


		[Header( "Element Prefabs" )]
		[SerializeField] private GameObject m_ChoiceButtonPrefab;

		private List<ActionChoiceButton> m_ChoiceButtons = new List<ActionChoiceButton>();

		#endregion

		#region Public Methods

		public void ClearChoices()
		{
			foreach ( var button in m_ChoiceButtons )
			{
				Destroy( button.gameObject );
			}

			m_ChoiceButtons.Clear();
		}

		#endregion

		#region Protected Method

		protected override void SubscribeToEvents()
		{
			m_CloseButton.onClick.AddListener( OnCloseButtonClicked );
			GameEvents.AvailableActionsUpdated += OnAvailableActionsUpdated;
		}

		protected override void UnsubscribeFromEvents()
		{
			m_CloseButton.onClick.RemoveListener( OnCloseButtonClicked );
			GameEvents.AvailableActionsUpdated -= OnAvailableActionsUpdated;
		}

		#endregion

		#region Private Methods

		private void OnCloseButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			ClearChoices();
			Hide();
		}

		private void OnAvailableActionsUpdated(List<ActionStoryletInfo> storylets)
		{
			ClearChoices();
			foreach ( var entry in storylets )
			{
				GameObject obj = Instantiate(
					m_ChoiceButtonPrefab, m_ChoiceButtonContainer.transform
				);

				var choiceButton = obj.GetComponent<ActionChoiceButton>();

				m_ChoiceButtons.Add( choiceButton );

				if ( entry.isAuxillaryAction )
				{
					choiceButton.ShowAuxIndicator();
				}
				else
				{
					choiceButton.HideAuxIndicator();
				}

				if ( entry.isRequiredAction )
				{
					choiceButton.ShowRequiredIndicator();
				}
				else
				{
					choiceButton.HideRequiredIndicator();
				}

				choiceButton.SetStorylet( entry.storyletInstance );
			}
		}

		#endregion
	}
}
