using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;


namespace Academical
{
	public class RelationshipMeter : MonoBehaviour
	{
		[SerializeField]
		private Color m_BadColor = Color.red;

		[SerializeField]
		private Color m_NeutralColor = Color.yellow;

		[SerializeField]
		private Color m_GoodColor = Color.green;

		//NOTE: THESE DEFAULTS GET OVERRIDDEN BY EDITOR. LOOK THERE FOR TRUE VALUES.
		[SerializeField]
		private float m_NeutralThreshold = 0.4f;

		[SerializeField]
		private float m_GoodThreshold = 0.6f;

		[SerializeField]
		[Range(0.0f, 1.0f)]
		private float m_FillAmount = 1.0f;

		[SerializeField]
		private Image m_FillBar;

		[SerializeField]
		private TMP_Text m_ValueLabel;

		public float FillAmount
		{
			get => m_FillAmount;
			set {
				m_FillAmount = Mathf.Max( 0.0f, Mathf.Min( 1.0f, value ) );
				UpdateFillAndColor();
			}
		}

		public void SetValueLabel(int value)
		{
			m_ValueLabel.text = value.ToString();
		}

		private void UpdateFillAndColor()
		{
			Color fillColor;

			if ( m_FillAmount >= m_GoodThreshold )
			{
				fillColor = m_GoodColor;
			}
			else if ( m_FillAmount >= m_NeutralThreshold )
			{
				fillColor = m_NeutralColor;
			}
			else
			{
				fillColor = m_BadColor;
			}

			m_FillBar.color = fillColor;
			m_FillBar.fillAmount = m_FillAmount;
		}

#if UNITY_EDITOR

		private void OnValidate()
		{
			UpdateFillAndColor();
		}

#endif
	}
}

