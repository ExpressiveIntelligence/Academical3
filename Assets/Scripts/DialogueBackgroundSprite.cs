using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Information about a image used as a background during dialogue.
	/// </summary>
	[CreateAssetMenu( fileName = "background", menuName = "Academical/Background Sprite" )]
	public class DialogueBackgroundSprite : ScriptableObject
	{
		/// <summary>
		/// The ID/name used to reference this background.
		/// </summary>
		public string entryId;

		/// <summary>
		/// The sprite image.
		/// </summary>
		public Sprite sprite;
	}
}
