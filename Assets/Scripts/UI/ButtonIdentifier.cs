using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonIdentifier : MonoBehaviour
{
    [SerializeField]
    private int m_Identifier;

    public int Identifier
    {
        get { return m_Identifier; }
        set { m_Identifier = value; }
    }
}
