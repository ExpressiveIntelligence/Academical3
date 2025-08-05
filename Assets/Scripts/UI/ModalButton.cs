using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class ModalButtonManager : MonoBehaviour
{
    [Header("Buttons in the modal")]
    public List<Button> buttons;

    [Header("Styling")]
    public Color selectedColor = Color.green;
    public Color defaultColor = Color.white;

    private Button currentSelected;

    public void OnButtonClicked(Button clickedButton)
    {
        foreach (Button btn in buttons)
        {
            var colors = btn.colors;
            colors.normalColor = defaultColor;
            btn.colors = colors;
        }

        if (clickedButton != null)
        {
            var colors = clickedButton.colors;
            colors.normalColor = selectedColor;
            clickedButton.colors = colors;

            currentSelected = clickedButton;
        }
    }
}
