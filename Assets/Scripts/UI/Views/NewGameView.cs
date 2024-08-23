using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

namespace Academical
{
	public class NewGameView : UIView
	{
		// Visual Elements
		Button m_BackButton;

		public static VisualTreeAsset LevelCardVisualTree;
		VisualElement m_levelSelectContainer;

		public NewGameView(VisualElement topElement) : base( topElement )
		{
			NewGameScreenEvents.LevelsUpdated += OnLevelsUpdated;
		}

		protected override void SetVisualElements()
		{
			m_BackButton = m_TopElement.Q<Button>( "BackBtn" );
			m_levelSelectContainer = m_TopElement.Q<VisualElement>( "ContentContainer" );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_BackButton.clicked += OnBackButtonClicked;
		}

		public override void Dispose()
		{
			m_BackButton.clicked -= OnBackButtonClicked;
			NewGameScreenEvents.LevelsUpdated -= OnLevelsUpdated;
		}

		void OnBackButtonClicked()
		{
			MainMenuUIEvents.HomeScreenShown?.Invoke();
		}

		void CreateLevelCard(GameLevelSO levelData)
		{
			TemplateContainer instance = LevelCardVisualTree.Instantiate();

			instance.Q<TextElement>( "DescriptionLabel" ).text = levelData.Title;

			instance.Q<TextElement>( "DescriptionText" ).text = levelData.Description;

			instance.Q<VisualElement>( "CardImage" ).style.backgroundImage = new StyleBackground( levelData.Thumbnail );

			instance.Q<Button>( "PlayButton" ).clicked += () =>
			{
				SceneManager.LoadScene( "Scenes/Authorship" );
			};

			m_levelSelectContainer.Add( instance );
		}

		void OnLevelsUpdated(List<GameLevelSO> levels)
		{
			m_levelSelectContainer.Clear();

			if ( levels.Count == 0 ) return;

			foreach ( var level in levels )
			{
				if ( level != null )
				{
					CreateLevelCard( level );
				}
			}
		}
	}
}
