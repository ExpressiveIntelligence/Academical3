using System;

namespace Academical
{
	public static class GameEvents
	{
		public static Action QuestsViewShown;

		public static Action PlayerActionsViewShown;

		public static Action LocationSelectionViewShown;

		public static Action GameUIShown;

		public static Action<GameLevelSO> LevelSelected;

		public static Action GameHUDHidden;

		public static Action GameHUDShown;

		public static Action DialoguePanelShown;
	}
}
