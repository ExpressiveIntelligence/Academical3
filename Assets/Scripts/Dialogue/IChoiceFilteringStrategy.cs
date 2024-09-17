using System.Collections.Generic;

namespace Anansi
{
	/// <summary>
	/// Implements a strategy pattern for how to filter dialogue choices
	/// before presenting them to the player.
	/// </summary>
	public interface IChoiceFilteringStrategy
	{
		/// <summary>
		/// Filter the list of provided choices.
		/// </summary>
		/// <param name="choices"></param>
		/// <returns></returns>
		public List<Choice> FilterChoices(List<Choice> choices);
	}
}
