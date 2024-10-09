using Anansi;
using UnityEngine;

namespace Academical
{
	public class AddRelationshipTraitEffect : IChoiceEffect
	{
		private ChoiceEffectContext m_Context;
		private Character m_Owner;
		private Character m_Target;
		private string m_TraitId;
		private int m_Duration;
		private Sprite m_Icon;

		public AddRelationshipTraitEffect(
			ChoiceEffectContext ctx,
			Character owner,
			Character target,
			string traitId,
			int duration,
			Sprite icon
		)
		{
			m_Context = ctx;
			m_Owner = owner;
			m_Target = target;
			m_TraitId = traitId;
			m_Duration = duration;
			m_Icon = icon;
		}

		public void Execute()
		{
			m_Context.socialEngine.State
				.GetRelationship( m_Owner.UniqueID, m_Target.UniqueID )
				.AddTrait( m_TraitId, m_Duration );
		}

		public string GetDescription()
		{
			string traitName = (
				m_Context.socialEngine.State.TraitLibrary.Traits[m_TraitId].DisplayName
			);

			string ownerName = m_Owner.DisplayName;
			string targetName = m_Target.DisplayName;

			return $"Relationship from {ownerName} to {targetName} gain the {traitName} trait.";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}
	}
}
