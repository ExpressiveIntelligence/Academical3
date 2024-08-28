using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class GameData
{
	public string playerID;
	public int musicVolume;

	public int sfxVolume;

	public GameData()
	{
		this.playerID = "tester";
	}
}
