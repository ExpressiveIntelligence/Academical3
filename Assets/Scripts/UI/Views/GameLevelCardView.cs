using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// Displays information about
	/// </summary>
	public class GameLevelCardView : UIView
	{
		public const string k_LevelTitleName = "DescriptionLabel";
		public const string k_LevelDescriptionName = "DescriptionText";
		public const string k_CardImageName = "CardImage";
		public const string k_PlayButtonName = "PlayButton";

		private Label m_LevelTitle;
		private Label m_DescriptionText;
		private VisualElement m_CardImage;
		private Button m_PlayButton;
		private GameLevelSO m_LevelData;

		public GameLevelCardView(VisualElement topElement, GameLevelSO levelData)
			: base( topElement )
		{
			m_LevelData = levelData;

			SetTitleText( m_LevelData.Title );
			SetDescriptionText( m_LevelData.Description );
			SetImage( m_LevelData.Thumbnail );
		}

		protected override void SetVisualElements()
		{
			m_LevelTitle = Root.Q<Label>( k_LevelTitleName );
			m_DescriptionText = Root.Q<Label>( k_LevelDescriptionName );
			m_CardImage = Root.Q<VisualElement>( k_CardImageName );
			m_PlayButton = Root.Q<Button>( k_PlayButtonName );
		}

		protected override void RegisterButtonCallbacks()
		{
			m_PlayButton.clicked += OnPlayButtonClicked;
		}

		public override void Dispose()
		{
			m_PlayButton.clicked -= OnPlayButtonClicked;
		}

		public void OnPlayButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.LevelSelected?.Invoke( m_LevelData );
		}

		public void SetTitleText(string text)
		{
			m_LevelTitle.text = text;
		}

		public void SetDescriptionText(string text)
		{
			m_DescriptionText.text = text;
		}

		public void SetImage(Sprite image)
		{
			m_CardImage.style.backgroundImage = new StyleBackground( image );
		}
	}
}
