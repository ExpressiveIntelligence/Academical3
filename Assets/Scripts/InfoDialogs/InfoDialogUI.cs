using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class InfoDialogUI : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_CloseButton;

		[SerializeField]
		private TMP_Text m_SlideTextMesh;

		[SerializeField]
		private TMP_Text m_WindowTitleTextMesh;

		[SerializeField]
		private TMP_Text m_SlideCountTextMesh;

		[SerializeField]
		private Button m_PreviousSlideButton;

		[SerializeField]
		private Button m_NextSlideButton;

		private InfoDialogData m_CurrentInfoData;
		private int m_CurrentSlideIndex;

		protected override void SubscribeToEvents()
		{
			GameEvents.InfoDialogShown += DisplayInfo;
			m_CloseButton.onClick.AddListener( Hide );
			m_PreviousSlideButton.onClick.AddListener( GoToPrevSlide );
			m_NextSlideButton.onClick.AddListener( GoToNextSlide );
		}

		protected override void UnsubscribeFromEvents()
		{
			GameEvents.InfoDialogShown -= DisplayInfo;
			m_CloseButton.onClick.RemoveListener( Hide );
			m_PreviousSlideButton.onClick.RemoveListener( GoToPrevSlide );
			m_NextSlideButton.onClick.RemoveListener( GoToNextSlide );
		}

		/// <summary>
		/// Display info dialog data with the given id.
		/// </summary>
		/// <param name="id"></param>
		public void DisplayInfo(string id)
		{
			m_CurrentSlideIndex = 0;
			m_CurrentInfoData = InfoDialogManager.GetInfo( id );

			if ( m_CurrentInfoData == null )
			{
				Debug.LogError( "Could not find info dialog with id: " + id );
			}
			else
			{
				UpdateSlide();
				Show();
				Debug.Log( "Displaying Info Dialog: " + id );
			}
		}

		/// <summary>
		/// Go to the next info slide.
		/// </summary>
		public void GoToNextSlide()
		{
			if ( CanAdvanceSlide() )
			{
				m_CurrentSlideIndex++;
				UpdateSlide();
			}
		}

		/// <summary>
		/// Go to the previous info slide.
		/// </summary>
		public void GoToPrevSlide()
		{
			if ( CanRegressSlide() )
			{
				m_CurrentSlideIndex--;
				UpdateSlide();
			}
		}

		private bool CanAdvanceSlide()
		{
			if ( m_CurrentInfoData == null ) return false;

			return m_CurrentSlideIndex < m_CurrentInfoData.slides.Length - 1;
		}

		private bool CanRegressSlide()
		{
			if ( m_CurrentInfoData == null ) return false;

			return m_CurrentSlideIndex > 0;
		}

		private void UpdateSlide()
		{
			InfoDialogSlide currentSlide = m_CurrentInfoData.slides[m_CurrentSlideIndex];
			m_SlideTextMesh.text = currentSlide.text;

			m_SlideCountTextMesh.text =
				$"{m_CurrentSlideIndex + 1} of {m_CurrentInfoData.slides.Length}";

			m_WindowTitleTextMesh.text = m_CurrentInfoData.title;

			m_NextSlideButton.interactable = CanAdvanceSlide();
			m_PreviousSlideButton.interactable = CanRegressSlide();
		}
	}
}
