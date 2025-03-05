using System;
using System.Collections.Generic;

namespace Academical.Persistence
{
	/// <summary>
	/// Tracks all a players save slots.
	/// </summary>
	[Serializable]
	public class SaveSlotManifestFile
	{
		/// <summary>
		/// GUID's of save slots.
		/// </summary>
		public List<SaveSlotData> saves;

		public SaveSlotManifestFile()
		{
			saves = new List<SaveSlotData>();
		}
	}
}
