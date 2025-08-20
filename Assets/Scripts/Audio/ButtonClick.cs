using System.Collections;
using System.Collections.Generic;
using Academical;
using UnityEngine;
using UnityEngine.UI;

public class ButtonClick : MonoBehaviour
{
    public Button button;

    void Start()
    {
        button.onClick.AddListener( PlaySoundOnClick );
    }

    public void PlaySoundOnClick()
    {
        AudioManager.PlayDefaultButtonSound();
    }

	void OnDestroy()
	{
        button.onClick.RemoveListener( PlaySoundOnClick );
	}
}
