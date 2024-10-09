using System;
using System.Collections.Generic;
using Anansi;

namespace Academical
{
	/// <summary>
	/// Dialogue-related events used to communicate between various game systems and the UI.
	/// </summary>
	public static class DialogueEvents
	{
		/// <summary>
		/// Action invoked when starting a new dialogue;
		/// </summary>
		public static Action DialogueStarted;

		/// <summary>
		/// Action invoked when ending a dialogue;
		/// </summary>
		public static Action DialogueEnded;

		/// <summary>
		/// Action invoked when advancing the dialogue;
		/// </summary>
		public static Action AdvanceDialogueButtonClicked;

		/// <summary>
		/// Action invoked when the current speaker changes
		/// </summary>
		public static Action<SpeakerInfo> SpeakerChanged;

		/// <summary>
		/// Action invoked when the current background changes.
		/// </summary>
		public static Action<BackgroundInfo> BackgroundChanged;

		/// <summary>
		/// Action invoked when attempting to get user input.
		/// </summary>
		public static Action<InputRequest> InputRequested;

		/// <summary>
		/// Invoked when we have the next line of story dialogue.
		/// </summary>
		public static Action<string> OnNextDialogueLine;

		/// <summary>
		/// Action invoked when dialogue choices are shown on screen.
		/// </summary>
		public static Action<List<Choice>> ChoicesUpdated;

		public static Action ChoicesShown;

		/// <summary>
		/// Action invoked when dialogue choices are hidden from the screen.
		/// </summary>
		public static Action ChoicesHidden;

		/// <summary>
		/// Action invoked when a choice is selected.
		/// </summary>
		public static Action<Choice> ChoiceSelected;

		/// <summary>
		/// Action invoked when loading external functions to register with the story.
		/// </summary>
		public static Action<Ink.Runtime.Story> InkStoryLoaded;

		public static Action DialogueHistoryShown;

		public static Action DialogueUIHidden;

		public static Action DialogueUIShown;

		public static Action AdvanceDialogueButtonDisabled;

		public static Action AdvanceDialogueButtonEnabled;

		public static Action DialogueAdvanced;

		public static Action<string> SpeakerNameChanged;

		public static Action<string> DialogueTextChanged;
	}

}
