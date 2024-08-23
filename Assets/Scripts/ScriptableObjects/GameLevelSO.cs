using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "NewLevel", menuName = "Academical/Level" )]
	public class GameLevelSO : ScriptableObject
	{
		public string Title;
		[TextArea]
		public string Description;
		public TextAsset InkScript;
		public Sprite Thumbnail;
	}
}
