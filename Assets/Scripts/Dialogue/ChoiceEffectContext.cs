using Anansi;
using TDRS;

namespace Academical
{
	/// <summary>
	/// Information passed to a ChoiceEffectFactory to help with constructing
	/// ChoiceEffect objects.
	/// </summary>
	public class ChoiceEffectContext
	{
		/// <summary>
		/// A reference to the social engine.
		/// </summary>
		public SocialEngineController socialEngine { get; }

		/// <summary>
		/// A reference to the simulation controller with location and character info.
		/// </summary>
		public SimulationController simulationController { get; }

		/// <summary>
		/// The story instance that created the effect.
		/// </summary>
		public Story story { get; }

		/// <summary>
		/// Arguments passed to an effect from within an Ink tag.
		/// </summary>
		public string[] args { get; }

		public ChoiceEffectContext(
			SocialEngineController socialEngine,
			SimulationController simulationController,
			Story story,
			string[] args
		)
		{
			this.socialEngine = socialEngine;
			this.simulationController = simulationController;
			this.story = story;
			this.args = args;
		}
	}
}
