using UnityEngine;

namespace Academical
{
	/// <summary>
	/// A ScriptableObject for authoring dilemmas in the editor.
	/// </summary>
	[CreateAssetMenu( fileName = "dilemma", menuName = "Academical/Dilemma" )]
	public class DilemmaSO : ScriptableObject
	{
		[Tooltip( "The unique ID of this dilemma." )]
		public string id;

		[Tooltip( "The text name of the dilemma (Does not have to be unique)." )]
		public string dilemmaName;

		[TextArea( 3, 10 )]
		[Tooltip( "A brief description of the dilemma." )]
		public string description;

		[Tooltip( "Notes unlocked as the dilemmas progresses." )]
		public Note[] notes;

		public string[] UnlockPreconditions;

		public string[] CompletionPreconditions;

		public DilemmaData GetDilemmaData()
		{
			return new DilemmaData()
			{
				id = id,
				name = dilemmaName,
				description = description,
				notes = (Note[])notes.Clone(),
				UnlockPreconditions = (string[])UnlockPreconditions.Clone(),
				CompletionPreconditions = (string[])CompletionPreconditions.Clone(),
			};
		}
	}
}
