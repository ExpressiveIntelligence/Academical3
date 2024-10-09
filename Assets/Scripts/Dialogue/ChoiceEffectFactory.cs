using Anansi;
using UnityEngine;

namespace Academical
{
	public abstract class ChoiceEffectFactory : MonoBehaviour
	{
		[SerializeField]
		protected string m_EffectName;

		[SerializeField]
		protected Sprite m_EffectIcon;

		public string EffectName => m_EffectName;

		public Sprite EffectIcon => m_EffectIcon;

		/// <summary>
		/// Create a new ChoiceEffect using the given context.
		/// </summary>
		/// <param name="context"></param>
		/// <returns></returns>
		public abstract IChoiceEffect CreateEffect(ChoiceEffectContext context);
	}
}
