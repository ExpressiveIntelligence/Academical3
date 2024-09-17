using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// Manages HUD shown while playing the game and not in conversation with a character
	/// or displaying the dialogue box.
	/// </summary>
	public class GameHUDView : UIView
	{
		public GameHUDView(VisualElement topElement) : base( topElement )
		{
		}
	}
}
