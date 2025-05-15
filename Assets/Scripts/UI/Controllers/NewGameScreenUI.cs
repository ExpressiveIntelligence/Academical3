using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class NewGameScreenUI : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_BackButton;

		[SerializeField]
		private GameObject m_LevelCardContainer;

		[Header( "Element Prefabs" )]
		[SerializeField]
		private GameLevelCardUI m_LevelCardUIPrefab;

		private List<GameLevelCardUI> m_LevelCards = new List<GameLevelCardUI>();

		#endregion

		#region Public Methods

		public override void Show()
		{
			base.Show();
			UpdateLevelCards();
		}

		public void UpdateLevelCards()
		{
			ClearCards();
			GameLevelSO[] levels = GameLevelManager.Instance.GetAllLevels();
			foreach ( var entry in levels )
			{
				GameLevelCardUI card = Instantiate(
					m_LevelCardUIPrefab, m_LevelCardContainer.transform
				);

				card.Initialize( entry );

				m_LevelCards.Add( card );
			}
		}

		#endregion

		#region Protected Methods

		protected override void SubscribeToEvents()
		{
			m_BackButton.onClick.AddListener( OnBackButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_BackButton.onClick.RemoveListener( OnBackButtonClicked );
		}

		#endregion

		#region Private Methods

		private void OnBackButtonClicked()
		{
			Hide();
			AudioManager.PlayDefaultButtonSound();
		}

		private void ClearCards()
		{
			foreach ( var card in m_LevelCards )
			{
				Destroy( card.gameObject );
			}
			m_LevelCards.Clear();
		}

		#endregion
	}
}
