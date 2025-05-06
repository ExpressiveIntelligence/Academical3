using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages the locations and background information.
	/// </summary>
	public class BackgroundManager : MonoBehaviour
	{
		#region Fields

		[SerializeField]
		private BackgroundDatabaseSO m_Backgrounds;

		[SerializeField]
		private LocationDatabaseSO m_Locations;

		private Dictionary<string, BackgroundData> m_BackgroundMap
			= new Dictionary<string, BackgroundData>();

		private Dictionary<string, LocationData> m_LocationMap
			= new Dictionary<string, LocationData>();

		#endregion

		#region Unity Messages

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( this );
				return;
			}

			Instance = this;
			LoadBackgroundsFromInspector();
			LoadLocationsFromInspector();
			DontDestroyOnLoad( this );
		}

		#endregion

		#region Properties

		public static BackgroundManager Instance { get; private set; }

		#endregion

		#region Public Methods

		public static LocationData GetLocationData(string uid)
		{
			Instance.m_LocationMap.TryGetValue( uid, out var data );
			return data;
		}

		public static BackgroundData GetBackgroundData(string uid)
		{
			Instance.m_BackgroundMap.TryGetValue( uid, out var data );
			return data;
		}

		#endregion

		#region Private Methods

		private void LoadLocationsFromInspector()
		{
			if ( m_Locations == null ) return;

			foreach ( LocationData data in m_Locations.locations )
			{
				m_LocationMap[data.uid] = data;
			}
		}

		private void LoadBackgroundsFromInspector()
		{
			if ( m_Backgrounds == null ) return;

			foreach ( BackgroundData data in m_Backgrounds.backgrounds )
			{
				m_BackgroundMap[data.uid] = data;
			}
		}

		#endregion
	}
}
