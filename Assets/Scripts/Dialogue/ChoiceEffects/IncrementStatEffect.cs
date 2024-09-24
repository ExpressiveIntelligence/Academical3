using Anansi;
using UnityEngine;

namespace Academical
{
	public class IncrementStatEffect : IChoiceEffect
	{
		#region Fields
		private ChoiceEffectContext m_Context;
		private Character m_Character;
		private string m_StatName;
		private float m_Value;
		private Sprite m_Icon;

		#endregion

		#region Constructors

		public IncrementStatEffect(
			ChoiceEffectContext context,
			Character character,
			string statName,
			float value,
			Sprite icon
		)
		{
			m_Context = context;
			m_Character = character;
			m_StatName = statName;
			m_Value = value;
			m_Icon = icon;
		}

		#endregion

		#region Public Method

		public void Execute()
		{
			var stat = m_Context.socialEngine.State
				.GetAgent( m_Character.UniqueID )
				.Stats.GetStat( m_StatName );

			stat.BaseValue += m_Value;
		}

		public string GetDescription()
		{
			string characterName = m_Character.DisplayName;
			string sign = (m_Value >= 0) ? "+" : "-";
			return $"{sign}{m_Value} to {characterName}'s {m_StatName} stat.";
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}

		#endregion
	}
}
