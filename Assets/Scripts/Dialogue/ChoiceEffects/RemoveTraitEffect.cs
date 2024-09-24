using Anansi;
using UnityEngine;

namespace Academical
{
	public class RemoveTraitEffect : IChoiceEffect
	{
		private ChoiceEffectContext m_Context;
		private Character m_Character;
		private string m_TraitId;
		private Sprite m_Icon;

		public RemoveTraitEffect(
			ChoiceEffectContext ctx,
			Character character,
			string traitId,
			Sprite icon
		)
		{
			m_Context = ctx;
			m_Character = character;
			m_TraitId = traitId;
			m_Icon = icon;
		}

		public void Execute()
		{
			m_Context.socialEngine.State
				.GetAgent( m_Character.UniqueID )
				.RemoveTrait( m_TraitId );
		}

		public string GetDescription()
		{
			string traitName = (
				m_Context.socialEngine.State.TraitLibrary.Traits[m_TraitId].DisplayName
			);

			return $"{m_Character.DisplayName} loses the {traitName} trait, if present.";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}
	}
}
