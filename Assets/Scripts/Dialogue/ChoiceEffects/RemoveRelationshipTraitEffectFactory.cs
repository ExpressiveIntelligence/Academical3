using Anansi;

namespace Academical
{
	public class RemoveRelationshipTraitEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length != 3 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for 'RemoveRelationshipTrait {argStr}'. "
					+ $"Expected 3 but was {context.args.Length}."
				);
			}

			Character relationshipOwner = context.simulationController.GetCharacter( context.args[0] );
			Character relationshipTarget = context.simulationController.GetCharacter( context.args[1] );
			string traitId = context.args[2];

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

			return new RemoveRelationshipTraitEffect(
				context,
				relationshipOwner,
				relationshipTarget,
				traitId,
				m_EffectIcon
			);
		}
	}
}
