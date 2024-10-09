using UnityEngine;

namespace Academical
{
	/// <summary>
	/// This is a simple component for holding notes or explanation.
	/// </summary>
	public class Description : MonoBehaviour
	{
		[TextArea( 5, 25 )]
		public string note;
	}
}
