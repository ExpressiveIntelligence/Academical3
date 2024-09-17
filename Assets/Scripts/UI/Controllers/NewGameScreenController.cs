using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using System;
using UnityEngine.UIElements;
using System.Linq;
using UnityEditor.EditorTools;


namespace Academical
{
	public class NewGameScreenController : MonoBehaviour
	{
		[SerializeField]
		private GameLevelSO[] m_Levels;

		[Tooltip( "Settings regarding audio volume, text speed, and level info." )]
		[SerializeField] private GameSettingsSO m_GameSettings;

		[SerializeField]
		private VisualTreeAsset m_LevelCardVisualTree;

		void OnEnable()
		{
			MainMenuUIEvents.NewGameScreenShown += OnNewGameScreenShown;
			GameEvents.LevelSelected += OnLevelSelected;
		}

		void OnDisable()
		{
			MainMenuUIEvents.NewGameScreenShown -= OnNewGameScreenShown;
			GameEvents.LevelSelected -= OnLevelSelected;
		}

		void OnNewGameScreenShown()
		{
			NewGameView.LevelCardVisualTree = m_LevelCardVisualTree;
			NewGameScreenEvents.LevelsUpdated?.Invoke( m_Levels.ToList() );
		}

		void OnLevelSelected(GameLevelSO levelData)
		{
			m_GameSettings.gameLevel = levelData;
			SceneManager.LoadScene( levelData.Scene );
		}
	}
}
