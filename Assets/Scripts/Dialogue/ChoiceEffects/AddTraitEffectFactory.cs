using Anansi;

namespace Academical
{
	public class AddTraitEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length < 2 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for 'AddAgentTrait {argStr}'. "
					+ $"Expected at least 2 but was {context.args.Length}."
				);
			}

			Character character = context.simulationController.GetCharacter( context.args[0] );
			string traitID = context.args[1];
			int duration = -1;

			if ( context.args.Length >= 3 )
			{
				if ( !int.TryParse( context.args[2], out var value ) )
				{
					throw new System.ArgumentException(
						$"Expected integer as 3rd argument but was '{context.args[2]}'"
					);
				}
				duration = value;
			}

			return new AddTraitEffect(
				context,
				character,
				traitID,
				duration,
				m_EffectIcon
			);
		}
	}
}
