using Anansi;

namespace Academical
{
    public class LocationStoryletInfo
    {
        public StoryletInstance storyletInstance;
        public bool hasRequiredActivities;
        public bool hasAuxiliaryActivities;

        public LocationStoryletInfo(StoryletInstance instance)
        {
            storyletInstance = instance;
            hasAuxiliaryActivities = false;
            hasRequiredActivities = false;
        }
    }
}
