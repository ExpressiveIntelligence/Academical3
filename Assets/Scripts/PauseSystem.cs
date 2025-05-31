using System.Collections;
using System.Collections.Generic;
using Academical;
using UnityEngine;

public class PauseSystem : MonoBehaviour
{
	[SerializeField]
	private Canvas m_PauseMenuCanvas;


	void OnEnable()
	{
		InputManager.OnEscapeKeyUp += TogglePauseMenu;
	}

	void OnDisable()
	{
		InputManager.OnEscapeKeyUp -= TogglePauseMenu;
	}

	public void TogglePauseMenu()
	{
		m_PauseMenuCanvas.gameObject.SetActive( !m_PauseMenuCanvas.gameObject.activeInHierarchy );
	}
}
