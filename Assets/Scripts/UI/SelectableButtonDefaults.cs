using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SelectableButtonDefaults : MonoBehaviour
{
    [SerializeField]
    private Button button;
    
    // Start is called before the first frame update
    void Start()
    {
        if ( button != null )
        {
            EventSystem.current.SetSelectedGameObject( button.gameObject );
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
