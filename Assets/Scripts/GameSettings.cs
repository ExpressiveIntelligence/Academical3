using System;

namespace Academical
{
	/// <summary>
	/// Maintains player settings across playthroughs.
	/// </summary>
	[Serializable]
	public class GameSettings
	{
		public int MasterVolume;
		public int SfxVolume;
		public int MusicVolume;
		public TextSpeed TextSpeed;

		public GameSettings()
		{
			MasterVolume = 100;
			SfxVolume = 30;
			MusicVolume = 100;
			TextSpeed = TextSpeed.NO_DELAY;
		}

		public GameSettings(GameSettings original)
		{
			MasterVolume = original.MasterVolume;
			SfxVolume = original.SfxVolume;
			MusicVolume = original.MusicVolume;
			TextSpeed = original.TextSpeed;
		}
	}
}
