using System;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Anansi;

namespace Academical
{
	public class ActionChoiceButton : UIComponent
	{
		#region Fields
		[Header( "UI Elements" )]
		[SerializeField] private Button m_Button;
		[SerializeField] private TMP_Text m_Text;
		private StoryletInstance m_Storylet;

		#endregion

		#region Public Methods

		public void SetStorylet(StoryletInstance storylet)
		{
			m_Storylet = storylet;
			m_Text.text = storylet.ChoiceLabel;
		}

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_Button.onClick.AddListener( OnClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_Button.onClick.AddListener( OnClicked );
		}

		#endregion

		#region Private Methods

		private void OnClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.ActionSelected?.Invoke( m_Storylet );
		}

		#endregion
	}
}
