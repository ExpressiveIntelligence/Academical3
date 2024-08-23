using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;
using System;
using UnityEngine.UIElements;
using System.Linq;


namespace Academical
{
	public class NewGameScreenController : MonoBehaviour
	{
		[SerializeField]
		private GameLevelSO[] m_Levels;

		[SerializeField]
		private VisualTreeAsset m_LevelCardVisualTree;

		void OnEnable()
		{
			MainMenuUIEvents.NewGameScreenShown += OnNewGameScreenShown;
		}

		void OnDisable()
		{
			MainMenuUIEvents.NewGameScreenShown -= OnNewGameScreenShown;
		}

		void OnNewGameScreenShown()
		{
			NewGameView.LevelCardVisualTree = m_LevelCardVisualTree;
			NewGameScreenEvents.LevelsUpdated?.Invoke( m_Levels.ToList() );
		}

	}
}
