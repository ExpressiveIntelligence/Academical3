using System.Collections.Generic;

namespace Academical
{
	public class Dilemma
	{
		public DilemmaData Data;

		private bool m_IsUnlocked;

		private bool m_IsCompleted;

		public List<Note> m_ActiveNotes;

		public bool IsUnlocked
		{
			get => m_IsUnlocked;
			set => m_IsUnlocked = value;
		}

		public bool IsCompleted
		{
			get => m_IsCompleted;
			set => m_IsCompleted = value;
		}

		public Dilemma(DilemmaData data)
		{
			Data = data;
			m_ActiveNotes = new List<Note>();
		}

		public void UpdateNotes(RePraxis.RePraxisDatabase db)
		{
			foreach ( Note note in Data.notes )
			{
				if ( m_ActiveNotes.Contains( note ) )
				{
					continue;
				}

				RePraxis.DBQuery query = new RePraxis.DBQuery( note.preconditions );
				RePraxis.QueryResult result = query.Run( db );
				if ( result.Success )
				{
					m_ActiveNotes.Add( note );
				}
			}
		}
	}
}
