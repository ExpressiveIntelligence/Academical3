using Anansi;

namespace Academical
{
	public class ActionStoryletInfo
	{
		public StoryletInstance storyletInstance;
		public bool isRequiredAction;
		public bool isAuxillaryAction;

		public ActionStoryletInfo(StoryletInstance instance)
		{
			storyletInstance = instance;
			isRequiredAction = false;
			isAuxillaryAction = false;
		}
	}
}
