using System.Collections.Generic;
using Ink.Parsed;
using TDRS;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Updates the current state of all the dilemmas in the game.
	/// </summary>
	public class DilemmaManager : MonoBehaviour
	{
		[Tooltip( "Dilemma ScriptableObjects" )]
		public List<DilemmaSO> m_DilemmaData;

		public static DilemmaManager Instance { get; private set; }

		private List<Dilemma> m_DilemmaList;

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

				foreach ( DilemmaSO dilemmaSO in m_DilemmaData )
				{
					m_DilemmaList.Add( new Dilemma( dilemmaSO.GetDilemmaData() ) );
				}
			}
		}

		private void Update()
		{
			UpdateDilemmas();
		}

		public List<Persistence.DilemmaData> SerializeDilemmas()
		{
			List<Persistence.DilemmaData> dilemmaData = new List<Persistence.DilemmaData>();

			foreach ( Dilemma d in m_DilemmaList )
			{
				var data = new Persistence.DilemmaData()
				{
					dilemmaId = d.Data.id,
					state = 0
				};

				if ( d.IsCompleted )
				{
					data.state = 2;
				}
				else if ( d.IsUnlocked )
				{
					data.state = 1;
				}

				dilemmaData.Add( data );
			}

			return dilemmaData;
		}

		private void UpdateDilemmas()
		{
			RePraxis.RePraxisDatabase db = SocialEngineController.Instance.DB;

			// Loop through all the dilemmas and skip the ones that are finished or active
			// Run the preconditions of the dilemma to see if it should be activated.
			foreach ( Dilemma dilemma in m_DilemmaList )
			{
				// Skip completely
				if ( dilemma.IsCompleted )
				{
					continue;
				}
				// Update the notes
				else if ( dilemma.IsUnlocked )
				{
					dilemma.UpdateNotes( db );

					// Check if the dilemma is completed
					RePraxis.DBQuery query = new RePraxis.DBQuery( dilemma.Data.CompletionPreconditions );
					RePraxis.QueryResult result = query.Run( db );
					if ( result.Success )
					{
						dilemma.IsCompleted = true;
					}
				}
				// Check the precondition for the dilemma to be active
				else
				{
					RePraxis.DBQuery query = new RePraxis.DBQuery( dilemma.Data.UnlockPreconditions );
					RePraxis.QueryResult result = query.Run( db );
					if ( result.Success )
					{
						dilemma.IsUnlocked = true;
						Debug.Log( "Unlocked new dilemma: " + dilemma.Data.name );
					}
				}
			}
		}

		public static List<Dilemma> GetUnlockedDilemmas()
		{
			List<Dilemma> activeDilemmas = new List<Dilemma>();
			foreach ( Dilemma dilemma in Instance.m_DilemmaList )
			{
				if ( dilemma.IsUnlocked )
				{
					activeDilemmas.Add( dilemma );
				}
			}
			return activeDilemmas;
		}
	}
}
