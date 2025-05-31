using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
    public class GameLevelCardUI : UIComponent
    {
        #region Fields

        [Header( "UI Elements" )]
        [SerializeField] private Button m_PlayButton;
        [SerializeField] private TMP_Text m_Title;
        [SerializeField] private TMP_Text m_Description;
        [SerializeField] private GameLevelSO m_Data;
        [SerializeField] private Image m_Thumbnail;

        #endregion

        #region Unity Messages

        protected override void OnEnable()
        {
            base.OnEnable();

            if ( m_Data != null )
            {
                Initialize( m_Data );
            }
        }

        #endregion

        #region Public Methods

        public void Initialize(GameLevelSO data)
        {
            m_Data = data;
            m_Title.text = data.displayName;
            m_Description.text = data.description;
            m_Thumbnail.sprite = data.thumbnail;
        }

        #endregion

        #region ProtectedMethods

        protected override void SubscribeToEvents()
        {
            m_PlayButton.onClick.AddListener( OnPlayButtonClicked );
        }

        protected override void UnsubscribeFromEvents()
        {
            m_PlayButton.onClick.RemoveListener( OnPlayButtonClicked );
        }

        #endregion

        #region Private Methods

        private void OnPlayButtonClicked()
        {
            AudioManager.PlayDefaultButtonSound();
            GameStateManager.NewGame();
            GameStateManager.GetGameState().levelId = m_Data.id;
            MainMenuManager.Instance.StartGame();
        }

        #endregion
    }
}
