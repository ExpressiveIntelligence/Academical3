using System;
using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "BackgroundDatabase", menuName = "Academical/BackgroundDatabase" )]
	public class BackgroundDatabaseSO : ScriptableObject
	{
		public BackgroundData[] backgrounds;
	}

	[Serializable]
	public class BackgroundData
	{
		public string uid;
		public Sprite sprite;
	}
}
