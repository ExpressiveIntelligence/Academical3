using Anansi;

namespace Academical
{
    public class ActionStoryletInfo
    {
        public StoryletInstance storyletInstance;
        public bool isRequiredAction;
        public bool isAuxiliaryAction;

        public ActionStoryletInfo(StoryletInstance instance)
        {
            storyletInstance = instance;
            isRequiredAction = false;
            isAuxiliaryAction = false;
        }
    }
}
