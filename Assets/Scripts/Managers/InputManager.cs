using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Academical
{
	public class InputManager : MonoBehaviour
	{

		public static Action OnUserClick;
		public static Action OnSpaceBarUp;

		// Start is called before the first frame update
		void Start()
		{

		}

		// Update is called once per frame
		void Update()
		{
			CheckUserClick();
			CheckSpaceBarUp();
		}

		private void CheckUserClick()
		{
			if ( Input.GetMouseButtonUp( 0 ) )
			{
				if ( !EventSystem.current.IsPointerOverGameObject() )
				{
					Debug.Log( "User click" );
					OnUserClick?.Invoke();
				}
			}
		}

		private void CheckSpaceBarUp()
		{
			if ( Input.GetKeyUp( KeyCode.Space ) && !EventSystem.current.IsPointerOverGameObject() )
			{
				OnSpaceBarUp?.Invoke();
			}
		}
	}
}

