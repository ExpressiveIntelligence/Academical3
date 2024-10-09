using UnityEngine;

namespace Anansi
{
	/// <summary>
	/// Interface implemented by all effects associated with Ink choices.
	/// </summary>
	public interface IChoiceEffect
	{
		/// <summary>
		/// Get the description for this effect.
		/// </summary>
		/// <returns></returns>
		public string GetDescription();

		/// <summary>
		/// Get the icon to show next to the description of the effect.
		/// </summary>
		/// <returns></returns>
		public Sprite GetIcon();

		/// <summary>
		/// Execute the effect.
		/// </summary>
		public void Execute();
	}
}
