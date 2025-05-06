using System;
using System.Collections.Generic;
using System.Linq;
using Anansi;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages static data pertaining to characters in the game.
	/// </summary>
	public class CharacterManager : MonoBehaviour
	{
		[SerializeField]
		private CharacterDatabaseSO m_Characters;

		private Dictionary<string, CharacterData> m_CharacterMap =
			new Dictionary<string, CharacterData>();

		public static CharacterManager Instance { get; private set; }

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( this );
				return;
			}

			LoadCharactersFromInspector();
			DontDestroyOnLoad( this );
		}

		public CharacterData GetCharacter(string uid)
		{
			m_CharacterMap.TryGetValue( uid, out var characterData );
			return characterData;
		}

		public CharacterData[] GetAllCharacters()
		{
			return m_CharacterMap.Values.ToArray();
		}

		private void LoadCharactersFromInspector()
		{
			foreach ( CharacterData entry in m_Characters.characters )
			{
				m_CharacterMap[entry.uid] = entry;
			}
		}
	}
}
