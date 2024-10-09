using Anansi;

namespace Academical
{
	public class RemoveTraitEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length != 2 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for 'RemoveTrait {argStr}'. "
					+ $"Expected 2 but was {context.args.Length}."
				);
			}

			Character character = context.simulationController.GetCharacter( context.args[0] );
			string traitID = context.args[1];

			return new RemoveTraitEffect(
				context,
				character,
				traitID,
				m_EffectIcon
			);
		}
	}
}
