using UnityEngine;

namespace Academical
{
	/// <summary>
	/// A prerequisite for completing a quest.
	/// </summary>
	public abstract class QuestPreconditionSO : ScriptableObject
	{
		/// <summary>
		/// Evaluate the precondition and return true if satisfied.
		/// </summary>
		/// <returns></returns>
		public abstract bool Evaluate(QuestPreconditionContext context);
	}
}
