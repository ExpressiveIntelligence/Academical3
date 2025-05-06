using System;

namespace Academical.Persistence
{
	[Serializable]
	public class GameSavedEventResult
	{
		public bool success;
		public string message;

		public static GameSavedEventResult Success()
		{
			return new GameSavedEventResult()
			{
				success = true,
				message = "",
			};
		}

		public static GameSavedEventResult Error(string message = "")
		{
			return new GameSavedEventResult()
			{
				success = false,
				message = message
			};
		}
	}
}
