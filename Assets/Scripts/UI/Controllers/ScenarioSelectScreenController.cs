using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class ScenarioSelectScreenController : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_BackButton;

		[SerializeField]
		private GameObject m_ScenarioCardContainer;

		[Header( "Element Prefabs" )]
		[SerializeField]
		private GameObject m_ScenarioCardPrefab;

		private List<ScenarioCard> m_ScenarioCards = new List<ScenarioCard>();

		#endregion

		#region Public Methods

		public override void Show()
		{
			base.Show();
			UpdateScenarioList( MainMenuManager.Instance.ScenarioManager.Scenarios );
		}

		public void UpdateScenarioList(IEnumerable<GameLevelSO> scenarios)
		{
			ClearScenarioList();
			foreach ( var entry in scenarios )
			{
				GameObject scenarioCard = Instantiate(
					m_ScenarioCardPrefab, m_ScenarioCardContainer.transform
				);

				var scenarioCardComponent = scenarioCard.GetComponent<ScenarioCard>();

				scenarioCardComponent.SetScenario( entry );

				m_ScenarioCards.Add( scenarioCardComponent );
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
			AudioManager.PlayDefaultButtonSound();
			MainMenuManager.Instance.HideScenarioSelectionScreen();
		}

		private void ClearScenarioList()
		{
			foreach ( var card in m_ScenarioCards )
			{
				Destroy( card.gameObject );
			}
			m_ScenarioCards.Clear();
		}

		#endregion
	}
}
