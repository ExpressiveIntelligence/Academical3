using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PanelTextContent : MonoBehaviour
{
    [Tooltip( "Content of the text to display in the panel." )]
    [TextArea( 3, 10 )]
    public string content;
}
