using UnityEngine;

namespace Academical
{
	public class PlayTimeTracker : MonoBehaviour
	{
		private float m_TotalPlayTime;

		public static PlayTimeTracker Instance { get; private set; }

		void Awake()
		{
			if ( Instance != null )
			{
				Destroy( gameObject );
				return;
			}

			Instance = this;
			m_TotalPlayTime = 0;
		}

		void Update()
		{
			m_TotalPlayTime += Time.deltaTime;
		}

		public void SetTotalPlayTime(float seconds)
		{
			m_TotalPlayTime = seconds;
		}

		public float GetTotalPlayTime()
		{
			return m_TotalPlayTime;
		}
	}
}
