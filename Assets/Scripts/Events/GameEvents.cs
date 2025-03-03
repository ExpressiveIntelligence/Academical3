using System;
using System.Collections.Generic;
using Anansi;

namespace Academical
{
	public static class GameEvents
	{
		public static Action QuestsViewShown;

		public static Action ActionSelectModalShown;

		public static Action LocationSelectModalShown;

		public static Action ActionSelectModalHidden;

		public static Action LocationSelectModalHidden;

		public static Action GameUIShown;

		public static Action<GameLevelSO> LevelSelected;

		public static Action GameHUDHidden;

		public static Action GameHUDShown;

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
	}
}
