using System;
using System.Collections.Generic;
using Academical.Persistence;
using Anansi;

namespace Academical
{
	public static class GameEvents
	{
		/// <summary>
		/// Invoked by the GameManager at the start of the game.
		/// </summary>
		public static Action OnStoryStart;

		/// <summary>
		/// Event invoked when a storylet scene is triggered from the action selection menu.
		/// </summary>
		public static Action OnSceneStart;

		/// <summary>
		/// Event invoked when dialogue concludes and the HUD is shown again.
		/// </summary>
		public static Action OnSceneEnd;

		/// <summary>
		/// Event invoked when the player enters a location.
		/// </summary>
		public static Action<Location> OnLocationEnter;

		/// <summary>
		/// Event invoked when the player leaves a location.
		/// </summary>
		public static Action<Location> OnLocationExit;

		public static Action<GameSavedEventResult> OnGameSaved;

		public static Action QuestsViewShown;

		public static Action ActionSelectModalShown;

		public static Action LocationSelectModalShown;

		public static Action ActionSelectModalHidden;

		public static Action LocationSelectModalHidden;

		public static Action GameUIShown;

		public static Action LevelSelected;

		public static Action GameHUDHidden;

		public static Action GameHUDShown;

		public static Action SettingsScreenShown;

		public static Action SettingsScreenHidden;

		public static Action DialoguePanelShown;

		public static Action DialogueHistoryScreenShown;

		public static Action DialogueHistoryScreenHidden;

		public static Action<Choice> ChoiceTooltipShown;

		public static Action ChoiceTooltipHidden;

		public static Action<StoryletInstance> LocationSelected;

		public static Action<StoryletInstance> ActionSelected;

		public static Action<float> OnFadeToBlack;

		public static Action<float> OnFadeFromBlack;

		public static Action<List<LocationStoryletInfo>> AvailableLocationsUpdated;

		public static Action<List<ActionStoryletInfo>> AvailableActionsUpdated;

		public static Action<List<DialogueHistoryEntry>> DialogueHistoryUpdated;

		public static Action<GameSettings> SettingsUpdated;

		public static Action<string> InfoDialogShown;

		public static Action<float> GameLoadingProgressUpdated;

		/// <summary>
		/// Action invoked when the current day changes.
		/// </summary>
		public static Action<int> OnDayAdvanced;
	}
}
