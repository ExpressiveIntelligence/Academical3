namespace Academical.Persistence
{
	/// <summary>
	/// Object that serializes data to and from a given path.
	/// </summary>
	public interface IDataService
	{
		bool SaveData<T>(string path, T data);

		public bool FileExists(string path);

		public T LoadData<T>(string path);
	}
}
