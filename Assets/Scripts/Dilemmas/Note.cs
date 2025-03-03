using System;

namespace Academical
{
	/// <summary>
	/// An informational note unlocked in the game by satisfying database conditions.
	/// </summary>
	[Serializable]
	public class Note
	{
		/// <summary>
		/// RePraxis database preconditions.
		/// </summary>
		public string[] preconditions;

		/// <summary>
		/// The text displayed when this note is unlocked.
		/// </summary>
		public string text;
	}
}
