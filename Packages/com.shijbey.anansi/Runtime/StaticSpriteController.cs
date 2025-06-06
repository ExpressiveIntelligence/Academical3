using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

namespace Anansi
{
	/// <summary>
	/// Manages static sprite images for a character or location.
	/// </summary>
	public class StaticSpriteController : SpriteController
	{
		#region Fields

		/// <summary>
		/// Sprites used to display the character
		/// </summary>
		[SerializeField]
		private SpriteEntry[] m_sprites;

		/// <summary>
		/// Internal look-up table for sprite instances
		/// </summary>
		private Dictionary<string, SpriteEntry> m_spriteLookupTable;

		/// <summary>
		/// A reference to the GameObjects's animator component
		/// </summary>
		private Image m_image;

		/// <summary>
		/// The name of the animation to fallback to if none is found
		/// </summary>
		private string m_fallbackSpriteName;

		#endregion

		#region Unity Messages

		public void Awake()
		{
			m_image = GetComponent<Image>();
			m_spriteLookupTable = new Dictionary<string, SpriteEntry>();

			if ( m_image == null )
			{
				throw new System.Exception(
					$"SpriteRenderer missing for {gameObject.name}" );
			}

			foreach ( var entry in m_sprites )
			{
				m_spriteLookupTable[entry.spriteName] = entry;

				if ( entry.isFallback )
				{
					m_fallbackSpriteName = entry.spriteName;
				}
			}

			if ( m_fallbackSpriteName == null )
			{
				throw new System.Exception(
					$"No fallback sprite given for {gameObject.name}" );
			}
		}

		#endregion

		#region Public Methods

		public override void SetSpriteFromTags(params string[] tags)
		{
			SpriteEntry chosenSprite = m_spriteLookupTable[m_fallbackSpriteName];

			List<string> nonEmptyTags = tags.Where( t => t != "" ).ToList();

			if ( nonEmptyTags.Count > 0 )
			{
				List<SpriteEntry> bestMatches = ContentSelection.GetWithTags(
					m_sprites.Select( a => (a, new HashSet<string>( a.tags )) ),
					nonEmptyTags
				);

				if ( bestMatches.Count > 0 )
				{
					chosenSprite = bestMatches[
						UnityEngine.Random.Range( 0, bestMatches.Count )
					];
				}
			}

			m_image.sprite = chosenSprite.sprite;
		}

		#endregion

		#region Helper Classes

		/// <summary>
		/// Associates a sprite image with a set of descriptive tags.
		/// </summary>
		[System.Serializable]
		public class SpriteEntry
		{
			/// <summary>
			/// The name of the sprite.
			/// </summary>
			public string spriteName;

			/// <summary>
			/// The sprite to use.
			/// </summary>
			public Sprite sprite;

			/// <summary>
			/// Tags used to retrieve the image.
			/// Examples: neutral, smiling, scowling, sad, blushing, laughing
			/// </summary>
			public string[] tags;

			/// <summary>
			/// Fallback to this animation if none is found
			/// </summary>
			public bool isFallback;
		}

		#endregion
	}
}
