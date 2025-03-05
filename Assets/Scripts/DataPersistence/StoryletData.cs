using System;

namespace Academical.Persistence
{
	[Serializable]
	public class StoryletData
	{
		/// <summary>
		/// The knot name of the storylet in Ink.
		/// </summary>
		public string storyletId;

		/// <summary>
		/// The number of storylet selections before this one may appear again.
		/// </summary>
		public int cooldown;

		/// <summary>
		/// The number of times the storylet has been seen.
		/// </summary>
		public int timesVisited;
	}
}
