using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	/// <summary>
	/// Displays information about the currently active dilemmas.
	/// </summary>
	public class DilemmaInfoPanel : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_CloseButton;

		[SerializeField]
		private TMP_Text m_TitleTextMesh;

		[SerializeField]
		private TMP_Text m_DescriptionTextMesh;

		[SerializeField]
		private Transform m_ContentContainer;

		[SerializeField]
		private Transform m_DilemmaListContainer;

		[SerializeField]
		private GameObject m_DilemmaEntryButtonPrefab;

		[SerializeField]
		private Transform m_DilemmaStepContainer;

		[SerializeField]
		private DilemmaStepUI m_DilemmaStepUIPrefab;

		[SerializeField]
		private GameObject m_NoDilemmasText;

		[SerializeField]
		private GameObject m_NoDilemmaStepsText;

		private List<GameObject> m_DilemmaButtons = new List<GameObject>();
		private List<Dilemma> m_Dilemmas = new List<Dilemma>();
		private List<DilemmaStepUI> m_DilemmaSteps = new List<DilemmaStepUI>();

		private int m_DilemmaIndex = 0;

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
			m_DilemmaIndex = 0;
			UpdateDilemmaList();
		}

		private void HideDilemmaView()
		{
			m_NoDilemmasText.SetActive( true );
			m_ContentContainer.gameObject.SetActive( false );
		}

		private void ShowDilemma(int index)
		{
			m_NoDilemmasText.SetActive( false );
			m_ContentContainer.gameObject.SetActive( true );

			m_DilemmaIndex = index;
			Dilemma dilemma = m_Dilemmas[m_DilemmaIndex];

			if ( dilemma.Status == DilemmaStatus.LOCKED )
			{
				m_TitleTextMesh.text = "???";
				m_DescriptionTextMesh.text = "Unlock this dilemma to see the description.";
				ClearDilemmaSteps();
			}
			else
			{
				m_TitleTextMesh.text = dilemma.Name;
				m_DescriptionTextMesh.text = dilemma.Description;
				ClearDilemmaSteps();
				InstantiateDilemmaSteps( dilemma );
			}
		}

		private void UpdateDilemmaList()
		{
			m_Dilemmas = DilemmaSystem.Instance.GetDilemmas();

			ClearDilemmaButtons();
			InstantiateDilemmaButtons();

			if ( m_Dilemmas.Count != 0 )
			{
				m_NoDilemmasText.SetActive( false );
				ShowDilemma( 0 );
			}
			else
			{
				m_NoDilemmasText.SetActive( true );
				HideDilemmaView();
			}
		}

		private void ClearDilemmaButtons()
		{
			foreach ( GameObject button in m_DilemmaButtons )
			{
				Destroy( button );
			}
			m_DilemmaButtons.Clear();
		}

		private void InstantiateDilemmaButtons()
		{
			for ( int i = 0; i < m_Dilemmas.Count; i++ )
			{
				Dilemma dilemma = m_Dilemmas[i];
				GameObject obj = Instantiate(
					m_DilemmaEntryButtonPrefab, m_DilemmaListContainer );

				DilemmaEntryButton entryButton = obj.GetComponent<DilemmaEntryButton>();

				if ( dilemma.Status == DilemmaStatus.LOCKED )
				{
					entryButton.SetText( "???" );
				}
				else
				{
					entryButton.SetText( dilemma.Name );
				}

				entryButton.SetDilemmaIndex( i );

				entryButton.OnClick += ShowDilemma;

				m_DilemmaButtons.Add( obj );
			}
		}

		private void ClearDilemmaSteps()
		{
			foreach ( DilemmaStepUI entry in m_DilemmaSteps )
			{
				Destroy( entry.gameObject );
			}
			m_DilemmaSteps.Clear();
			m_NoDilemmaStepsText.SetActive( true );
		}


		private void InstantiateDilemmaSteps(Dilemma dilemma)
		{
			if ( dilemma.CompletedSteps.Count == 0 )
			{
				m_NoDilemmaStepsText.SetActive( true );
				return;
			}
			else
			{
				m_NoDilemmaStepsText.SetActive( false );
			}

			foreach ( DilemmaStep step in dilemma.CompletedSteps )
			{
				DilemmaStepUI stepUI = Instantiate( m_DilemmaStepUIPrefab, m_DilemmaStepContainer );
				stepUI.SetText( step.text );
				m_DilemmaSteps.Add( stepUI );
			}
		}
	}
}
