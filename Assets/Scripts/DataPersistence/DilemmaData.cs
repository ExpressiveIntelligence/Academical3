using System;

namespace Academical.Persistence
{
	[Serializable]
	public class DilemmaData
	{
		/// <summary>
		/// The unique ID of the dilemma.
		/// </summary>
		public string dilemmaId;

		/// <summary>
		/// 0 NOT_STARTED, 1 IN_PROGRESS, 2 COMPLETED
		/// </summary>
		public int state;
	}
}
