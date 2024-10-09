using Anansi;
using UnityEngine;

namespace Academical
{
	public class RemoveRelationshipTraitEffect : IChoiceEffect
	{
		private ChoiceEffectContext m_Context;
		private Character m_Owner;
		private Character m_Target;
		private string m_TraitId;
		private Sprite m_Icon;

		public RemoveRelationshipTraitEffect(
			ChoiceEffectContext ctx,
			Character owner,
			Character target,
			string traitId,
			Sprite icon
		)
		{
			m_Context = ctx;
			m_Owner = owner;
			m_Target = target;
			m_TraitId = traitId;
			m_Icon = icon;
		}

		public void Execute()
		{
			m_Context.socialEngine.State
				.GetRelationship( m_Owner.UniqueID, m_Target.UniqueID )
				.RemoveTrait( m_TraitId );
		}

		public string GetDescription()
		{
			string traitName = (
				m_Context.socialEngine.State.TraitLibrary.Traits[m_TraitId].DisplayName
			);

			string ownerName = m_Owner.DisplayName;
			string targetName = m_Target.DisplayName;

			return $"Relationship from {ownerName} to {targetName} loses the {traitName} trait (if present).";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}
	}
}
