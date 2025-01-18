using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using Academical;

public class DataPersistenceManager : MonoBehaviour
{
	[Header( "File Storage Config" )]
	[SerializeField]
	private string m_FileName;

	private GameState m_GameState;
	private List<IDataPersistence> dataPersistenceObjects;
	private FileDataHandler dataHandler;

	public static DataPersistenceManager Instance { get; private set; }

	private void Awake()
	{
		if ( Instance != null )
		{
			Debug.LogError( "Found more than one Data Persistence Manager in the scene." );
			Destroy( this );
			return;
		}

		Instance = this;
		NewGame();
	}

	private void Start()
	{
		this.dataHandler = new FileDataHandler( Application.persistentDataPath, m_FileName );
		this.dataPersistenceObjects = FindAllDataPersistenceObjects();
		LoadGame();
	}

	public void NewGame()
	{
		this.m_GameState = new GameState();
	}

	public void LoadGame()
	{
		// Load any saved data from a file using the data handler
		this.m_GameState = dataHandler.Load();
		// If no data is there, create a new game
		if ( this.m_GameState == null )
		{
			Debug.Log( "No game data found. Creating a new game file." );
			NewGame();
		}
		// Push loaded data to relevant game objects
		foreach ( IDataPersistence dataPersistenceObj in dataPersistenceObjects )
		{
			dataPersistenceObj.LoadData( m_GameState );
		}
	}

	public void SaveGame()
	{
		// Send data to other scripts for update
		foreach ( IDataPersistence dataPersistenceObj in dataPersistenceObjects )
		{
			dataPersistenceObj.SaveData( m_GameState );
		}

		// Save data to persistence using file handler
		dataHandler.Save( m_GameState );
	}

	private void OnApplicationQuit()
	{
		SaveGame();
	}

	private List<IDataPersistence> FindAllDataPersistenceObjects()
	{
		IEnumerable<IDataPersistence> dataPersistenceObjects = FindObjectsOfType<MonoBehaviour>().OfType<IDataPersistence>();

		return new List<IDataPersistence>( dataPersistenceObjects );
	}
}
