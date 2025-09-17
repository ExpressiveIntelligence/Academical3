using System.Collections.Generic;
using Academical.Persistence;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class LoadGameScreenController : UIComponent
	{
		[Header( "UI Components" )]
		[SerializeField]
		private Button m_BackButton;

		[SerializeField]
		private GameObject m_NoSavesPlaceholder;

		[SerializeField]
		private Transform m_SaveSlotCardContainer;

		[SerializeField]
		private GameObject m_SaveSlotCardPrefab;

		private List<GameObject> m_SaveSlotCards = new List<GameObject>();

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( BackButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( BackButtonClicked );
		}

		public override void Show()
		{
			base.Show();
			UpdateSaveSlotCards();
		}

		public void UpdateSaveSlotCards()
		{
			ClearSaveSlotCards();
			SaveSlotManifestFile saveSlotData = DataPersistenceManager.LoadSaveSlots();
			List<SaveSlotData> saveSlots = saveSlotData.saves;
			saveSlots.Reverse();

			Debug.Log( "Save slot data: " + saveSlots.Count );

			m_NoSavesPlaceholder.SetActive( saveSlots.Count == 0 );

			foreach ( SaveSlotData entry in saveSlots )
			{
				GameObject obj = Instantiate( m_SaveSlotCardPrefab, m_SaveSlotCardContainer );
				SaveSlotCard saveSlotCard = obj.GetComponent<SaveSlotCard>();
				saveSlotCard.SetSaveData( entry );
				m_SaveSlotCards.Add( obj );

				saveSlotCard.OnPlayClicked += () =>
				{
					SaveData saveData = DataPersistenceManager.LoadGame( entry.guid );
					DataPersistenceManager.SaveData = saveData;
					MainMenuManager.Instance.StartGame();
				};

				saveSlotCard.OnDeleteClicked += () =>
				{
					DeleteSaveSlot( entry.guid );
				};
			}
		}

		private void DeleteSaveSlot(string guid)
		{
			DataPersistenceManager.DeleteSave( guid );
			UpdateSaveSlotCards();
		}

		private void BackButtonClicked()
		{
			Hide();
			ClearSaveSlotCards();
		}

		private void ClearSaveSlotCards()
		{
			foreach ( GameObject obj in m_SaveSlotCards )
			{
				Destroy( obj );
			}
			m_SaveSlotCards.Clear();
		}
	}
}
