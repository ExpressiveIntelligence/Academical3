using System.Linq;
using Anansi;
using TDRS;

namespace Academical
{
	public class FireSocialEventEffectFactory : ChoiceEffectFactory
	{
		public override IChoiceEffect CreateEffect(ChoiceEffectContext context)
		{
			string eventName = context.args[0];
			string[] agentIDs = context.args.ToList()
				.GetRange( 1, context.args.Length - 1 )
				.ToArray();

			SocialEventInstance eventInstance = context.socialEngine.State.InstantiateSocialEvent(
				eventName, agentIDs
			);

			return new FireSocialEventEffect(
				eventInstance,
				m_EffectIcon
			);
		}
	}
}
