using Anansi;
using TDRS;
using UnityEngine;

namespace Academical
{
	public class FireSocialEventEffect : IChoiceEffect
	{
		private SocialEventInstance m_EventInstance;
		private Sprite m_Icon;

		public FireSocialEventEffect(
			SocialEventInstance eventInstance,
			Sprite icon
		)
		{
			m_EventInstance = eventInstance;
			m_Icon = icon;
		}

		public void Execute()
		{
			m_EventInstance.Dispatch();
		}

		public string GetDescription()
		{
			return m_EventInstance.Description;
		}

		public Sprite GetIcon()
		{
			return m_Icon;
		}
	}
}
