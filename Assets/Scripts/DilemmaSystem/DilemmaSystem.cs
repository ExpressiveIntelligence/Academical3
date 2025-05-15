using System;
using System.Collections.Generic;
using TDRS;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// The <c>DilemmaSystem</c> operates like a quest system in RPGs and is responsible
	/// for tracking the state of the various ethical dilemmas that a player may encounter
	/// during a playthrough.
	/// </summary>
	public class DilemmaSystem : MonoBehaviour
	{
		[Tooltip( "Dilemma ScriptableObjects" )]
		public List<DilemmaData> m_DilemmaData;

		public static DilemmaSystem Instance { get; private set; }

		private List<Dilemma> m_DilemmaList;

		#region Events and Actions

		/// <summary>
		/// Action invoked when starting a dilemma.
		/// </summary>
		public static Action<Dilemma> OnStartDilemma;

		/// <summary>
		/// Action invoked when advancing to the next dilemma step.
		/// </summary>
		public static Action<Dilemma, DilemmaStep> OnAdvanceDilemma;

		/// <summary>
		/// Action invoked when a dilemma is finished.
		/// </summary>
		public static Action<Dilemma> OnFinishDilemma;

		#endregion

		#region Unity Lifecycle Methods

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( gameObject );
				return;
			}
			else
			{
				Instance = this;
				m_DilemmaList = new List<Dilemma>();

				foreach ( DilemmaData data in m_DilemmaData )
				{
					m_DilemmaList.Add( new Dilemma( data ) );
				}
			}
		}

		private void Update()
		{
			UpdateDilemmas();
		}

		#endregion

		#region Public Methods

		/// <summary>
		/// Retrieve a dilemma instance using its ID.
		/// </summary>
		/// <param name="id"></param>
		/// <returns></returns>
		public Dilemma GetDilemmaById(string id)
		{
			foreach ( Dilemma entry in m_DilemmaList )
			{
				if ( entry.ID == id )
				{
					return entry;
				}
			}

			return null;
		}

		/// <summary>
		/// Get all the dilemmas in the system.
		/// </summary>
		/// <returns></returns>
		public List<Dilemma> GetDilemmas()
		{
			return m_DilemmaList;
		}

		/// <summary>
		/// Get all dilemmas that are currently unlocked/started.
		/// </summary>
		/// <returns></returns>
		public static List<Dilemma> GetUnlockedDilemmas()
		{
			List<Dilemma> activeDilemmas = new List<Dilemma>();
			foreach ( Dilemma dilemma in Instance.m_DilemmaList )
			{
				if ( dilemma.Status == DilemmaStatus.IN_PROGRESS || dilemma.Status == DilemmaStatus.FINISHED )
				{
					activeDilemmas.Add( dilemma );
				}
			}
			return activeDilemmas;
		}

		public List<Persistence.DilemmaData> SerializeDilemmas()
		{
			List<Persistence.DilemmaData> dilemmaData = new List<Persistence.DilemmaData>();

			foreach ( Dilemma d in m_DilemmaList )
			{
				var data = new Persistence.DilemmaData()
				{
					dilemmaId = d.ID,
					state = (int)d.Status
				};

				dilemmaData.Add( data );
			}

			return dilemmaData;
		}

		#endregion

		#region Private Methods

		private void UpdateDilemmas()
		{
			RePraxis.RePraxisDatabase db = SocialEngineController.Instance.DB;

			// Loop through all the dilemmas and skip the ones that are finished or active
			// Run the preconditions of the dilemma to see if it should be activated.
			foreach ( Dilemma dilemma in m_DilemmaList )
			{
				// Skip completely
				if ( dilemma.Status == DilemmaStatus.FINISHED )
				{
					continue;
				}

				// Update the notes
				if ( dilemma.Status == DilemmaStatus.IN_PROGRESS )
				{
					UpdateDilemmaSteps( dilemma );
					if ( dilemma.Status == DilemmaStatus.FINISHED )
					{
						FinishDilemma( dilemma );
					}
				}
				// Check the precondition for the dilemma to be active
				else if ( CheckRequirementsMet( dilemma ) )
				{
					StartDilemma( dilemma );
				}
			}
		}

		private void StartDilemma(Dilemma dilemma)
		{
			dilemma.Status = DilemmaStatus.IN_PROGRESS;
			OnStartDilemma?.Invoke( dilemma );
		}

		private void FinishDilemma(Dilemma dilemma)
		{
			dilemma.Status = DilemmaStatus.FINISHED;
			OnFinishDilemma?.Invoke( dilemma );
		}

		private void UpdateDilemmaSteps(Dilemma dilemma)
		{
			RePraxis.RePraxisDatabase db = SocialEngineController.Instance.DB;

			foreach ( DilemmaStep step in dilemma.Steps )
			{
				if ( dilemma.CompletedSteps.Contains( step ) )
				{
					continue;
				}

				RePraxis.DBQuery query = new RePraxis.DBQuery( step.preconditions );
				RePraxis.QueryResult result = query.Run( db );
				if ( result.Success )
				{
					dilemma.CompletedSteps.Add( step );
					OnAdvanceDilemma?.Invoke( dilemma, step );

					if ( step.isDilemmaEnd )
					{
						dilemma.Status = DilemmaStatus.FINISHED;
					}
				}
			}
		}

		private bool CheckRequirementsMet(Dilemma dilemma)
		{
			RePraxis.RePraxisDatabase db = SocialEngineController.Instance.DB;

			RePraxis.DBQuery query = new RePraxis.DBQuery( dilemma.Preconditions );

			RePraxis.QueryResult result = query.Run( db );

			return result.Success;
		}

		#endregion
	}
}
