using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Anansi;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Maintains a look-up table of characters that exist in the game and manages what character
	/// is currently shown on screen.
	/// </summary>
	public class SpeakerSpriteManager : MonoBehaviour
	{
		#region Fields

		/// <summary>
		/// The amount of time for characters to slide on and off the screen.
		/// </summary>
		[SerializeField]
		protected float m_AnimationSpeed = 0.2f;

		/// <summary>
		/// All the characters in the game.
		/// </summary>
		private Dictionary<string, CharacterSprite> m_Characters =
			new Dictionary<string, CharacterSprite>();

		#endregion

		#region Unity Messages

		private void Start()
		{
			foreach ( var character in GetComponentsInChildren<CharacterSprite>() )
			{
				m_Characters[character.UniqueID] = character;
			}
			ResetSprites();
		}

		private void OnEnable()
		{
			DialogueEvents.CharacterShown += ShowCharacter;
			DialogueEvents.CharacterHidden += HideCharacter;
		}

		private void OnDisable()
		{
			DialogueEvents.CharacterShown -= ShowCharacter;
			DialogueEvents.CharacterHidden -= HideCharacter;
		}

		#endregion

		#region Public Methods

		public void ShowCharacter(string characterName, string position, string spriteTags)
		{

			if ( !Enum.TryParse( position.ToUpper(), out CharacterSpritePosition positionEnum ) )
			{
				Debug.LogWarning( $"Failed to parse character position to enum: {position}" );
				return;
			}

			string[] spriteTagArray = spriteTags.Split( "," ).Select( t => t.Trim() ).ToArray();

			ShowCharacter( characterName, positionEnum, spriteTagArray );
		}

		public void ShowCharacter(string characterName, CharacterSpritePosition position, string[] spriteTags)
		{
			var character = m_Characters[characterName];

			if ( character.IsShowing )
			{
				Debug.LogWarning( $"Failed to show character {name}. Character already showing" );
				return;
			}

			character.SetSprite( spriteTags );
			character.Show( position );
		}

		public void HideCharacter(string name)
		{
			var character = m_Characters[name];

			if ( character.IsShowing != true )
			{
				Debug.LogWarning( $"Character {name} is not currently shown. Can't hide it." );
				return;
			}
			else
			{
				character.Hide();
			}
		}

		public void SetCharacterSprite(string characterName, string spriteTags)
		{
			CharacterSprite character = m_Characters[characterName];

			if ( character.IsShowing != true )
			{
				Debug.LogWarning( $"Character {characterName} is not currently shown. Can't change the mood." );
				return;
			}
			else
			{
				string[] spriteTagArray = spriteTags.Split( "," ).Select( t => t.Trim() ).ToArray();
				character.SetSprite( spriteTagArray );
			}
		}

		/// <summary>
		/// Reset all character sprites to be out of view
		/// </summary>
		public void ResetSprites()
		{
			foreach ( var character in m_Characters.Values )
			{
				character.Hide();
			}
		}

		#endregion

		#region Private Methods


		#endregion
	}
}
