using System;

namespace Academical
{
	/// <summary>
	/// A static event bus class for the quest/pedagogy management system.
	/// </summary>
	public static class QuestEvents
	{
		/// <summary>
		/// Action invoked when starting a quest.
		/// </summary>
		public static Action<string> OnStartQuest;

		/// <summary>
		/// Action invoked when advancing to the next quest step.
		/// </summary>
		public static Action<string> OnAdvanceQuest;

		/// <summary>
		/// Action invoked when a quest is finished.
		/// </summary>
		public static Action<string> OnFinishQuest;

		/// <summary>
		/// Action invoked when a quest's state has changed.
		/// </summary>
		public static Action<Quest> OnQuestStateChange;

		/// <summary>
		/// Action invoked when the state of a quest's step has changed.
		/// </summary>
		public static Action<string, int, QuestStepState> OnQuestStepStateChange;
	}
}
