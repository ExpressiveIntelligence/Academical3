using System.Collections.Generic;
using Anansi;
using UnityEngine;

namespace Academical
{
	public class DialogueChoiceTooltip : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private GameObject m_EffectEntryContainer;

		[Header( "UI Prefabs" )]
		[SerializeField]
		private GameObject m_EffectEntryPrefab;

		private List<GameObject> m_Entries = new List<GameObject>();

		protected override void SubscribeToEvents()
		{
			GameEvents.ChoiceTooltipShown += OnChoiceTooltipShown;
			GameEvents.ChoiceTooltipHidden += OnChoiceTooltipHidden;
		}

		protected override void UnsubscribeFromEvents()
		{
			GameEvents.ChoiceTooltipShown -= OnChoiceTooltipShown;
			GameEvents.ChoiceTooltipHidden -= OnChoiceTooltipHidden;
		}

		private void OnChoiceTooltipShown(Choice choice)
		{
			ClearEntries();
			Show();
			foreach ( var entry in choice.Effects )
			{
				GameObject obj = Instantiate(
					m_EffectEntryPrefab, m_EffectEntryContainer.transform
				);

				var tooltipEntry = obj.GetComponent<EffectTooltipEntry>();

				tooltipEntry.SetText( entry.GetDescription() );
				tooltipEntry.SetIcon( entry.GetIcon() );

				m_Entries.Add( obj );
			}
		}

		private void OnChoiceTooltipHidden()
		{
			ClearEntries();
			Hide();
		}

		public void ClearEntries()
		{
			foreach ( var entry in m_Entries )
			{
				Destroy( entry );
			}
			m_Entries.Clear();
		}
	}
}
