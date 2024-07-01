using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IsoCameraController : MonoBehaviour
{
    [SerializeField]
    private float movementSpeed = 10f;


    // Update is called once per frame
    void Update()
    {
        Vector3 cameraDisplacement = new Vector3();

        if (Input.GetKey(KeyCode.W))
        {
            cameraDisplacement += new Vector3(1, 0, 1);
        }
        if (Input.GetKey(KeyCode.S))
        {
            cameraDisplacement += new Vector3(-1, 0, -1);
        }
        if (Input.GetKey(KeyCode.A))
        {
            cameraDisplacement += new Vector3(-1, 0, 1);
        }
        if (Input.GetKey(KeyCode.D))
        {
            cameraDisplacement += new Vector3(1, 0, -1);
        }

        this.transform.position += (Vector3.Normalize(cameraDisplacement) * Time.deltaTime * movementSpeed);
    }
}
