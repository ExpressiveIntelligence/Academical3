using Anansi;
using UnityEngine;

namespace Academical
{
	public class IncrementRelationshipStatEffect : IChoiceEffect
	{
		#region Fields
		private ChoiceEffectContext m_Context;
		private Character m_Owner;
		private Character m_Target;
		private string m_StatName;
		private float m_Value;
		private Sprite m_Icon;

		#endregion

		#region Constructors

		public IncrementRelationshipStatEffect(
			ChoiceEffectContext context,
			Character owner,
			Character target,
			string statName,
			float value,
			Sprite icon
		)
		{
			m_Context = context;
			m_Owner = owner;
			m_Target = target;
			m_StatName = statName;
			m_Value = value;
			m_Icon = icon;
		}

		#endregion

		#region Public Method

		public void Execute()
		{
			var stat = m_Context.socialEngine.State
				.GetRelationship( m_Owner.UniqueID, m_Target.UniqueID )
				.Stats.GetStat( m_StatName );

			stat.BaseValue += m_Value;
		}

		public string GetDescription()
		{
			string ownerName = m_Owner.DisplayName;
			string targetName = m_Target.DisplayName;

			string sign = (m_Value >= 0) ? "+" : "-";
			return $"{sign}{m_Value} to {m_StatName} relationship stat from {ownerName} to {targetName}.";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}

		#endregion
	}
}
