using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class DialogueHistoryScreenController : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private Button m_BackButton;
		[SerializeField] private GameObject m_HistoryEntryContainer;

		[Header( "Element Prefabs" )]
		[SerializeField] private GameObject m_HistoryEntryPrefab;

		private List<GameObject> m_EntryUIComponents = new List<GameObject>();

		#endregion

		#region Protected Fields

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( OnBackButtonClicked );
			GameEvents.DialogueHistoryUpdated += OnDialogueHistoryUpdated;
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( OnBackButtonClicked );
			GameEvents.DialogueHistoryUpdated -= OnDialogueHistoryUpdated;
		}

		#endregion

		#region  Private Methods

		private void OnBackButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.DialogueHistoryScreenHidden?.Invoke();
		}

		private void OnDialogueHistoryUpdated(List<DialogueHistoryEntry> entries)
		{
			ClearEntries();
			foreach ( var entry in entries )
			{
				GameObject entryUIComponent = Instantiate(
					m_HistoryEntryPrefab, m_HistoryEntryContainer.transform
				);
				m_EntryUIComponents.Add( entryUIComponent );

				var uiComponent = entryUIComponent.GetComponent<DialogueHistoryEntryUI>();

				uiComponent.SetSpeaker( entry.Speaker );
				uiComponent.SetText( entry.Text );
			}
		}

		private void ClearEntries()
		{
			foreach ( var entry in m_EntryUIComponents )
			{
				Destroy( entry );
			}
			m_EntryUIComponents.Clear();
		}

		#endregion
	}
}
