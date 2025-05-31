using System;
using System.IO;
using UnityEngine;

namespace Academical.Persistence
{
	public class JsonDataService : IDataService
	{
		public JsonDataService()
		{ }

		public T LoadData<T>(string path)
		{
#if UNITY_WEBGL
			Debug.Log( "UsingPlayerPrefs" );
			if ( !PlayerPrefs.HasKey( path ) )
			{
				Debug.LogError( "Could not load PlayerPref key: " + path );
			}

			try
			{
				T data = JsonUtility.FromJson<T>( PlayerPrefs.GetString( path ) );
				return data;
			}
			catch ( Exception e )
			{
				Debug.LogError( $"Failed to load data due to: {e.Message} {e.StackTrace}" );
				throw e;
			}
#else
			if ( !File.Exists( path ) )
			{
				Debug.LogError( $"Cannot load file at {path}. File does not exist!" );
				throw new FileNotFoundException( $"{path} does not exist!" );
			}

			try
			{
				T data = JsonUtility.FromJson<T>( File.ReadAllText( path ) );
				return data;
			}
			catch ( Exception e )
			{
				Debug.LogError( $"Failed to load data due to: {e.Message} {e.StackTrace}" );
				throw e;
			}
#endif
		}

		public bool FileExists(string path)
		{
#if UNITY_WEBGL
			return PlayerPrefs.HasKey( path );
#else
			return File.Exists( path );
#endif
		}

		public bool SaveData<T>(string path, T data)
		{

#if UNITY_WEBGL
			Debug.Log( "UsingPlayerPrefs" );
			try
			{
				PlayerPrefs.SetString( path, JsonUtility.ToJson( data ) );
				return true;
			}
			catch ( Exception e )
			{
				Debug.LogError( $"Unable to save due to {e.Message} {e.StackTrace}" );
				return false;
			}
#else
			try
			{
				// Delete the file currently at the path.
				if ( File.Exists( path ) )
				{
					File.Delete( path );
				}

				// Create the any intermediate directories.
				if ( !Directory.Exists( Path.GetDirectoryName( path ) ) )
				{
					Directory.CreateDirectory( Path.GetDirectoryName( path ) );
				}

				using ( FileStream stream = new FileStream( path, FileMode.Create ) )
				{
					using ( StreamWriter writer = new StreamWriter( stream ) )
					{
						writer.Write( JsonUtility.ToJson( data ) );
					}
				}
			}
			catch ( Exception e )
			{
				Debug.LogError( $"Unable to save due to {e.Message} {e.StackTrace}" );
			}

			return true;
#endif
		}
	}
}
