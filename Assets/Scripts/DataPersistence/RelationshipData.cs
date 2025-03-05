using System;

namespace Academical.Persistence
{
	[Serializable]
	public class RelationshipData
	{
		/// <summary>
		/// The UID of the character that holds this opinion.
		/// </summary>
		public string subjectId;

		/// <summary>
		/// The UId of the character the opinion is about.
		/// </summary>
		public string targetId;

		/// <summary>
		/// The base opinion score.
		/// </summary>
		public int opinionBase;
	}
}
