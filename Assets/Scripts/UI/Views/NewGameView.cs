using System.Collections.Generic;
using UnityEngine.UIElements;

namespace Academical
{
	public class NewGameView : UIView
	{
		// Visual Elements
		Button m_BackButton;

		public static VisualTreeAsset LevelCardVisualTree;
		VisualElement m_levelSelectContainer;

		private List<GameLevelCardView> m_levelCards;

		public NewGameView(VisualElement topElement) : base( topElement )
		{
			NewGameScreenEvents.LevelsUpdated += OnLevelsUpdated;
			m_levelCards = new List<GameLevelCardView>();
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

			foreach ( var view in m_levelCards )
			{
				view.Dispose();
			}

			m_levelCards.Clear();
		}

		void OnBackButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			MainMenuUIEvents.HomeScreenShown?.Invoke();
		}

		void CreateLevelCard(GameLevelSO levelData)
		{
			TemplateContainer instance = LevelCardVisualTree.Instantiate();

			GameLevelCardView view = new GameLevelCardView( instance, levelData );

			view.Show();

			m_levelSelectContainer.Add( view.Root );
			m_levelCards.Add( view );
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
