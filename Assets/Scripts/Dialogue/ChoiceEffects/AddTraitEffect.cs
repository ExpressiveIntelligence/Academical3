using Anansi;
using UnityEngine;

namespace Academical
{
	public class AddTraitEffect : IChoiceEffect
	{
		private ChoiceEffectContext m_Context;
		private Character m_Character;
		private string m_TraitId;
		private int m_Duration;
		private Sprite m_Icon;

		public AddTraitEffect(
			ChoiceEffectContext ctx,
			Character character,
			string traitId,
			int duration,
			Sprite icon
		)
		{
			m_Context = ctx;
			m_Character = character;
			m_TraitId = traitId;
			m_Duration = duration;
			m_Icon = icon;
		}

		public void Execute()
		{
			m_Context.socialEngine.State
				.GetAgent( m_Character.UniqueID )
				.AddTrait( m_TraitId, m_Duration );
		}

		public string GetDescription()
		{
			string traitName = (
				m_Context.socialEngine.State.TraitLibrary.Traits[m_TraitId].DisplayName
			);

			return $"{m_Character.DisplayName} gains the {traitName} trait.";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}
	}
}
