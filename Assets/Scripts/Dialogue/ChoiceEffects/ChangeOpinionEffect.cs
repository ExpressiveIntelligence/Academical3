using Anansi;
using UnityEngine;

namespace Academical
{
	public class ChangeOpinionEffect : IChoiceEffect
	{
		#region Fields
		private ChoiceEffectContext m_Context;
		private Character m_Owner;
		private Character m_Target;
		private float m_Value;
		private Sprite m_Icon;

		#endregion

		#region Constructors

		public ChangeOpinionEffect(
			ChoiceEffectContext context,
			Character owner,
			Character target,
			float value,
			Sprite icon
		)
		{
			m_Context = context;
			m_Owner = owner;
			m_Target = target;
			m_Value = value;
			m_Icon = icon;
		}

		#endregion

		#region Public Method

		public void Execute()
		{
			var stat = m_Context.socialEngine.State
				.GetRelationship( m_Owner.UniqueID, m_Target.UniqueID )
				.Stats.GetStat( "Opinion" );

			stat.BaseValue += m_Value;
		}

		public string GetDescription()
		{
			string ownerName = m_Owner.DisplayName;
			string targetName = m_Target.DisplayName;
			string sign = (m_Value > 0) ? "+" : "";
			return $"{ownerName} opinion of {targetName}: {sign}{m_Value}";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}

		#endregion
	}
}
