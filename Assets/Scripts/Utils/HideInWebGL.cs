using UnityEngine;

/// <summary>
/// This behavior deactivates its GameObject if the current platform in WebGL
/// </summary>
public class HideInWebGL : MonoBehaviour
{
	// Start is called once before the first execution of Update after the MonoBehaviour is created
	void Start()
	{
#if UNITY_WEBGL
		gameObject.SetActive( false );
#endif
	}
}
