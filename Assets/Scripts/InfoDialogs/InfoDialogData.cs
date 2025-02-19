using System;

namespace Academical
{
	[Serializable]
	public class InfoDialogData
	{
		/// <summary>
		/// The unique identifier for this dialog info.
		/// </summary>
		public string id;

		/// <summary>
		/// The window title for this information.
		/// </summary>
		public string title;

		/// <summary>
		/// Slides of information displayed in this dialog.
		/// </summary>
		public InfoDialogSlide[] slides;
	}
}
