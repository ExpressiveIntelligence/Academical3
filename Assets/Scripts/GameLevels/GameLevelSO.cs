using UnityEngine;

namespace Academical
{
	/// <summary>
	/// A game level manages configuration data for starting a or loading a game
	/// as a specific character.
	/// </summary>
	[CreateAssetMenu( fileName = "GameLevel", menuName = "Academical/Game Level" )]
	public class GameLevelSO : ScriptableObject
	{
		/// <summary>
		/// A unique ID for the level.
		/// </summary>
		public string id;

		/// <summary>
		/// The name of the level as shown in the GUI.
		/// </summary>
		public string displayName;

		/// <summary>
		/// A brief text description of the level.
		/// </summary>
		[TextArea( 3, 5 )]
		public string description;

		/// <summary>
		/// The main entry dialogue script for this level.
		/// </summary>
		public TextAsset inkScript;

		/// <summary>
		/// The thumbnail image to show when displaying this as a potential new game.
		/// </summary>
		public Sprite thumbnail;

		/// <summary>
		/// The scene to load when this level is selected when starting a new/loaded game.
		/// </summary>
		public string scenePath;
	}
}
