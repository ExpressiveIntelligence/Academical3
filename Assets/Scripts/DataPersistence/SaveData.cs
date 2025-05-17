using System;

namespace Academical.Persistence
{
	[Serializable]
	public class SaveData
	{
		/// <summary>
		/// The GUID of this save
		/// </summary>
		public string guid;

		/// <summary>
		/// (Experiment use only) The ID of the participant.
		/// </summary>
		public string playerId;

		/// <summary>
		/// The ID of the level being played.
		/// </summary>
		public string levelId;

		/// <summary>
		/// Dialogue lines presented in the last conversation
		/// </summary>
		public DialogueHistoryEntryData[] dialogueHistory;

		/// <summary>
		/// Recorded choices the player made.
		/// </summary>
		public ChoiceHistoryEntryData[] choiceHistory;

		/// <summary>
		/// Relationship state overrides.
		/// </summary>
		public RelationshipData[] relationships;

		/// <summary>
		/// Serialized JSON state of the social engine.
		/// </summary>
		public string socialEngineJson;

		/// <summary>
		/// State information about current dilemmas;
		/// </summary>
		public DilemmaData[] dilemmas;

		/// <summary>
		/// Ink and storylet data.
		/// </summary>
		public StoryData storyData;

		/// <summary>
		/// RePraxis database data.
		/// </summary>
		public string[] databaseEntries;

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

		public SaveData()
		{
			guid = Guid.NewGuid().ToString();
		}
	}
}
