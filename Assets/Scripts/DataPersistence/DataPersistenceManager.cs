using System;
using System.IO;
using Academical.Persistence;
using UnityEngine;


namespace Academical
{
	public class DataPersistenceManager : MonoBehaviour
	{
		[Tooltip( "Toggle destruction on load." )]
		[SerializeField]
		private bool m_DontDestroyOnLoad;

		private IDataService m_DataService = new JsonDataService();

		public static DataPersistenceManager Instance { get; private set; }

		public static SaveData SaveData = null;

		private void Awake()
		{
			if ( Instance != null )
			{
				Debug.LogWarning( "Found more than one Data Persistence Manager in the scene." );
				Destroy( this );
				return;
			}

			Instance = this;

			if ( m_DontDestroyOnLoad )
			{
				DontDestroyOnLoad( gameObject );
			}
		}

		/// <summary>
		/// Loads save slots from the manifest data stored on the persistent data path.
		/// </summary>
		public static SaveSlotManifestFile LoadSaveSlots()
		{
			string manifestPath = Path.Combine(
				Application.persistentDataPath, "saves", "manifest.json" );

			if ( !Instance.m_DataService.FileExists( manifestPath ) )
			{
				// Create a blank manifest.
				Instance.m_DataService.SaveData( manifestPath, new SaveSlotManifestFile() );
			}

			SaveSlotManifestFile manifest = Instance.m_DataService.LoadData<SaveSlotManifestFile>(
				manifestPath );

			return manifest;
		}

		/// <summary>
		/// Saves game data to a save slot.
		/// </summary>
		/// <param name="serializedGame"></param>
		/// <param name="saveGuid"></param>
		/// <param name="isAutoSave"></param>
		public static void SaveGame(SaveData saveData)
		{
			if ( saveData.guid == null )
			{
				Debug.LogWarning( "Cannot save game data. No profile given." );
				return;
			}

			saveData.saveTimeStamp = System.DateTime.UtcNow.ToString( "yyyy-MM-ddTHH:mm:ssZ" );

			SaveSlotManifestFile manifest = LoadSaveSlots();

			SaveSlotData saveSlotData = new SaveSlotData()
			{
				guid = saveData.guid,
				levelId = saveData.levelId,
				saveTimeStamp = saveData.saveTimeStamp,
				isAutoSave = saveData.isAutoSave,
				currentDay = saveData.currentDay,
				currentTimeOfDay = saveData.currentTimeOfDay,
				currentLocationId = saveData.currentLocationId,
				totalPlaytime = saveData.totalPlaytime
			};

			bool existingSaveFound = false;

			for ( int i = 0; i < manifest.saves.Count; i++ )
			{
				if ( manifest.saves[i].guid == saveData.guid )
				{
					manifest.saves[i] = saveSlotData;
					existingSaveFound = true;
				}
			}

			if ( existingSaveFound == false )
			{
				manifest.saves.Add( saveSlotData );
			}

			string manifestPath = Path.Combine(
				Application.persistentDataPath, "saves", "manifest.json" );

			Instance.m_DataService.SaveData( manifestPath, manifest );

			string savesDataPath = Path.Combine( Application.persistentDataPath, "saves" );

			string fullPath = Path.Combine( savesDataPath, $"{saveData.guid}.save" );

			Instance.m_DataService.SaveData( fullPath, saveData );

			Debug.Log( "Saved game to: " + savesDataPath );

			GameEvents.OnGameSaved?.Invoke( GameSavedEventResult.Success() );
		}

		/// <summary>
		/// Load the save with the provided GUID.
		/// </summary>
		/// <param name="guid"></param>
		/// <returns></returns>
		public static SaveData LoadGame(string guid)
		{
			string saveFilePath = Path.Combine(
				Application.persistentDataPath, "saves", $"{guid}.save" );

			SaveData saveData = Instance.m_DataService.LoadData<SaveData>(
				saveFilePath );

			return saveData;
		}

		/// <summary>
		/// Delete the save with the provided GUID.
		/// </summary>
		/// <param name="guid"></param>
		public static void DeleteSave(string guid)
		{
			if ( guid == null ) return;


			SaveSlotManifestFile manifest = LoadSaveSlots();

			for ( int i = manifest.saves.Count - 1; i >= 0; i-- )
			{
				if ( manifest.saves[i].guid == guid )
				{
					manifest.saves.RemoveAt( i );
					Debug.Log( $"Removed save from manifest: {guid}" );
				}
			}

			string manifestPath = Path.Combine(
				Application.persistentDataPath, "saves", "manifest.json" );

			Instance.m_DataService.SaveData( manifestPath, manifest );
			Debug.Log( "Updated manifest json" );


			string fullPath = Path.Combine( Application.persistentDataPath, "saves", $"{guid}.save" );
			try
			{
				// ensure the data file exists at this path before deleting the directory
				if ( File.Exists( fullPath ) )
				{
					// delete the profile folder and everything within it
					File.Delete( fullPath );
					Debug.Log( "Deleted Save at: " + fullPath );
				}
				else
				{
					Debug.LogWarning(
						$"Tried to delete save data. No data found at: {fullPath}"
					);
				}
			}
			catch ( Exception e )
			{
				Debug.LogError( "Failed to delete save slot data for slot: "
					+ guid + " at path: " + fullPath + "\n" + e );
			}
		}
	}
}
