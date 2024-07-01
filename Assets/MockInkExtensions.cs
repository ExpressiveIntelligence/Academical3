using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Anansi;

using Ink.Runtime;
using Academical;
using System.Linq;

public class MockInkExtensions : MonoBehaviour
{

	[SerializeField]
	private StoryController m_storyController;

	[SerializeField]
	private MockBackgroundChanger m_backgroundChanger;

	[SerializeField]
	private DialogueBackgroundController m_dialogueBackgroundController;

	// Start is called before the first frame update
	void Start()
	{
		m_storyController.OnRegisterExternalFunctions += (Story story) =>
		{
			story.BindExternalFunction( "SetBackground", (string parameters) =>
			{
				string[] args = parameters.Split( " " ).Select( s => s.Trim() ).ToArray();

				if ( args.Length == 1 )
				{
					m_backgroundChanger.SetBackground( args[0] );
				}
				else if ( args.Length == 2 )
				{
					m_backgroundChanger.SetBackground( args[0], float.Parse( args[1] ) );
				}
				else if ( args.Length >= 3 )
				{
					m_backgroundChanger.SetBackground(
						args[0], float.Parse( args[1] ), float.Parse( args[2] )
					);
				}
			} );

			story.BindExternalFunction( "HideBackground", () =>
			{
				m_dialogueBackgroundController.Hide();
			} );
		};



	}
}
