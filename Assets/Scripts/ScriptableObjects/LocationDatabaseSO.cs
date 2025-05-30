using System;
using UnityEngine;

namespace Academical
{
	[CreateAssetMenu( fileName = "LocationDatabase", menuName = "Academical/LocationDatabase" )]
	public class LocationDatabaseSO : ScriptableObject
	{
		public LocationData[] locations;

		public LocationData GetLocationData(string uid)
		{
			foreach ( LocationData entry in locations )
			{
				if ( entry.uid == uid )
				{
					return entry;
				}
			}
			return null;
		}
	}

	[Serializable]
	public class LockConditionData
	{
		public string[] conditions;
		public string text;
	}

	[Serializable]
	public class ConnectedLocationData
	{
		public string locationId;
		public LockConditionData[] lockConditions;
	}

	[Serializable]
	public class LocationSprite
	{
		public string timeOfDay;
		public Sprite sprite;
	}

	[Serializable]
	public class LocationData
	{
		public string displayName;
		public string uid;
		public Color nameColor;
		public Sprite sprite;
		[TextArea( 3, 5 )]
		public string bio;
		public ConnectedLocationData[] connectedLocations;
		public Sprite defaultBackground;
		public LockConditionData[] lockConditions;
	}
}
