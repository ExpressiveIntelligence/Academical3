using System.Collections.Generic;
using Anansi;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class DialogueChoiceModal : UIComponent
	{
		#region Fields

		/// <summary>
		/// A reference to the container that holds the choice buttons.
		/// </summary>
		[SerializeField]
		private GameObject m_ChoiceButtonContainer;

		/// <summary>
		/// A reference to the prefab used to create choice buttons.
		/// </summary>
		[SerializeField]
		private GameObject m_ChoiceButtonPrefab;

		/// <summary>
		/// A reference to the UI element holding the choices.
		/// </summary>
		private List<DialogueChoiceButton> m_ChoiceButtons = new List<DialogueChoiceButton>();

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			DialogueEvents.ChoicesUpdated += OnChoicesShown;
			DialogueEvents.ChoicesHidden += OnChoicesHidden;
		}

		protected override void UnsubscribeFromEvents()
		{
			DialogueEvents.ChoicesUpdated -= OnChoicesShown;
			DialogueEvents.ChoicesHidden -= OnChoicesHidden;
		}

		#endregion

		#region Private Methods

		private void OnChoicesShown(List<Choice> choices)
		{
			ClearChoices();
			foreach ( var entry in choices )
			{
				GameObject obj = Instantiate(
					m_ChoiceButtonPrefab, m_ChoiceButtonContainer.transform
				);

				var button = obj.GetComponent<DialogueChoiceButton>();

				button.SetChoiceData( entry );

				m_ChoiceButtons.Add( button );
			}
		}

		private void OnChoicesHidden()
		{
			Hide();
		}

		private void ClearChoices()
		{
			foreach ( var button in m_ChoiceButtons )
			{
				Destroy( button.gameObject );
			}

			m_ChoiceButtons.Clear();
		}

		#endregion

	}
}
