namespace Academical
{
	public interface IDataPersistence
	{
		void LoadData(GameState data);

		void SaveData(GameState data);
	}
}
