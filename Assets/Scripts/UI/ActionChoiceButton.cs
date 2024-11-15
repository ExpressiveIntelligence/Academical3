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
		[SerializeField] private GameObject m_AuxIndicator;
		[SerializeField] private GameObject m_RequiredIndicator;
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

		#region Public Methods

		public void ShowAuxIndicator()
		{
			m_AuxIndicator.SetActive( true );
		}

		public void HideAuxIndicator()
		{
			m_AuxIndicator.SetActive( false );
		}

		public void ShowRequiredIndicator()
		{
			m_RequiredIndicator.SetActive( true );
		}

		public void HideRequiredIndicator()
		{
			m_RequiredIndicator.SetActive( false );
		}

		#endregion

		#region Private Methods

		private void OnClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.ActionSelectModalHidden?.Invoke();
			GameEvents.LocationSelectModalHidden?.Invoke();
			GameEvents.ActionSelected?.Invoke( m_Storylet );
		}

		#endregion
	}
}
