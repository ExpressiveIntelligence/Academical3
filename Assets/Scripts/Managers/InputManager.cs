using System;
using UnityEngine;
using UnityEngine.EventSystems;

namespace Academical
{
	public class InputManager : MonoBehaviour
	{

		public static Action OnUserClick;
		public static Action OnSpaceBarUp;
		public static Action OnEscapeKeyUp;
		public static InputManager Instance { get; private set; }

		void Awake()
		{
			if ( Instance != null )
			{
				Destroy( gameObject );
				return;
			}

			Instance = this;
		}

		// Update is called once per frame
		void Update()
		{
			CheckUserClick();
			CheckSpaceBarUp();
			CheckEscapeKeyUp();
		}

		private void CheckUserClick()
		{
			if ( Input.GetMouseButtonUp( 0 ) )
			{
				if ( !EventSystem.current.IsPointerOverGameObject() )
				{
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

		private void CheckEscapeKeyUp()
		{
			if ( Input.GetKeyUp( KeyCode.Escape ) )
			{
				OnEscapeKeyUp?.Invoke();
			}
		}
	}
}
