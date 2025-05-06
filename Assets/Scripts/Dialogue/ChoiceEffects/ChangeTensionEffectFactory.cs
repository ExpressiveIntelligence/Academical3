using System.Text.RegularExpressions;
using Anansi;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Creates new instances of TensionChange effects.
	/// This factory maps to the following type of calls in Ink.
	/// <c>ChangeTension Bronislav Ivy ++</c>.
	/// The function needs 3 parameters: a subject, a target, and
	/// an amount, indicated by a number of '-'s or '+'s.
	/// </summary>
	public class ChangeTensionStatFactory : ChoiceEffectFactory
	{
		[SerializeField]
		private Sprite positiveChangeIcon;

		[SerializeField]
		private Sprite negativeChangeIcon;

		[SerializeField]
		private int changePerSymbol;

		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length != 3 )
			{
				throw new System.ArgumentException(
					$"ChangeTension expects 3 arguments a subject_id, a target_id, and an amount."
				);
			}

			Character subject = context.simulationController.GetCharacter( context.args[0] );
			Character target = context.simulationController.GetCharacter( context.args[1] );
			string changeAmountSymbols = context.args[2];

			int changeAmount;
			Sprite icon;

			Regex decreaseRegex = new Regex( "^[-]+$" );
			Regex increaseRegex = new Regex( "^[+]+$" );

			if ( increaseRegex.IsMatch( changeAmountSymbols ) )
			{
				icon = positiveChangeIcon;
				changeAmount = changePerSymbol * changeAmountSymbols.Length;
			}
			else if ( decreaseRegex.IsMatch( changeAmountSymbols ) )
			{
				icon = negativeChangeIcon;
				changeAmount = changePerSymbol * changeAmountSymbols.Length * -1;
			}
			else
			{
				throw new System.ArgumentException(
					$"Invalid change amount '{context.args[2]}'."
				);
			}

			return new ChangeTensionEffect(
				context,
				subject,
				target,
				changeAmount,
				icon
			);
		}
	}
}
