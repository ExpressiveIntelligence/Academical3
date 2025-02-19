using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "InfoDialogData", menuName = "Academical/InfoDialogData" )]
	public class InfoDialogDataSO : ScriptableObject
	{
		[Tooltip( " Unique identifier for this info dialog." )]
		public string id;

		[Tooltip( "Window title for this info dialog." )]
		public string title;

		[Tooltip( "Slides of information displayed in this dialog." )]
		public InfoDialogSlide[] slides;

		public InfoDialogData GetInfoDialogData()
		{
			return new InfoDialogData()
			{
				id = id,
				title = title,
				slides = (InfoDialogSlide[])slides.Clone()
			};
		}
	}
}
