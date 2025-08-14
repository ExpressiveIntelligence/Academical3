using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Academical
{
    public class AgendaInfoPanel : UIComponent
    {
        [Header( "UI Elements" )]
        [SerializeField]
        private Button m_CloseButton;

        [SerializeField]
        private TMP_Text m_AgendaDetailText;

        [SerializeField]
        private GameManager m_GameManager;

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
		}

    }
}
