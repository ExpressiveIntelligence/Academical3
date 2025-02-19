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
		private GameObject m_DilemmaNotePrefab;

		[SerializeField]
		private GameObject m_NoDilemmasText;

		private List<GameObject> m_DilemmaButtons = new List<GameObject>();
		private List<Dilemma> m_Dilemmas = new List<Dilemma>();
		private List<GameObject> m_DilemmaNotes = new List<GameObject>();

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
			UpdateActiveDilemmaList();
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

			m_TitleTextMesh.text = dilemma.Data.name;
			m_DescriptionTextMesh.text = dilemma.Data.description;

			ClearDilemmaNotes();
			InstantiateDilemmaNotes();
		}

		private void UpdateActiveDilemmaList()
		{
			m_DilemmaIndex = 0;

			m_Dilemmas = DilemmaManager.GetUnlockedDilemmas();
			Debug.Log( $"Found {m_Dilemmas.Count} dilemmas." );

			ClearDilemmaButtons();
			InstantiateDilemmaButtons();


			if ( m_Dilemmas.Count != 0 )
			{
				ShowDilemma( m_DilemmaIndex );
			}
			else
			{
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
				entryButton.SetText( dilemma.Data.name );
				entryButton.SetDilemmaIndex( i );

				m_DilemmaButtons.Add( obj );
			}
		}

		private void ClearDilemmaNotes()
		{
			foreach ( GameObject entry in m_DilemmaNotes )
			{
				Destroy( entry );
			}
			m_DilemmaNotes.Clear();
		}


		private void InstantiateDilemmaNotes()
		{

		}
	}
}
