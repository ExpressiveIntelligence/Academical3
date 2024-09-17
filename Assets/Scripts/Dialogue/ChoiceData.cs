using System.Collections.Generic;
using Anansi;

namespace Academical
{
	public class ChoiceData
	{
		public Choice Choice { get; }
		public List<ChoiceEffect> Effects { get; }

		public ChoiceData(Choice choice)
		{
			Choice = choice;
			Effects = new List<ChoiceEffect>();
		}
	}
}
