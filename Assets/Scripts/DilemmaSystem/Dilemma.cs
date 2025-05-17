using System.Collections.Generic;

namespace Academical
{
	public class Dilemma
	{
		private DilemmaData m_Data;

		private DilemmaStatus m_Status;

		public List<DilemmaStep> CompletedSteps;

		public string ID => m_Data.id;

		public string Name => m_Data.displayName;

		public string Description => m_Data.description;

		public string[] Preconditions => m_Data.preconditions;

		public DilemmaStep[] Steps => m_Data.steps;

		public DilemmaStatus Status { get => m_Status; set => m_Status = value; }

		public Dilemma(DilemmaData data)
		{
			m_Data = data;
			CompletedSteps = new List<DilemmaStep>();
		}
	}
}
