using System;
using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "Character", menuName = "Academical/Character" )]
	public class CharacterSO : ScriptableObject
	{
		[Tooltip( "A unique ID for this character." )]
		public string uid;

		[Tooltip( "The name displayed in the dialogue box." )]
		public string displayName;

		[Tooltip( "The color used when displaying this character's name in dialogue" )]
		public Color nameColor;

		[Tooltip( "A short description of this character." )]
		[TextArea( 3, 5 )]
		public string bio;

		[Tooltip( "Pose sprites." )]
		public CharacterPoseData[] poses;

		[Tooltip( "The default pose to use." )]
		public Sprite defaultPose;

		[Tooltip( "The default background color to use. Will be used as a solid background if background image is not found." )]
		public Color defaultBackgroundColor;

		[Tooltip( "The default background for characters to use." )]
		public Sprite background;

		[Tooltip( "Starting relationship settings." )]
		public CharacterRelationshipData[] relationships;
	}

	[Serializable]
	public class CharacterRelationshipData
	{
		public string targetUid;
		public int opinionBase;
		public string[] traits;
	}

	[Serializable]
	public class CharacterPoseData
	{
		public string poseName;
		public Sprite sprite;
	}
}
