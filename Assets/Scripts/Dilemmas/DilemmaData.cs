using System;

namespace Academical
{
	/// <summary>
	/// Data used to instantiate a dilemma
	/// </summary>
	[Serializable]
	public class DilemmaData
	{
		/// <summary>
		/// The unique ID of this dilemma.
		/// </summary>
		public string id;

		/// <summary>
		/// The text name of the dilemma. (Does not have to be unique)
		/// </summary>
		public string name;

		/// <summary>
		/// A brief description of the dilemma.
		/// </summary>
		public string description;

		public string[] UnlockPreconditions;

		public string[] CompletionPreconditions;

		/// <summary>
		/// Notes associated with this dilemma.
		/// </summary>
		public Note[] notes;
	}
}
