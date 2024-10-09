using Anansi;

namespace Academical
{
	public class IncrRelationshipStatEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length < 4 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for 'IncrementRelationshipStat {argStr}'. "
					+ $"Expected 4 but was {context.args.Length}."
				);
			}

			Character relationshipOwner = context.simulationController.GetCharacter( context.args[0] );
			Character relationshipTarget = context.simulationController.GetCharacter( context.args[1] );
			string statName = context.args[2];

			if ( !context.socialEngine.State.HasRelationship(
					relationshipOwner.UniqueID,
					relationshipTarget.UniqueID
					)
				)
			{
				throw new System.ArgumentException(
					"No relationship found from "
					+ $"{relationshipOwner.UniqueID} to "
					+ $"{relationshipTarget.UniqueID}."
				);
			}

			if ( !float.TryParse( context.args[3], out var value ) )
			{
				throw new System.ArgumentException(
					$"Expected number as last argument but was '{context.args[3]}'"
				);
			}

			return new IncrementRelationshipStatEffect(
				context,
				relationshipOwner,
				relationshipTarget,
				statName,
				value,
				m_EffectIcon
			);
		}
	}
}
