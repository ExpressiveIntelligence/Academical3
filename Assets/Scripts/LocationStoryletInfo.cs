using Anansi;

namespace Academical
{
	public class LocationStoryletInfo
	{
		public StoryletInstance storyletInstance;
		public bool hasRequiredActivities;
		public bool hasAuxillaryActivities;

		public LocationStoryletInfo(StoryletInstance instance)
		{
			storyletInstance = instance;
			hasAuxillaryActivities = false;
			hasRequiredActivities = false;
		}
	}
}
