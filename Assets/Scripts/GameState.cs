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
		/// Unique ID used when saving this game state.
		/// </summary>
		public string guid;

		public string scenarioId;

		/// <summary>
		/// (For experiments) The participants unique ID.
		/// </summary>
		public int PlayerId;

		public int TotalPlayTime;

		/// <summary>
		/// Lines of dialogue uttered during the current scene.
		/// </summary>
		public List<DialogueHistoryEntry> DialogueHistory;

		public GameState()
		{
			guid = Guid.NewGuid().ToString();
			PlayerId = -1;
			DialogueHistory = new List<DialogueHistoryEntry>();
		}
	}
}
