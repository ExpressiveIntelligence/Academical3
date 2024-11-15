using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using Anansi;
using TDRS;
using UnityEngine;

namespace Academical
{
	/// <summary>
	/// Manages dialogue and choices for an Academical story.
	/// </summary>
	public class DialogueManager : MonoBehaviour
	{
		#region Fields

		[SerializeField] TextAsset m_InkStoryJson;

		/// <summary>
		/// A reference to the simulation controller to get info on characters and locations.
		/// </summary>
		[SerializeField]
		private SimulationController m_simulationController;

		/// <summary>
		/// Filters choices when they are requested by the UI.
		/// </summary>
		[SerializeField]
		private ChoiceFilteringStrategyBase m_ChoiceFilteringStrategy;

		[SerializeField]
		private ChoiceEffectFactory[] m_ChoiceEffectFactories;

		private Dictionary<string, ChoiceEffectFactory> m_ChoiceEffectFactoryMap;

		/// <summary>
		/// Cache of choices filtered from the m_AllChoicesCache.
		/// </summary>
		private List<Choice> m_FilteredChoicesCache = new List<Choice>();

		/// <summary>
		/// Cache of all choices that have been post-processed from Ink.
		/// </summary>
		private List<Choice> m_AllChoicesCache = new List<Choice>();

		/// <summary>
		/// A reference to the story constructed from the JSON data.
		/// </summary>
		private Story m_story;

		/// <summary>
		/// All the characters parented under this object.
		/// </summary>
		private Dictionary<string, Character> m_Characters;

		/// <summary>
		/// Will the manager auto advance blank lines.
		/// </summary>
		private bool m_AutoAdvanceBlankLines = true;

		#endregion

		#region Properties

		/// <summary>
		/// The story presented by the manager.
		/// </summary>
		public Story Story => m_story;

		/// <summary>
		/// Is there currently dialogue being displayed on the screen.
		/// </summary>
		public bool IsDisplayingDialogue { get; private set; }

		/// <summary>
		/// What is the story controller currently doing.
		/// </summary>
		public bool IsWaitingForInput { get; private set; }

		/// <summary>
		///	The current input request the controller is waiting to complete.
		/// </summary>
		public InputRequest InputRequest { get; private set; }

		/// <summary>
		/// Information about the character currently speaking.
		/// </summary>
		/// <value></value>
		public SpeakerInfo CurrentSpeaker { get; private set; }

		/// <summary>
		/// Information about the background currently presented.
		/// </summary>
		/// <value></value>
		public BackgroundInfo CurrentBackground { get; private set; }


		/// <summary>
		/// Get the filtered list of choices.
		/// </summary>
		public List<Choice> FilteredChoices
		{
			get
			{
				if ( m_FilteredChoicesCache.Count == 0 )
				{
					List<Choice> choices = m_ChoiceFilteringStrategy.FilterChoices( AllChoices );
					m_FilteredChoicesCache = new List<Choice>( choices );
				}

				return m_FilteredChoicesCache;
			}
		}

		/// <summary>
		/// Get all available choices.
		/// </summary>
		public List<Choice> AllChoices
		{
			get
			{
				if ( m_AllChoicesCache.Count == 0 )
				{
					m_AllChoicesCache = new List<Choice>( m_story.CurrentChoices );
					Regex rg = new Regex( @"^>>\s*(\w+)([\s+-?\w+]*)$" );

					foreach ( var choice in m_AllChoicesCache )
					{
						foreach ( string tag in choice.Tags )
						{
							Match match = rg.Match( tag.Trim() );

							if ( !match.Success )
							{
								continue;
							}

							// If it is then break into args
							Group effectNameGroup = match.Groups[1];
							Group effectArgsGroup = match.Groups[2];

							string effectName = effectNameGroup.ToString().Trim();
							string[] args = effectArgsGroup.ToString().Trim().Split( " " );

							// Get the proper factory from the factory map
							var factory = m_ChoiceEffectFactoryMap[effectName];

							// Create a new effect instance and add it to the choice's effect list
							var effect = factory.CreateEffect(
								new ChoiceEffectContext(
									SocialEngineController.Instance,
									m_simulationController,
									m_story,
									args
								)
							);

							choice.Effects.Add( effect );
						}
					}
				}

				return m_AllChoicesCache;
			}
		}

		/// <summary>
		/// The current dialogue line.
		/// </summary>
		/// <value></value>
		public string CurrentLine { get; private set; }

		#endregion

		#region Unity Messages

		private void Awake()
		{
			IsDisplayingDialogue = false;
			IsWaitingForInput = false;
			CurrentSpeaker = null;
			CurrentBackground = null;
			m_story = new Story( m_InkStoryJson.text );

			m_Characters = new Dictionary<string, Character>();
			foreach ( var character in FindObjectsOfType<Character>() )
			{
				m_Characters[character.UniqueID] = character;
			}
		}

		private void OnEnable()
		{
			SubscribeToEvents();
		}

		private void OnDisable()
		{
			UnsubscribeFromEvents();
		}

		#endregion

		#region Public Methods

		public void Initialize()
		{
			RegisterExternalInkFunctions();
			m_ChoiceEffectFactoryMap = new Dictionary<string, ChoiceEffectFactory>();
			foreach ( var factory in m_ChoiceEffectFactories )
			{
				m_ChoiceEffectFactoryMap[factory.EffectName] = factory;
			}
		}

		/// <summary>
		/// Set the story that the manager uses.
		/// </summary>
		/// <param name="story"></param>
		public void SetStory(Anansi.Story story)
		{
			m_story = story;
		}

		/// <summary>
		/// Start the dialogue and signal to the UI to open the dialogue box.
		/// </summary>
		public void StartDialogue()
		{
			DialogueEvents.DialogueStarted?.Invoke();
			AdvanceDialogue();
		}

		/// <summary>
		/// End the current dialogue and let the player select another action or location.
		/// </summary>
		public void EndDialogue()
		{
			SetSpeaker( null );
			DialogueEvents.DialogueEnded?.Invoke();
			GameEvents.GameHUDShown?.Invoke();
		}

		/// <summary>
		/// Provide input if the system is waiting for input.
		/// </summary>
		public void SetInput(string variableName, object input)
		{
			IsWaitingForInput = false;
			InputRequest = null;
			Story.InkStory.state.variablesState[variableName] = input;
			AdvanceDialogue();
		}

		/// <summary>
		/// Check if the dialogue can continue further.
		/// </summary>
		/// <returns></returns>
		public bool CanContinue()
		{
			// Cannot continue if waiting for input
			if ( IsWaitingForInput ) return false;

			return Story.CanContinue();
		}

		/// <summary>
		/// Show the next line of dialogue or close if at the end
		/// </summary>
		public void AdvanceDialogue()
		{
			if ( CanContinue() )
			{
				string text = Story.Continue().Trim();
				text = PreProcessDialogueLine( text );
				CurrentLine = text;
				ProcessLineTags();
				DialogueEvents.OnNextDialogueLine( text );

				// Sometimes on navigation, we don't show any text. If this is the case,
				// do not even show the dialogue panel and try to get another line
				if ( text == "" && m_AutoAdvanceBlankLines )
				{
					AdvanceDialogue();
					return;
				}
			}
			else if ( IsWaitingForInput )
			{
				return;
			}
			else if ( Story.CurrentChoices.Count() > 0 )
			{
				DialogueEvents.ChoicesShown?.Invoke();
				DialogueEvents.ChoicesUpdated?.Invoke( FilteredChoices );
			}
			else
			{
				EndDialogue();
			}
		}

		/// <summary>
		/// Make a choice
		/// </summary>
		/// <param name="choiceIndex"></param>
		public void ExecuteChoice(Choice choice)
		{
			foreach ( var effect in choice.Effects )
			{
				effect.Execute();
			}

			m_story.ChooseChoiceIndex( choice.Index );

			m_AllChoicesCache.Clear();
			m_FilteredChoicesCache.Clear();

			AdvanceDialogue();
		}

		/// <summary>
		/// Set information about the current speaker. Passing null clears the current speaker.
		/// </summary>
		/// <param name="info"></param>
		public void SetSpeaker(SpeakerInfo info)
		{
			if ( info == null || CurrentSpeaker == null || CurrentSpeaker.SpeakerId != info.SpeakerId )
			{
				CurrentSpeaker = info;
				DialogueEvents.SpeakerChanged?.Invoke( info );
			}
		}

		/// <summary>
		/// Set information about the current background. Passing null clears the background.
		/// </summary>
		/// <param name="info"></param>
		public void SetBackground(BackgroundInfo info)
		{
			CurrentBackground = info;
			DialogueEvents.BackgroundChanged?.Invoke( info );
		}


		/// <summary>
		/// Jump the story to an instance of the given storylet and start the dialogue.
		/// </summary>
		/// <param name="storylet"></param>
		public void RunStorylet(Storylet storylet)
		{
			m_story.GoToStorylet( storylet );
			StartDialogue();
		}

		/// <summary>
		/// Jump the story to the given storylet instance and start the dialogue.
		/// </summary>
		/// <param name="instance"></param>
		public void RunStoryletInstance(StoryletInstance instance)
		{
			m_story.GoToStoryletInstance( instance );
			StartDialogue();
		}

		#endregion

		#region Event Handlers

		private void SubscribeToEvents()
		{
			DialogueEvents.DialogueAdvanced += HandleDialogueAdvanced;
			DialogueEvents.ChoiceSelected += OnChoiceSelected;
			DialogueEvents.OnToggleSkipBlankLines += ToggleAutoAdvanceFunctionLines;
			Story.InkStory.onError += OnInkError;
		}

		private void UnsubscribeFromEvents()
		{
			DialogueEvents.DialogueAdvanced -= HandleDialogueAdvanced;
			DialogueEvents.ChoiceSelected -= OnChoiceSelected;
			DialogueEvents.OnToggleSkipBlankLines -= ToggleAutoAdvanceFunctionLines;
			Story.InkStory.onError -= OnInkError;
		}

		private void ToggleAutoAdvanceFunctionLines(bool value)
		{
			m_AutoAdvanceBlankLines = value;
		}

		private void HandleDialogueAdvanced()
		{
			AdvanceDialogue();
		}

		private void OnChoiceSelected(Choice choice)
		{
			ExecuteChoice( choice );
		}

		private void OnInkError(string message, Ink.ErrorType type)
		{
			Debug.LogError( message );
		}

		#endregion

		#region Private Methods

		/// <summary>
		/// Process the Ink tags associated with a line.
		/// </summary>
		private void ProcessLineTags()
		{
			foreach ( string line in m_story.CurrentTags )
			{
				List<string> tagParts = line.Split( " " ).Select( s => s.Trim() ).ToList();
				if ( tagParts[0] == "SetBackground:" )
				{
					SetBackground(
						new BackgroundInfo(
							backgroundId: tagParts[1],
							tags: tagParts.GetRange( 2, tagParts.Count - 2 ).ToArray()
						)
					);
				}
			}
		}

		/// <summary>
		/// PreProcess the dialogue line
		/// </summary>
		/// <param name="line"></param>
		private string PreProcessDialogueLine(string line)
		{
			Match match = Regex.Match( line, @"^(\w+[\.\w+]*):(.*)$" );

			if ( match.Value == "" )
			{
				SetSpeaker( null );
				return line;
			}
			else
			{
				List<string> speakerSpec = match.Groups[1].Value
					.Split( "." ).Select( s => s.Trim() ).ToList();

				string speakerId = speakerSpec[0];
				speakerSpec.RemoveAt( 0 );
				string[] speakerTags = speakerSpec.ToArray();

				SetSpeaker(
					new SpeakerInfo(
						speakerId,
						m_Characters[speakerId].DisplayName,
						speakerTags
					)
				);

				string dialogueText = match.Groups[2].Value.Trim();

				return dialogueText;
			}
		}

		private void RegisterExternalInkFunctions()
		{
			Story.InkStory.BindExternalFunction(
				"GetInput",
				(string dataTypeName, string prompt, string varName) =>
				{
					IsWaitingForInput = true;
					InputDataType dataType = InputDataType.String;

					switch ( dataTypeName )
					{
						case "int":
							dataType = InputDataType.Int;
							break;
						case "float":
							dataType = InputDataType.Float;
							break;
						case "number":
							dataType = InputDataType.Float;
							break;
						case "text":
							dataType = InputDataType.String;
							break;
						default:
							dataType = InputDataType.String;
							break;
					}

					InputRequest = new InputRequest(
						prompt, varName, dataType
					);

					DialogueEvents.InputRequested?.Invoke(
						InputRequest
					);
				}
			);

			Story.InkStory.BindExternalFunction(
				"ShowCharacter",
				(string characterName, string position, string spriteTags) =>
				{
					Debug.Log(
						$"Displaying character {characterName}[tags: {spriteTags}] at {position}."
					);
					DialogueEvents.CharacterShown?.Invoke( characterName, position, spriteTags );
				}
			);

			Story.InkStory.BindExternalFunction(
				"HideCharacter",
				(string characterName) =>
				{
					Debug.Log( $"Hiding character {characterName}" );
					DialogueEvents.CharacterHidden?.Invoke( characterName );
				}
			);

			Story.InkStory.BindExternalFunction(
				"SetCharacterSprite",
				(string characterName, string spriteTags) =>
				{
					Debug.Log(
						$"Updating character {characterName}'s sprite [tags: {spriteTags}]."
					);
					DialogueEvents.CharacterSpriteChanged?.Invoke( characterName, spriteTags );
				}
			);


			// Load functions from external classes.
			DialogueEvents.InkStoryLoaded?.Invoke( Story.InkStory );
		}

		#endregion
	}
}
