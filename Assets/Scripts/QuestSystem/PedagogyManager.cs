using System;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

namespace Academical
{
	public class PedagogyManager : MonoBehaviour
	{
		#region Private Fields

		[Header( "Config" )]
		[SerializeField]
		private bool m_LoadQuestState = true;

		private Dictionary<string, Quest> m_QuestMap;

		#endregion

		#region Unity Lifecycle Methods

		private void Awake()
		{
			m_QuestMap = CreateQuestMap();
		}

		private void OnEnable()
		{
			QuestEvents.OnStartQuest += StartQuest;
			QuestEvents.OnAdvanceQuest += AdvanceQuest;
			QuestEvents.OnFinishQuest += FinishQuest;
			QuestEvents.OnQuestStepStateChange += QuestStepStateChange;
		}

		private void OnDisable()
		{
			QuestEvents.OnStartQuest -= StartQuest;
			QuestEvents.OnAdvanceQuest -= AdvanceQuest;
			QuestEvents.OnFinishQuest -= FinishQuest;
			QuestEvents.OnQuestStepStateChange -= QuestStepStateChange;
		}

		private void Start()
		{
			foreach ( Quest quest in m_QuestMap.Values )
			{
				if ( quest.State == QuestState.IN_PROGRESS )
				{
					quest.InstantiateCurrentQuestStep( this.transform );
				}

				QuestEvents.OnQuestStateChange?.Invoke( quest );
			}
		}

		private void Update()
		{
			foreach ( Quest quest in m_QuestMap.Values )
			{
				if (
					quest.State == QuestState.REQUIREMENTS_NOT_MET
					&& CheckRequirementsMet( quest )
				)
				{
					ChangeQuestState( quest.Info.id, QuestState.CAN_START );
				}
			}
		}

		private void OnApplicationQuit()
		{
			foreach ( Quest quest in m_QuestMap.Values )
			{
				SaveQuest( quest );
			}
		}

		#endregion

		#region Private Methods

		private void StartQuest(string id)
		{
			Quest quest = GetQuestById( id );
			quest.InstantiateCurrentQuestStep( this.transform );
			ChangeQuestState( quest.Info.id, QuestState.IN_PROGRESS );
		}

		private void AdvanceQuest(string id)
		{
			Quest quest = GetQuestById( id );

			quest.MoveToNextStep();

			if ( quest.CurrentStepExists() )
			{
				quest.InstantiateCurrentQuestStep( this.transform );
			}
			else
			{
				ChangeQuestState( quest.Info.id, QuestState.CAN_FINISH );
			}
		}

		private void FinishQuest(string id)
		{
			Quest quest = GetQuestById( id );
			ClaimRewards( quest );
			ChangeQuestState( quest.Info.id, QuestState.FINISHED );
		}

		private void ClaimRewards(Quest quest)
		{
			// TODO: Determine the fate of this method.
			return;
		}

		private void QuestStepStateChange(string id, int stepIndex, QuestStepState questStepState)
		{
			Quest quest = GetQuestById( id );
			quest.StoreQuestStepState( questStepState, stepIndex );
			ChangeQuestState( id, quest.State );
		}

		private void ChangeQuestState(string id, QuestState state)
		{
			Quest quest = GetQuestById( id );
			quest.State = state;
			QuestEvents.OnQuestStateChange?.Invoke( quest );
		}

		private bool CheckRequirementsMet(Quest quest)
		{
			// TODO: Reevaluate how this method functions in light of
			// Ink and the Relationship system. Currently it checks for previous
			// quests. We also need it to check its own preconditions.
			bool meetsRequirements = true;

			foreach ( QuestInfoSO prerequisiteQuestInfo in quest.Info.questPrerequisites )
			{
				if ( GetQuestById( prerequisiteQuestInfo.id ).State != QuestState.FINISHED )
				{
					meetsRequirements = false;
				}
			}

			return meetsRequirements;
		}

		private Dictionary<string, Quest> CreateQuestMap()
		{
			QuestInfoSO[] allQuests = Resources.LoadAll<QuestInfoSO>( "Quests" );

			Dictionary<string, Quest> idToQuestMap = new Dictionary<string, Quest>();

			foreach ( QuestInfoSO questInfo in allQuests )
			{
				if ( idToQuestMap.ContainsKey( questInfo.id ) )
				{
					Debug.LogWarning(
						$"Duplicate Quest ID found when creating quest map: {questInfo.id}"
					);
				}

				idToQuestMap.Add( questInfo.id, LoadQuest( questInfo ) );
			}

			return idToQuestMap;
		}

		private Quest GetQuestById(string id)
		{
			Quest quest = m_QuestMap[id];

			if ( quest == null )
			{
				Debug.LogError( $"ID not found in the quest map: {id}" );
			}

			return quest;
		}

		private void SaveQuest(Quest quest)
		{
			try
			{
				QuestData questData = quest.GetQuestData();

				string serializedData = JsonUtility.ToJson( questData );

				PlayerPrefs.SetString( $"Quest__{quest.Info.id}", serializedData );
			}
			catch ( System.Exception e )
			{
				Debug.LogError( $"Failed to save quest with ID, {quest.Info.id}: {e}" );
			}
		}

		private Quest LoadQuest(QuestInfoSO questInfo)
		{
			Quest quest = null;

			try
			{
				if ( PlayerPrefs.HasKey( $"Quest__{questInfo.id}" ) && m_LoadQuestState )
				{
					string serializedData = PlayerPrefs.GetString( $"Quest__{questInfo.id}" );
					QuestData questData = JsonUtility.FromJson<QuestData>( serializedData );
					quest = new Quest(
						questInfo,
						questData.state,
						questData.questStepIndex,
						questData.questStepStates
					);
				}
				else
				{
					quest = new Quest( questInfo );
				}
			}
			catch ( System.Exception e )
			{
				Debug.LogError( $"Failed to load quest with ID, {questInfo.id}. {e}" );
			}

			return quest;
		}

		#endregion
	}
}
