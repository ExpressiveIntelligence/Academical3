using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MockNotificationEmitter : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyUp(KeyCode.Space))
		{
			Academical.NotificationManager.Instance.QueueNotification( "Is this the Krusty Krab?", () => {
				Debug.Log( "No. This is Patrick!" );
			} );
		}
    }
}
