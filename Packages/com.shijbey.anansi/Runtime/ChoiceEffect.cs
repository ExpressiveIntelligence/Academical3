using UnityEngine;

namespace Anansi
{
	public abstract class ChoiceEffect : IChoiceEffect
	{
		/// <summary>
		/// Get the description for this effect.
		/// </summary>
		/// <returns></returns>
		public string GetDescription()
		{
			return "";
		}

		public Sprite GetIcon()
		{
			return null;
		}

		public void Execute()
		{

		}
	}
}
