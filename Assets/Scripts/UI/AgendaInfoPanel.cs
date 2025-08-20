using System.Collections;
using System.Collections.Generic;
using Anansi;
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
        private Image m_OpenButtonImage;

        [SerializeField]
        private TMP_Text m_AgendaDetailText;

        [SerializeField]
        private GameManager m_GameManager;

        [SerializeField]
        private Color m_ActiveColor;

        [SerializeField]
        private Color m_NormalColor;

        [SerializeField]
        private Button m_DefaultDayShownButton;

        [SerializeField]
        private List<Button> m_DayButtons;

        [SerializeField]
        private SimulationController m_SimulationController;

        [SerializeField]
        private TMP_Text m_DayContentText;



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
            m_OpenButtonImage.color = m_ActiveColor;
            base.Show();
            bool defaultSelected = false;
            foreach ( Button button in m_DayButtons )
            {
                int buttonDayIdentifier = button.GetComponent<ButtonIdentifier>().Identifier;
                if ( buttonDayIdentifier == m_SimulationController.DateTime.Day )
                {
                    EventSystem.current.SetSelectedGameObject( button.gameObject );
                    defaultSelected = true;
                    ShowDayContent( button.GetComponent<PanelTextContent>() );
                }

                //Strikethrough text if we are after the day
                if ( buttonDayIdentifier < m_SimulationController.DateTime.Day )
                {
                    TMP_Text buttonTMPText = button.GetComponentInChildren<TMP_Text>(); 
                    string buttonText = buttonTMPText.text;
                    buttonTMPText.text = "<s>" + buttonText + "</s>";
                }
            }
            if ( !defaultSelected )
            {
                EventSystem.current.SetSelectedGameObject( m_DefaultDayShownButton.gameObject );
                ShowDayContent( m_DefaultDayShownButton.GetComponent<PanelTextContent>() );
            }
        }

        public override void Hide()
        {

            m_OpenButtonImage.color = m_NormalColor;
            base.Hide();
        }

        public void ShowDayContent(PanelTextContent content)
        {
            m_DayContentText.text = content.content;
        }

    }
}
