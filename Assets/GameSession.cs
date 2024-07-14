using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSession : MonoBehaviour, IDataPersistence
{
    [SerializeField] private string playerID = "tester";
    //Scriptable Object for Class to Manage Across Scenes
    public GameSessionSO gameSessionSO;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void LoadData(GameData data)
    {
        this.playerID = data.playerID;
        this.gameSessionSO.playerID = data.playerID;
    }

    public void SaveData(ref GameData data)
    {
        data.playerID = this.playerID;
    }
}
