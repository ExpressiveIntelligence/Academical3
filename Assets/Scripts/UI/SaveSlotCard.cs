using System;
using Academical.Persistence;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class SaveSlotCard : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Image m_LocationPreview;

		[SerializeField]
		private TMP_Text m_LevelName;

		[SerializeField]
		private TMP_Text m_LocationName;

		[SerializeField]
		private TMP_Text m_SaveTimeStamp;

		[SerializeField]
		private TMP_Text m_Date;

		[SerializeField]
		private TMP_Text m_TotalPlayTime;

		[SerializeField]
		private GameObject m_AutoSaveIndicator;

		[SerializeField]
		private Button m_PlayButton;

		[SerializeField]
		private Button m_DeleteButton;

		public Action OnPlayClicked;

		public Action OnDeleteClicked;

		protected override void SubscribeToEvents()
		{
			m_PlayButton.onClick.AddListener( PlayButtonClicked );
			m_DeleteButton.onClick.AddListener( DeleteButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_PlayButton.onClick.RemoveListener( PlayButtonClicked );
			m_DeleteButton.onClick.RemoveListener( DeleteButtonClicked );
		}

		public void SetSaveData(SaveSlotData saveSlotData)
		{

			var timestamp = System.DateTime.Parse( saveSlotData.saveTimeStamp ).ToString();
			string levelName = GameLevelManager.Instance.GetLevelById( saveSlotData.levelId ).displayName;
			m_LevelName.text = $"<b>{levelName}</b>";
			m_SaveTimeStamp.text = $"<b>Save Date:</b> {timestamp}";
			m_AutoSaveIndicator.SetActive( saveSlotData.isAutoSave );

			LocationData locationData
				= BackgroundManager.GetLocationData( saveSlotData.currentLocationId );

			m_LocationName.text = $"<b>Current Location:</b> {locationData.displayName}";
			m_Date.text = $"<b>Current Date:</b> {saveSlotData.currentTimeOfDay}, Day {saveSlotData.currentDay}";
			m_TotalPlayTime.text = $"<b>Play Time:</b> {saveSlotData.totalPlaytime / 60} minutes";

			m_LocationPreview.sprite = locationData.sprite;
		}

		private void PlayButtonClicked()
		{
			OnPlayClicked?.Invoke();
		}

		private void DeleteButtonClicked()
		{
			OnDeleteClicked?.Invoke();
		}
	}
}
