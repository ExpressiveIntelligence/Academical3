using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using System;


namespace Academical
{
	public class SettingsScreenController : MonoBehaviour
	{

		GameData m_SettingsData;

		void OnEnable()
		{
			// SettingsScreenEvents.UIGameDataUpdated += OnUISettingsUpdated;
			// SaveManager.GameDataLoaded += OnGameDataLoaded;
		}

		void OnDisable()
		{
			// SettingsScreenEvents.UIGameDataUpdated -= OnUISettingsUpdated;
			// SaveManager.GameDataLoaded -= OnGameDataLoaded;
		}

		void SelectTextSpeed()
		{

		}

		void OnUISettingsUpdated()
		{

		}

		void OnGameDataLoaded(GameData gameData)
		{
			if (gameData == null) return;

			m_SettingsData = gameData;
			SettingsScreenEvents.GameDataLoaded?.Invoke(m_SettingsData);
		}

	}
}
