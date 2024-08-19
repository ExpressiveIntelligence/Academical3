using System;

namespace Academical
{
	public static class SettingsScreenEvents
	{
		public static Action SettingsShown;

		public static Action<GameData> GameDataLoaded;

		public static Action<GameData> SettingsUpdated;

		public static Action<int> SoundVolumeSet;

		public static Action<int> TextSpeedSet;
	}
}
