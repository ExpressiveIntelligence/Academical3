using Anansi;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Helps record and clear dialogue history in the game state.
	/// </summary>
	public class DialogueHistorySystem : MonoBehaviour
	{
		[SerializeField]
		private DialogueManager m_DialogueManager;

		[SerializeField]
		private bool m_ClearOnNewDialogueScene = true;

		private void OnEnable()
		{
			DialogueEvents.OnNextDialogueLine += RecordDialogueLine;
			DialogueEvents.DialogueStarted += OnDialogueStarted;
		}

		private void OnDisable()
		{
			DialogueEvents.OnNextDialogueLine -= RecordDialogueLine;
		}

		private void OnDialogueStarted()
		{
			if ( m_ClearOnNewDialogueScene )
			{
				GameStateManager.GetGameState().DialogueHistory.Clear();
			}
		}

		private void RecordDialogueLine(string text)
		{
			SpeakerInfo currentSpeaker = m_DialogueManager.CurrentSpeaker;

			if ( currentSpeaker == null || text == "" ) return;

			GameStateManager.GetGameState().DialogueHistory.Add(
				new DialogueHistoryEntry()
				{
					Speaker = currentSpeaker.SpeakerName,
					Text = text
				}
			);
		}
	}
}
