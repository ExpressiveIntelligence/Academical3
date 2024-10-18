using UnityEngine;

namespace Academical
{
	public abstract class QuestStep : MonoBehaviour
	{
		#region Fields

		private bool m_IsFinished;
		private string m_QuestId;
		private int m_StepIndex;

		#endregion

		#region Public Methods

		public void InitializeQuestStep(string questId, int stepIndex, string questStepState)
		{
			this.m_QuestId = questId;
			this.m_StepIndex = stepIndex;
			if ( questStepState != null && questStepState != "" )
			{
				SetQuestStepState( questStepState );
			}
		}

		#endregion

		#region Protected Methods

		protected void FinishQuestStep()
		{
			if ( !m_IsFinished )
			{
				m_IsFinished = true;
				QuestEvents.OnAdvanceQuest?.Invoke( m_QuestId );
				Destroy( this.gameObject );
			}
		}

		protected void ChangeState(string newState, string newStatus)
		{
			QuestEvents.OnQuestStepStateChange?.Invoke(
				m_QuestId, m_StepIndex, new QuestStepState( newState, newStatus )
			);
		}

		protected abstract void SetQuestStepState(string state);

		#endregion
	}
}
