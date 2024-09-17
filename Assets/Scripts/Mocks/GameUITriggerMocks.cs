using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
	public class GameUITriggerMocks : MonoBehaviour
	{
		[Header( "Button Maps" )]
		[SerializeField] private KeyCode m_ShowDialoguePanelKey;
		[SerializeField] private KeyCode m_ShowChoicesPanelKey;
		[SerializeField] private KeyCode m_HideAllDialogueUIKey;
		[Header( "Changing the Background" )]
		[SerializeField] private KeyCode m_ChangeBackgroundButton;
		[SerializeField] private KeyCode m_HideBackgroundButton;
		[SerializeField] private string m_BackgroundLocationId;
		[Header( "Changing the speaker" )]
		[SerializeField] private KeyCode m_ChangeSpeakerButton;
		[SerializeField] private KeyCode m_HideSpeakerButton;
		[SerializeField] private string m_SpeakerId;

		private void OnEnable()
		{
			SubscribeToEvents();
		}

		private void OnDisable()
		{
			UnSubscribeFromEvents();
		}


		private void Update()
		{
			if ( Input.GetKeyUp( m_ShowDialoguePanelKey ) )
			{
				DialogueEvents.DialogueStarted?.Invoke();
			}

			if ( Input.GetKeyUp( m_ShowChoicesPanelKey ) )
			{
				DialogueEvents.ChoicesShown?.Invoke( new List<Anansi.Choice>() );
			}

			if ( Input.GetKeyUp( m_HideAllDialogueUIKey ) )
			{
				DialogueEvents.DialogueEnded?.Invoke();
			}

			if ( Input.GetKeyUp( m_HideBackgroundButton ) )
			{
				DialogueEvents.BackgroundChanged?.Invoke( null );
			}

			if ( Input.GetKeyUp( m_ChangeBackgroundButton ) )
			{
				DialogueEvents.BackgroundChanged?.Invoke(
					new Anansi.BackgroundInfo( m_BackgroundLocationId, new string[0] ) );
			}

			if ( Input.GetKeyUp( m_HideSpeakerButton ) )
			{
				DialogueEvents.SpeakerChanged?.Invoke( null );
			}

			if ( Input.GetKeyUp( m_ChangeSpeakerButton ) )
			{
				DialogueEvents.SpeakerChanged?.Invoke(
					new Anansi.SpeakerInfo( m_SpeakerId, "", new string[0] ) );
			}
		}

		private void SubscribeToEvents()
		{
			DialogueEvents.DialogueStarted += () =>
			{
				Debug.Log( "Dialogue Started." );
			};

			DialogueEvents.DialogueAdvanced += () =>
			{
				Debug.Log( "Dialogue Advanced." );
			};

			DialogueEvents.OnNextDialogueLine += (string text) =>
			{
				Debug.Log( $"Dialogue Line >> {text}" );
			};

			DialogueEvents.DialogueUIShown += () =>
			{
				Debug.Log( "Displaying Text Box" );
			};

			DialogueEvents.AdvanceDialogueButtonEnabled += () =>
			{
				Debug.Log( "Continue button enabled." );
			};

			DialogueEvents.AdvanceDialogueButtonClicked += () =>
			{
				Debug.Log( "Continue button clicked." );
			};
		}

		private void UnSubscribeFromEvents()
		{

		}
	}
}
