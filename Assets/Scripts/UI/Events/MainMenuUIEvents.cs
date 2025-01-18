using System;

namespace Academical
{
	public static class MainMenuUIEvents
	{
		public static Action HomeScreenShown;

		public static Action SettingsScreenShown;

		public static Action NewGameScreenShown;

		// public static Action LoadGameScreenShown;

		public static Action CreditsScreenShown;

		public static Action<string> CurrentViewChanged;

		public static Action DialogueHistoryShown;
		public static Action CreditsScreenHidden;
		public static Action NewGameScreenHidden;
		public static Action DialogueHistoryHidden;
		public static Action LoadGameScreenHidden;
		public static Action SettingsScreenHidden;
		public static Action<float> GameLoadingProgressUpdated;
		public static Action<GameSettings> SettingsUpdated;
	}
}
