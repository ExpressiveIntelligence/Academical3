using UnityEngine;
using Anansi;
using System.Collections.Generic;

namespace Academical
{
	/// <summary>
	/// An abstract base class for filtering strategy MonoBehaviour scripts.
	/// </summary>
	public abstract class ChoiceFilteringStrategyBase : MonoBehaviour, IChoiceFilteringStrategy
	{
		/// <summary>
		/// Filter the list of provided choices.
		/// </summary>
		/// <param name="choices"></param>
		/// <returns></returns>
		public abstract List<Choice> FilterChoices(List<Choice> choices);
	}
}
