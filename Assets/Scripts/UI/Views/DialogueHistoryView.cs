using System.Collections.Generic;
using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueHistoryView : UIView
	{
		public static VisualTreeAsset k_DialogueHistoryEntryVisualTree;

		private VisualElement m_EntryContainer;
		private List<DialogueHistoryEntryView> m_Entries;


		public DialogueHistoryView(VisualElement topElement)
			: base( topElement )
		{
			m_Entries = new List<DialogueHistoryEntryView>();
		}

		protected override void SetVisualElements()
		{
			m_EntryContainer = m_TopElement.Q<VisualElement>( "History__entryContainer" );
		}

		public override void Dispose()
		{
			base.Dispose();
			foreach ( var entry in m_Entries )
			{
				entry.Dispose();
			}
			m_Entries.Clear();
		}

		public void AddEntry(string speaker, string text)
		{
			var entryView = new DialogueHistoryEntryView(
				k_DialogueHistoryEntryVisualTree.Instantiate()
			);

			entryView.SetSpeakerName( speaker );
			entryView.SetDialogueText( text );

			m_Entries.Add( entryView );
			m_EntryContainer.Add( entryView.Root );
		}
	}
}
