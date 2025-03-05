using System;

namespace Academical.Persistence
{
	[Serializable]
	public class DialogueHistoryEntryData
	{
		/// <summary>
		/// The ID of the character that spoke the line.
		/// </summary>
		public string speakerId;

		/// <summary>
		/// The text spoken.
		/// </summary>
		public string text;
	}
}
