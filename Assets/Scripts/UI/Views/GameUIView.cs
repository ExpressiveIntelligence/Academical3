using System.Collections.Generic;
using Anansi;
using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// Top-level view that manages all parts of the UI while playing the
	/// actual game (not within the main menu).
	/// </summary>
	public class GameUIView : UIView
	{
		public const string k_DialogueBoxName = "DialogueBox";
		public const string k_DialogueChoiceOptionsName = "DialogueChoiceOptions";
		public const string k_DialogueToolbarName = "DialogueToolbar";
		public const string k_GameHUDName = "GameHUD";

		private DialogueBoxView m_DialogueBox;
		private DialogueChoiceOptionsView m_ChoiceOptions;
		private DialogueToolbarView m_ToolBar;
		private GameHUDView m_GameHUD;

		public GameUIView(VisualElement topElement) : base( topElement )
		{

		}

		protected override void SetVisualElements()
		{
			m_DialogueBox = new DialogueBoxView( Root.Q( k_DialogueBoxName ) );
			m_ChoiceOptions = new DialogueChoiceOptionsView( Root.Q( k_DialogueChoiceOptionsName ) );
			m_ToolBar = new DialogueToolbarView( Root.Q( k_DialogueToolbarName ) );
			m_GameHUD = new GameHUDView( Root.Q( k_GameHUDName ) );
		}

		public override void Dispose()
		{
			m_DialogueBox.Dispose();
			m_ChoiceOptions.Dispose();
			m_ToolBar.Dispose();
			m_GameHUD.Dispose();
		}
	}
}
