using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "QuestInfoSO", menuName = "Academical/QuestInfoSO" )]
	public class QuestInfoSO : ScriptableObject
	{
		[field: SerializeField] public string id { get; private set; }

		[Header( "General" )]
		public string displayName;

		[Header( "Requirements" )]
		public QuestInfoSO[] questPrerequisites;

		[Header( "Steps" )]
		public GameObject[] questStepPrefabs;

		[Header( "Rewards" )]
		public int points;

		private void OnValidate()
		{
#if UNITY_EDITOR
			// Ensure the id is always the same as the name of the Scriptable Object.
			id = this.name;
			UnityEditor.EditorUtility.SetDirty( this );
#endif
		}
	}
}
