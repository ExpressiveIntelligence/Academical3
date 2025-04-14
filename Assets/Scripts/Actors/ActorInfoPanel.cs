using TDRS;
using TMPro;
using UnityEngine;
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

		[SerializeField]
		private TMP_Text m_CharacterNameText;

		[SerializeField]
		private TMP_Text m_CharacterBioText;

		[SerializeField]
		private TMP_Text m_CharacterOpinionText;

		[SerializeField]
		private CharacterSO m_DefaultCharacterShown;

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
			ShowCharacter( m_DefaultCharacterShown );
		}

		/// <summary>
		/// Display information about a character.
		/// </summary>
		/// <param name="characterData"></param>
		public void ShowCharacter(CharacterSO characterData)
		{
			m_CharacterNameText.text = characterData.displayName;
			m_CharacterBioText.text = characterData.bio;
			m_CharacterImage.sprite = characterData.defaultPose;
			if ( characterData.uid == m_GameManager.Player.UniqueID )
			{
				m_CharacterOpinionText.text = $"N/A";
			}
			else
			{
				int opinion = (int)m_SocialEngineController
					.State
					.GetRelationship( characterData.uid, m_GameManager.Player.UniqueID )
					.Stats.GetStat( "Opinion" ).Value;

				m_CharacterOpinionText.text = $"{opinion}/255";
			}

		}
	}
}
