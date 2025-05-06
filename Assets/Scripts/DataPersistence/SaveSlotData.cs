using System;

namespace Academical.Persistence
{
	[Serializable]
	public class SaveSlotData
	{
		/// <summary>
		/// The GUID of this save
		/// </summary>
		public string guid;

		/// <summary>
		/// The ID of the scenario being played.
		/// </summary>
		public string scenarioId;

		/// <summary>
		/// The total number of seconds the game has been played.
		/// </summary>
		public int totalPlaytime;

		/// <summary>
		/// The date/time this save was created.
		/// </summary>
		public string saveTimeStamp;

		/// <summary>
		/// Was this an autosave done by the game.
		/// </summary>
		public bool isAutoSave;

		/// <summary>
		/// The Id of the players current location in the game.
		/// </summary>
		public string currentLocationId;

		/// <summary>
		/// The current in-game day.
		/// </summary>
		public int currentDay;

		/// <summary>
		/// The current in-game time of day.
		/// </summary>
		public string currentTimeOfDay;

	}
}
