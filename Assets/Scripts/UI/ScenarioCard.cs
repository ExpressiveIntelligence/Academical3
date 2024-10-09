using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class ScenarioCard : UIComponent
	{
		#region Fields

		[Header( "UI Elements" )]
		[SerializeField] private Button m_PlayButton;
		[SerializeField] private TMP_Text m_ScenarioTitle;
		[SerializeField] private TMP_Text m_ScenarioDescription;
		[SerializeField] private GameLevelSO m_ScenarioData;
		[SerializeField] private Image m_Thumbnail;

		#endregion

		#region Unity Messages

		protected override void OnEnable()
		{
			base.OnEnable();

			if ( m_ScenarioData != null )
			{
				SetScenario( m_ScenarioData );
			}
		}

		#endregion

		#region Public Methods

		public void SetScenario(GameLevelSO scenarioData)
		{
			m_ScenarioData = scenarioData;
			m_ScenarioTitle.text = scenarioData.Title;
			m_ScenarioDescription.text = scenarioData.Description;
			m_Thumbnail.sprite = scenarioData.Thumbnail;
		}

		#endregion

		#region ProtectedMethods

		protected override void SubscribeToEvents()
		{
			m_PlayButton.onClick.AddListener( OnPlayButtonClicked );
		}

		protected override void UnsubscribeFromEvents()
		{
			m_PlayButton.onClick.RemoveListener( OnPlayButtonClicked );
		}

		#endregion

		#region Private Methods

		private void OnPlayButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			GameEvents.LevelSelected?.Invoke( m_ScenarioData );
		}

		#endregion
	}
}
