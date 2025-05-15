using System;

namespace Academical
{
	/// <summary>
	/// DilemmaSteps track the player's progress through a particular ethical dilemma.
	/// Steps may be completed in any order. So, designers are responsible for ensuring
	/// that their preconditions are satisfied in the proper order.
	/// </summary>
	[Serializable]
	public class DilemmaStep
	{
		/// <summary>
		/// A unique ID for this step relative to others in the same dilemma.
		/// </summary>
		public string id;

		/// <summary>
		/// RePraxis database preconditions that must be met for this step to be complete.
		/// </summary>
		public string[] preconditions;

		/// <summary>
		/// The text displayed when this database step is complete.
		/// </summary>
		public string text;

		/// <summary>
		/// Does this dilemma step end the dilemma.
		/// </summary>
		public bool isDilemmaEnd;
	}
}
