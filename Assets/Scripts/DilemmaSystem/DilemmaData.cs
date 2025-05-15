using UnityEngine;

namespace Academical
{
	/// <summary>
	/// A ScriptableObject for authoring dilemmas in the editor.
	/// </summary>
	[CreateAssetMenu( fileName = "DilemmaData", menuName = "Academical/Dilemma Data" )]
	public class DilemmaData : ScriptableObject
	{
		/// <summary>
		/// The unique ID of this dilemma.
		/// </summary>
		[Tooltip( "The unique ID of this dilemma." )]
		public string id;

		/// <summary>
		/// The name of the dilemma to be displayed in the GUI.
		/// </summary>
		[Tooltip( "The name of the dilemma to be displayed in the GUI." )]
		public string displayName;

		/// <summary>
		/// A brief description of the dilemma.
		/// </summary>
		[TextArea( 3, 10 )]
		[Tooltip( "A brief description of the dilemma." )]
		public string description;

		/// <summary>
		/// Steps unlocked as the dilemmas progresses.
		/// </summary>
		[Tooltip( "Steps unlocked as the dilemmas progresses." )]
		public DilemmaStep[] steps;

		/// <summary>
		/// RePraxis database conditions required for the dilemma to be started.
		/// </summary>
		[Tooltip( "RePraxis database conditions required for the dilemma to be started." )]
		public string[] preconditions;
	}
}
