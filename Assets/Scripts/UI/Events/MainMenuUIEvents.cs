using System;

namespace Academical
{
	public static class MainMenuUIEvents
	{
		public static Action HomeScreenShown;

		public static Action SettingsScreenShown;

		public static Action NewGameScreenShown;

		public static Action LoadGameScreenShown;

		public static Action CreditsScreenShown;

		public static Action<string> CurrentViewChanged;
	}
}
