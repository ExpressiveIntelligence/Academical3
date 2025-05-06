using System;

namespace Academical.Persistence
{
	[Serializable]
	public class StoryData
	{
		/// <summary>
		/// Ink state serialized to a JSON string.
		/// </summary>
		public string inkJson;

		/// <summary>
		/// State data about the storylets.
		/// </summary>
		public StoryletData[] storylets;
	}
}
