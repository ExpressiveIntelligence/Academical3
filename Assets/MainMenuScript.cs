using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class MainMenuScript : MonoBehaviour
{
    public UIDocument _document;
    public GameObject MainMenuCanvas;
    public GameObject SettingsCanvas;
    private Button NewGameButton;
    private Button LoadGameButton;
    private Button SettingsButton;
    private Button CreditsButton;
    private Button QuitButton;

    // Start is called before the first frame update
    private void Awake(){
        _document = GetComponent<UIDocument>();

        NewGameButton = _document.rootVisualElement.Q("NewGameBtn") as Button;
        LoadGameButton = _document.rootVisualElement.Q("LoadGameBtn") as Button;
        SettingsButton = _document.rootVisualElement.Q("SettingsBtn") as Button;
        CreditsButton = _document.rootVisualElement.Q("CreditsBtn") as Button;
        QuitButton = _document.rootVisualElement.Q("QuitBtn") as Button;

        NewGameButton.RegisterCallback<ClickEvent>(NewGameClick);
        LoadGameButton.RegisterCallback<ClickEvent>(LoadGameClick);
        SettingsButton.RegisterCallback<ClickEvent>(SettingsClick);
        CreditsButton.RegisterCallback<ClickEvent>(CreditsClick);
        QuitButton.RegisterCallback<ClickEvent>(QuitClick);
    }

    private void OnDisable(){
        NewGameButton.UnregisterCallback<ClickEvent>(NewGameClick);
        LoadGameButton.UnregisterCallback<ClickEvent>(LoadGameClick);
        SettingsButton.UnregisterCallback<ClickEvent>(SettingsClick);
        CreditsButton.UnregisterCallback<ClickEvent>(CreditsClick);
        QuitButton.UnregisterCallback<ClickEvent>(QuitClick);
    }

    private void OnEnable(){
        NewGameButton.RegisterCallback<ClickEvent>(NewGameClick);
        LoadGameButton.RegisterCallback<ClickEvent>(LoadGameClick);
        SettingsButton.RegisterCallback<ClickEvent>(SettingsClick);
        CreditsButton.RegisterCallback<ClickEvent>(CreditsClick);
        QuitButton.RegisterCallback<ClickEvent>(QuitClick);
    }


    private void NewGameClick(ClickEvent evt){
        Debug.Log("New Game Clicked");
    }

    private void LoadGameClick(ClickEvent evt){
        Debug.Log("Load Game Clicked");
    }

    private void SettingsClick(ClickEvent evt){
        Debug.Log("Settings Clicked");
        MainMenuCanvas.SetActive(false);
        SettingsCanvas.SetActive(true);
    }

    private void CreditsClick(ClickEvent evt){
        Debug.Log("Credits Clicked");
    }

    private void QuitClick(ClickEvent evt){
        Debug.Log("Quit Clicked");
        Application.Quit();
    }

}
