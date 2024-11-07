using UnityEngine;
using Anansi;

namespace Academical
{
	public class CharacterSprite : MonoBehaviour
	{
		#region Fields

		/// <summary>
		/// The name of this character for display in the UI when speaking
		/// </summary>
		[SerializeField]
		protected string m_DisplayName;

		/// <summary>
		/// A unique ID for this character to be identified as within the StoryDatabase
		/// </summary>
		[SerializeField]
		protected string m_UniqueID;

		/// <summary>
		/// A reference to the sprite controller attached to this GameObject
		/// </summary>
		protected SpriteController m_SpriteController;

		protected CharacterSpritePosition m_Position;

		// private CharacterMoods _moods;

		private float _offScreenX;

		private float _onScreenX;

		private readonly float _animationSpeed = 0.2f;


		#endregion

		#region Properties

		/// <summary>
		/// The characters name displayed in the UI
		/// </summary>
		public string DisplayName => m_DisplayName;

		/// <summary>
		/// The character's unique ID
		/// </summary>
		public string UniqueID => m_UniqueID;

		/// <summary>
		/// The categorical (left, right, center) position of the character on the screen.
		/// </summary>
		public CharacterSpritePosition Position
		{
			get => m_Position; private set
			{
				m_Position = value;
				SetAnimationValues();
			}
		}

		/// <summary>
		/// Is the character currently displayed on the screen.
		/// </summary>
		public bool IsShowing { get; private set; }

		#endregion

		#region Properties


		#endregion

		#region Unity Messages

		private void Awake()
		{
			Position = CharacterSpritePosition.LEFT;
			IsShowing = false;
			m_SpriteController = GetComponent<SpriteController>();
		}

		#endregion

		#region Public Methods

		/// <summary>
		/// Set the currently displayed sprite using the given tags
		/// </summary>
		/// <param name="tags"></param>
		public void SetSprite(params string[] tags)
		{
			if ( m_SpriteController == null ) return;

			m_SpriteController.SetSpriteFromTags( tags );
		}

		public void Show(CharacterSpritePosition position)
		{
			Position = position;

			// Position outside of the screen
			transform.position = new Vector3( _offScreenX, transform.position.y, transform.localPosition.z );

			LeanTween.moveX( gameObject, _onScreenX, _animationSpeed ).setEase( LeanTweenType.linear ).setOnComplete( () =>
			{
				IsShowing = true;
			} );
		}

		public void Reset()
		{
			Position = CharacterSpritePosition.LEFT;

			transform.position = new Vector3( _offScreenX, transform.position.y, transform.localPosition.z );
		}

		public void Hide()
		{
			LeanTween.moveX( gameObject, _offScreenX, _animationSpeed ).setEase( LeanTweenType.linear ).setOnComplete( () =>
			{
				IsShowing = false;
			} );
		}


		#endregion

		#region Private Methods

		private void SetAnimationValues()
		{
			switch ( Position )
			{
				case CharacterSpritePosition.LEFT:
					_onScreenX = Screen.width * 0.25f;
					_offScreenX = -Screen.width * 1.25f;
					break;
				case CharacterSpritePosition.CENTER:
					_onScreenX = Screen.width * 0.5f;
					_offScreenX = -Screen.width * 1.25f;
					break;
				case CharacterSpritePosition.RIGHT:
					_onScreenX = Screen.width * 0.75f;
					_offScreenX = Screen.width * 1.25f;
					break;
			}
		}

		#endregion
	}
}
