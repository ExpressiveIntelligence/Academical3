using Anansi;

namespace Academical
{
	public class IncrementStatEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length < 3 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for IncrementStat {argStr}'. "
					+ $"Expected 3 but was {context.args.Length}."
				);
			}

			Character character = context.simulationController.GetCharacter( context.args[0] );
			string statName = context.args[1];

			if ( !float.TryParse( context.args[2], out var value ) )
			{
				throw new System.ArgumentException(
					$"Expected number as last argument but was '{context.args[2]}'"
				);
			}

			return new IncrementStatEffect(
				context,
				character,
				statName,
				value,
				m_EffectIcon
			);
		}
	}
}
