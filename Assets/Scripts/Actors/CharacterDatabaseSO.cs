using System;
using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "CharacterDatabase", menuName = "Academical/CharacterDatabase" )]
	public class CharacterDatabaseSO : ScriptableObject
	{
		public CharacterData[] characters;
	}

	[Serializable]
	public class CharacterData
	{
		[Tooltip( "The name displayed in the dialogue box." )]
		public string displayName;

		[Tooltip( "A unique ID for this character." )]
		public string uid;

		[Tooltip( "The color used when displaying this character's name in dialogue" )]
		public Color nameColor;

		[Tooltip( "A short description of this character." )]
		[TextArea( 3, 5 )]
		public string bio;

		[Tooltip( "Pose sprites." )]
		public CharacterPoseData[] poses;

		[Tooltip( "The default pose to use." )]
		public string defaultPose;

		[Tooltip( "Starting relationship settings." )]
		public CharacterRelationshipData[] relationships;
	}
}
