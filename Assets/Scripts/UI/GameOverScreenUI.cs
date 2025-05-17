using System.Collections;
using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;


namespace Academical
{
	public class GameOverScreenUI : MonoBehaviour
	{
		[Tooltip( "Should the screen be inactive when the game starts." )]
		[SerializeField]
		private bool m_HideOnAwake = true;

		[SerializeField]
		private TMP_Text m_TotalDilemmasFoundText;

		[SerializeField]
		private TMP_Text m_TotalDilemmasCompletedText;

		[SerializeField]
		private Button m_MainMenuButton;


		private void Awake()
		{
			if ( m_HideOnAwake )
			{
				Hide();
			}
		}

		private void Start()
		{
			UpdateValues();
		}

		private void OnEnable()
		{
			m_MainMenuButton.onClick.AddListener( HandleMainMenuButtonClicked );
		}

		private void OnDisable()
		{
			m_MainMenuButton.onClick.RemoveListener( HandleMainMenuButtonClicked );
		}

		public void Show()
		{
			UpdateValues();
			gameObject.SetActive( true );
		}

		public void Hide()
		{
			gameObject.SetActive( false );
		}

		private void UpdateValues()
		{
			List<Dilemma> dilemmas = DilemmaSystem.Instance.GetDilemmas();
			int totalDilemmas = dilemmas.Count;

			int totalCompletedDilemmas = dilemmas.Where( (d) => d.Status == DilemmaStatus.FINISHED ).Count();
			int totalFoundDilemmas = dilemmas.Where( (d) =>
			{
				return d.Status == DilemmaStatus.IN_PROGRESS || d.Status == DilemmaStatus.FINISHED;
			} ).Count();

			m_TotalDilemmasFoundText.text = $"Total Dilemmas Found: {totalFoundDilemmas} / {totalDilemmas}";
			m_TotalDilemmasCompletedText.text = $"Total Dilemmas Completed: {totalCompletedDilemmas} / {totalDilemmas}";
		}

		private void HandleMainMenuButtonClicked()
		{
			AudioManager.PlayDefaultButtonSound();
			SceneManager.LoadScene( "Scenes/MainMenu" );
		}
	}

}
