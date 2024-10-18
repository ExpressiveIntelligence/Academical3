using System.Data.Common;
using System.Text;
using System.Xml.Serialization;
using Unity.VisualScripting;
using UnityEngine;

namespace Academical
{
	public class Quest
	{
		#region Private Fields

		private QuestInfoSO m_Info;

		private QuestState m_State;

		private int m_CurrentQuestStepIndex;

		private QuestStepState[] m_QuestStepStates;

		#endregion

		#region Public Properties

		public QuestInfoSO Info => m_Info;

		public QuestState State
		{
			get => m_State;
			set
			{
				m_State = value;
			}
		}

		#endregion

		#region Constructors

		public Quest(QuestInfoSO questInfo)
		{
			this.m_Info = questInfo;
			this.m_State = QuestState.REQUIREMENTS_NOT_MET;
			this.m_CurrentQuestStepIndex = 0;
			this.m_QuestStepStates = new QuestStepState[questInfo.questStepPrefabs.Length];
			for ( int i = 0; i < m_QuestStepStates.Length; i++ )
			{
				m_QuestStepStates[i] = new QuestStepState();
			}
		}

		public Quest(
			QuestInfoSO questInfo,
			QuestState questState,
			int currentQuestStepIndex,
			QuestStepState[] questStepStates
		)
		{
			this.m_Info = questInfo;
			this.m_State = questState;
			this.m_CurrentQuestStepIndex = currentQuestStepIndex;
			this.m_QuestStepStates = questStepStates;

			if ( this.m_QuestStepStates.Length != this.m_Info.questStepPrefabs.Length )
			{
				Debug.LogWarning(
					"Quest Step Prefabs and Quest Step State are of different lengths. "
					+ "This indicated something changed with the QuestInfo and the saved data "
					+ "is not out of sync. Reset your data - as this might cause issues. "
					+ $"QuestI ID: {m_Info.id}"
				);
			}
		}

		#endregion

		#region Public Methods

		public void MoveToNextStep()
		{
			m_CurrentQuestStepIndex++;
		}

		public bool CurrentStepExists()
		{
			return m_CurrentQuestStepIndex < m_Info.questStepPrefabs.Length;
		}

		public void InstantiateCurrentQuestStep(Transform parentTransform)
		{
			GameObject questStepPrefab = GetCurrentQuestStepPrefab();

			if ( questStepPrefab != null )
			{
				QuestStep questStep = GameObject.Instantiate( questStepPrefab, parentTransform )
					.GetComponent<QuestStep>();

				questStep.InitializeQuestStep(
					m_Info.id,
					m_CurrentQuestStepIndex,
					m_QuestStepStates[m_CurrentQuestStepIndex].state
				);
			}
		}

		public void StoreQuestStepState(QuestStepState questStepState, int stepIndex)
		{
			if ( stepIndex < m_QuestStepStates.Length )
			{
				m_QuestStepStates[stepIndex].state = questStepState.state;
				m_QuestStepStates[stepIndex].status = questStepState.status;
			}
			else
			{
				Debug.LogWarning(
					"Tried to access quest step data but StepIndex was out of range: "
					+ $"Quest ID: {m_Info.id}, Step Index: {stepIndex}."
				);
			}
		}

		public QuestData GetQuestData()
		{
			return new QuestData( m_State, m_CurrentQuestStepIndex, m_QuestStepStates );
		}

		public string GetFullStatusText()
		{
			StringBuilder sb = new StringBuilder();

			if ( m_State == QuestState.REQUIREMENTS_NOT_MET )
			{
				sb.Append( "Requirements are not yet met to start this quest." );
			}
			else if ( m_State == QuestState.CAN_START )
			{
				sb.Append( "This quest can be started." );
			}
			else
			{
				for ( int i = 0; i < m_CurrentQuestStepIndex; i++ )
				{
					sb.Append( $"<s>{m_QuestStepStates[i].status}</s>\n" );
				}

				if ( CurrentStepExists() )
				{
					sb.Append( $"{m_QuestStepStates[m_CurrentQuestStepIndex].status}\n" );
				}

				if ( m_State == QuestState.CAN_FINISH )
				{
					sb.Append( "The quest is ready to be turned in." );
				}
				else if ( m_State == QuestState.FINISHED )
				{
					sb.Append( "The quest has been completed." );
				}
			}

			return sb.ToString();
		}

		#endregion

		#region Private Methods

		private GameObject GetCurrentQuestStepPrefab()
		{
			GameObject questStepPrefab = null;

			if ( CurrentStepExists() )
			{
				questStepPrefab = m_Info.questStepPrefabs[m_CurrentQuestStepIndex];
			}
			else
			{
				Debug.LogWarning(
					"Tried to access quest step prefab but StepIndex was out of range: "
					+ $"Quest ID: {m_Info.id}, Step Index: {m_CurrentQuestStepIndex}."
				);
			}

			return questStepPrefab;
		}

		#endregion
	}
}
