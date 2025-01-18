using System;
using System.Collections.Generic;

namespace Academical
{
	/// <summary>
	/// Manages the current state of the game and is serialized to allow for saves and telemetry.
	/// </summary>
	[Serializable]
	public class GameState
	{
		/// <summary>
		/// (For experiments) The participants unique ID.
		/// </summary>
		public int PlayerId;

		/// <summary>
		/// Lines of dialogue uttered during the current scene.
		/// </summary>
		public List<DialogueHistoryEntry> DialogueHistory;

		public GameState()
		{
			PlayerId = -1;
			DialogueHistory = new List<DialogueHistoryEntry>();
		}
	}
}
