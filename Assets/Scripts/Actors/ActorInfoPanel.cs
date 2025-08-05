using TDRS;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
	public class ActorInfoPanel : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_CloseButton;

		[SerializeField]
		private Image m_CharacterImage;

		//Used to set background. Current setting is to look for a sprite, and if it's not found, use a color.
		[SerializeField]
		private Image m_Background;

		[SerializeField]
		private TMP_Text m_CharacterNameText;

		[SerializeField]
		private TMP_Text m_CharacterBioText;

		[SerializeField]
		private TensionMeter m_TensionMeter;

		[SerializeField]
		private RelationshipMeter m_RelationshipMeter;

		[SerializeField]
		private CharacterSO m_DefaultCharacterShown;

		[SerializeField]
		private Button m_DefaultCharacterShownButton;

		[SerializeField]
		private GameManager m_GameManager;

		[SerializeField]
		private SocialEngineController m_SocialEngineController;

		protected override void SubscribeToEvents()
		{
			base.SubscribeToEvents();
			m_CloseButton.onClick.AddListener( Hide );
		}

		protected override void UnsubscribeFromEvents()
		{
			base.UnsubscribeFromEvents();
			m_CloseButton.onClick.RemoveListener( Hide );
		}

		public override void Show()
		{
			base.Show();
			EventSystem.current.SetSelectedGameObject( m_DefaultCharacterShownButton.gameObject );
			ShowCharacter( m_DefaultCharacterShown );
		}

		/// <summary>
		/// Display information about a character.
		/// </summary>
		/// <param name="characterData"></param>
		public void ShowCharacter(CharacterSO characterData)
		{
			//Ensure button is selected
			m_CharacterBioText.text = characterData.bio;
			m_CharacterImage.sprite = characterData.defaultPose;

			if ( characterData.background )
			{
				m_Background.sprite = characterData.background;
			}
			else
			{
				m_Background.color = characterData.defaultBackgroundColor;
			}

			if ( characterData.uid == m_GameManager.Player.UniqueID )
			{
				m_RelationshipMeter.gameObject.SetActive( false );
				m_TensionMeter.gameObject.SetActive( false );
			}
			else
			{
				int opinion = (int)m_SocialEngineController
					.State
					.GetRelationship( characterData.uid, m_GameManager.Player.UniqueID )
					.Stats.GetStat( "Opinion" ).Value;

				int tension = (int)m_SocialEngineController
					.State
					.GetRelationship( characterData.uid, m_GameManager.Player.UniqueID )
					.Stats.GetStat( "Tension" ).Value;


				m_RelationshipMeter.gameObject.SetActive( true );
				m_TensionMeter.gameObject.SetActive( true );

				m_RelationshipMeter.SetValueLabel( opinion );
				m_RelationshipMeter.FillAmount = (float)opinion / 255f;

				m_TensionMeter.SetValueLabel( tension );
				m_TensionMeter.FillAmount = (float)tension / 100f;
			}

		}
	}
}
