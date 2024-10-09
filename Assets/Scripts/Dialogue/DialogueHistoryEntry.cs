namespace Academical
{
	public class DialogueHistoryEntry
	{
		public string Speaker { get; }
		public string Text { get; }

		public DialogueHistoryEntry(string speaker, string text)
		{
			Speaker = speaker;
			Text = text;
		}
	}
}
