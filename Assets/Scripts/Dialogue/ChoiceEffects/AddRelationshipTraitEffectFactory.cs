using Anansi;

namespace Academical
{
	public class AddRelationshipTraitEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			if ( context.args.Length < 3 )
			{
				string argStr = string.Join( " ", context.args );

				throw new System.ArgumentException(
					$"Incorrect number of arguments for 'AddRelationshipTrait {argStr}'. "
					+ $"Expected at least 3 but was {context.args.Length}."
				);
			}

			Character relationshipOwner = context.simulationController.GetCharacter( context.args[0] );
			Character relationshipTarget = context.simulationController.GetCharacter( context.args[1] );
			string traitId = context.args[2];
			int duration = -1;

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

			if ( context.args.Length >= 4 )
			{
				if ( !int.TryParse( context.args[3], out var value ) )
				{
					throw new System.ArgumentException(
						$"Expected integer as 4th argument but was '{context.args[3]}'"
					);
				}
				duration = value;
			}

			return new AddRelationshipTraitEffect(
				context,
				relationshipOwner,
				relationshipTarget,
				traitId,
				duration,
				m_EffectIcon
			);
		}
	}
}
