using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Anansi;

public class MockCharacterController : MonoBehaviour
{
	// Start is called before the first frame update
	void Start()
	{

	}

	// Update is called once per frame
	void Update()
	{

	}

	void OnMouseDown()
	{
		Debug.Log("Clicked: " + this.gameObject.name);
		FindObjectOfType<StoryController>().StartStory();
	}
}
