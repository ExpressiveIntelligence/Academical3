using System.Collections.Generic;
using Anansi;
using UnityEngine;

namespace Academical
{
	[DefaultExecutionOrder( 1 )]
	public class GameUIManager : MonoBehaviour
	{
		#region Fields

		private UIComponent m_CurrentView;
		private UIComponent m_PreviousView;

		[Header( "UI Components" )]
		[SerializeField]
		private UIComponent m_InteractionPanel;

		[SerializeField]
		private UIComponent m_InputModal;

		[SerializeField]
		private UIComponent m_ChoiceTooltip;

		[SerializeField]
		private UIComponent m_DialogueBox;

		[SerializeField]
		private UIComponent m_ActionSelectModal;

		[SerializeField]
		private UIComponent m_LocationSelectModal;

		[SerializeField]
		private UIComponent m_DialogueChoiceModal;

		[SerializeField]
		private UIComponent m_SettingsMenu;

		[SerializeField]
		private UIComponent m_DialogueHistoryScreen;

		#endregion

		#region Unity Messages

		void OnEnable()
		{
			SetupViews();

			SubscribeToEvents();
		}

		void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		#endregion

		#region Private Methods

		private void SetupViews()
		{
			m_InteractionPanel.Hide();
			m_InputModal.Hide();
			m_ChoiceTooltip.Hide();
			m_DialogueBox.Hide();
			m_ActionSelectModal.Hide();
			m_LocationSelectModal.Hide();
			m_DialogueChoiceModal.Hide();
			m_SettingsMenu.Hide();
			m_DialogueHistoryScreen.Hide();
		}

		private void SubscribeToEvents()
		{
			MainMenuUIEvents.SettingsScreenShown += OnSettingsScreenShown;
			MainMenuUIEvents.SettingsScreenHidden += OnSettingsScreenHidden;
			GameEvents.GameHUDShown += OnHUDShown;
			GameEvents.ActionSelectModalShown += OnActionSelectModalShown;
			GameEvents.LocationSelectModalShown += OnLocationSelectModalShown;
			GameEvents.ActionSelectModalHidden += OnActionSelectModalHidden;
			GameEvents.LocationSelectModalHidden += OnLocationSelectModalHidden;
			DialogueEvents.DialogueStarted += OnDialogueStarted;
			DialogueEvents.ChoicesShown += OnChoicesShown;
		}

		private void UnsubscribeFromEvents()
		{
			MainMenuUIEvents.SettingsScreenShown -= OnSettingsScreenShown;
			MainMenuUIEvents.SettingsScreenHidden -= OnSettingsScreenHidden;
			GameEvents.GameHUDShown -= OnHUDShown;
			GameEvents.ActionSelectModalShown -= OnActionSelectModalShown;
			GameEvents.LocationSelectModalShown -= OnLocationSelectModalShown;
			GameEvents.ActionSelectModalHidden -= OnActionSelectModalHidden;
			GameEvents.LocationSelectModalHidden -= OnLocationSelectModalHidden;
			DialogueEvents.DialogueStarted -= OnDialogueStarted;
			DialogueEvents.ChoicesShown -= OnChoicesShown;
		}

		void ShowScreen(UIComponent newView)
		{
			if ( m_CurrentView != null )
			{
				m_CurrentView.Hide();
			}

			m_PreviousView = m_CurrentView;
			m_CurrentView = newView;

			if ( m_CurrentView != null )
			{
				m_CurrentView.Show();
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}

		void OnHUDShown()
		{
			ShowScreen( m_InteractionPanel );
		}

		void OnChoicesShown()
		{
			m_DialogueChoiceModal.Show();
		}

		void OnDialogueStarted()
		{
			ShowScreen( m_DialogueBox );
		}

		void OnSettingsScreenShown()
		{
			m_PreviousView = m_CurrentView;
			m_SettingsMenu.Show();
		}

		void OnActionSelectModalShown()
		{
			m_ActionSelectModal.Show();
		}

		void OnLocationSelectModalShown()
		{
			m_LocationSelectModal.Show();
		}

		void OnActionSelectModalHidden()
		{
			m_ActionSelectModal.Hide();
		}

		void OnLocationSelectModalHidden()
		{
			m_LocationSelectModal.Hide();
		}


		void OnSettingsScreenHidden()
		{
			m_SettingsMenu.Hide();

			if ( m_PreviousView != null )
			{
				m_PreviousView.Show();
				m_CurrentView = m_PreviousView;
				MainMenuUIEvents.CurrentViewChanged?.Invoke( m_CurrentView.GetType().Name );
			}
		}


		#endregion
	}
}
