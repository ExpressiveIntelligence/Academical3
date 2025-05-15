using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Forwards DilemmaSystemEvents as notifications to the NotificationManager.
	/// </summary>
	public class DilemmaNotificationSystem : MonoBehaviour
	{
		private void OnEnable()
		{
			DilemmaSystem.OnStartDilemma += OnDilemmaStarted;
			DilemmaSystem.OnAdvanceDilemma += OnDilemmaAdvanced;
			DilemmaSystem.OnFinishDilemma += OnDilemmaFinished;
		}

		private void OnDisable()
		{
			DilemmaSystem.OnStartDilemma -= OnDilemmaStarted;
			DilemmaSystem.OnAdvanceDilemma -= OnDilemmaAdvanced;
			DilemmaSystem.OnFinishDilemma -= OnDilemmaFinished;
		}

		private void OnDilemmaStarted(Dilemma dilemma)
		{
			NotificationManager.Instance.QueueNotification( "New Dilemma Unlocked!" );
		}

		private void OnDilemmaAdvanced(Dilemma dilemma, DilemmaStep dilemmaStep)
		{
			NotificationManager.Instance.QueueNotification( "Dilemma Step Unlocked!" );
		}

		private void OnDilemmaFinished(Dilemma dilemma)
		{
			NotificationManager.Instance.QueueNotification( "Finished Dilemma!" );
		}
	}
}
