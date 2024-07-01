using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// This class is testing <c>DialogueBackground</c> functionality.
	/// </summary>
	public class MockBackgroundChanger : MonoBehaviour
	{
		#region Fields

		[SerializeField]
		private DialogueBackgroundController m_dialogueBackground;

		[SerializeField]
		private KeyCode m_hideKey = KeyCode.H;

		[SerializeField]
		private KeyCode m_nextImageKey = KeyCode.N;

		[SerializeField]
		private DialogueBackgroundSprite[] m_backgroundSprites;

		private int m_nextImageIndex = 0;

		#endregion

		#region Unity Messages

		// Update is called once per frame
		void Update()
		{
			if ( Input.GetKeyUp( m_hideKey ) )
			{
				m_dialogueBackground.Hide();
			}

			else if ( Input.GetKeyUp( m_nextImageKey ) )
			{
				m_dialogueBackground.ShowBackgroundWithFade(
					m_backgroundSprites[m_nextImageIndex].sprite
				);

				m_nextImageIndex = (m_nextImageIndex + 1) % m_backgroundSprites.Length;
			}
		}

		#endregion

		#region Public Methods

		public void SetBackground(string backgroundId, float fadeOutTime = -1, float fadeInTime = -1)
		{
			foreach ( var entry in m_backgroundSprites )
			{
				if ( entry.entryId == backgroundId )
				{
					m_dialogueBackground.ShowBackgroundWithFade(
						entry.sprite, fadeOutTime, fadeInTime );
				}
			}
		}

		#endregion
	}
}
