using System;
using System.Collections.Generic;
using Anansi;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Takes a random sample of choices and returns them.
	/// </summary>
	public class SelectRandomChoicesFilter : ChoiceFilteringStrategyBase
	{
		/// <summary>
		/// The number of choices to sample.
		/// </summary>
		[SerializeField] private int m_NumChoices;

		public override List<Choice> FilterChoices(List<Choice> choices)
		{
			if ( choices.Count <= m_NumChoices )
			{
				return new List<Choice>( choices );
			}

			List<Choice> selectedChoices = new List<Choice>();
			List<Choice> eligibleChoices = new List<Choice>( choices );

			for ( int i = 0; i < m_NumChoices; i++ )
			{
				int choiceIndex = (int)Math.Floor( eligibleChoices.Count * UnityEngine.Random.value );

				selectedChoices.Add( eligibleChoices[choiceIndex] );
				eligibleChoices.RemoveAt( choiceIndex );
			}

			return selectedChoices;
		}
	}
}
