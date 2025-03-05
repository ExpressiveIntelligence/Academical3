using System;

namespace Academical.Persistence
{
	[Serializable]
	public class ChoiceHistoryEntryData
	{
		/// <summary>
		/// The unique ID for this choice.
		/// </summary>
		public string choiceId;

		/// <summary>
		/// The text shown in the choice button.
		/// </summary>
		public string choiceLabel;

		/// <summary>
		/// The index of the choice when presented.
		/// </summary>
		public int choiceIndex;
	}
}
