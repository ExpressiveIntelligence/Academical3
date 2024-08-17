using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class SettingsScript : MonoBehaviour
{
    public UIDocument _document;
    public GameObject MainMenuCanvas;
    public GameObject SettingsCanvas;

    private Button BackButton;
    // Start is called before the first frame update
    private void Awake(){
        _document = GetComponent<UIDocument>();

        BackButton = _document.rootVisualElement.Q("BackBtn") as Button;

        BackButton.RegisterCallback<ClickEvent>(BackButtonClick);
    }

    private void OnDisable(){
        BackButton.UnregisterCallback<ClickEvent>(BackButtonClick);
    }


    private void BackButtonClick(ClickEvent evt){
        Debug.Log("New Game Clicked");
        MainMenuCanvas.SetActive(true);
        SettingsCanvas.SetActive(false);
    }

}
