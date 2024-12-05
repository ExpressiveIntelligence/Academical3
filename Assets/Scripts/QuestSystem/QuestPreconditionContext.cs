namespace Academical
{
	/// <summary>
	/// Contextual information used by quest preconditions
	/// </summary>
	public class QuestPreconditionContext
	{
		public QuestInfoSO QuestInfo { get; }
		public PedagogyManager PedagogyManager { get; }

		public QuestPreconditionContext(
			QuestInfoSO questInfo,
			PedagogyManager pedagogyManager
		)
		{
			this.QuestInfo = questInfo;
			this.PedagogyManager = pedagogyManager;
		}
	}
}
