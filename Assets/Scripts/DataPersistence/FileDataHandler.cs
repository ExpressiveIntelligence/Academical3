using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO;
using Academical;

public class FileDataHandler
{
	private string dataDirPath = "";
	private string dataFileName = "";

	public FileDataHandler(string dataDirPath, string dataFileName)
	{
		this.dataDirPath = dataDirPath;
		this.dataFileName = dataFileName;
	}

	public GameState Load()
	{
		//Combine accounts for different OS
		string fullPath = Path.Combine( dataDirPath, dataFileName );
		GameState loadedData = null;
		if ( File.Exists( fullPath ) )
		{
			try
			{
				string dataToLoad = "";
				using ( FileStream stream = new FileStream( fullPath, FileMode.Open ) )
				{
					using ( StreamReader reader = new StreamReader( stream ) )
					{
						dataToLoad = reader.ReadToEnd();
					}
				}

				// deserialize
				loadedData = JsonUtility.FromJson<GameState>( dataToLoad );
			}
			catch ( Exception e )
			{
				Debug.LogError( "Couldn't load from file: " + fullPath + "\n" + e );
			}
		}
		return loadedData;
	}

	public void Save(GameState state)
	{
		//Combine accounts for different OS
		string fullPath = Path.Combine( dataDirPath, dataFileName );
		try
		{
			//create directory if it doesn't exist already
			Directory.CreateDirectory( Path.GetDirectoryName( fullPath ) );

			//serialize into Json
			string dataToStore = JsonUtility.ToJson( state, true );

			//write to file
			using ( FileStream stream = new FileStream( fullPath, FileMode.Create ) )
			{
				using ( StreamWriter writer = new StreamWriter( stream ) )
				{
					writer.Write( dataToStore );
				}
			}
		}
		catch ( Exception e )
		{
			Debug.LogError( "Couldn't save to path: " + fullPath + "\n" + e );
		}
	}

}
