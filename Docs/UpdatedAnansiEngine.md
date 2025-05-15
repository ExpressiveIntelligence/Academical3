# Updated Anansi Engine

Academical's version of Anansi has game-specific changes that make it incompatible with the version in the original  repository. This file contains notes about some of the notable changes and how they work. Eventually, this will become documentation for the main project once all changes have been back-ported.

## Adding Characters

Location information is provided to the game using ScriptableObjects. This workflow deviates from the usual Anansi workflow by separating character data from their presentation on screen. The `CharacterSO` class' fields are listed below. All characters are loaded into a single `CharacterDatabaseSO` scriptable object that is loaded into the game.

- `uid`: The unique ID of this character.
- `displayName`: The name displayed when the character is speaking / is spoken of.
- `nameColor`: The color used when displaying the character's name in dialogue.
- `bio`: A short summary of this character's background.
- `relationships[]`: A list of relationship entries containing opinion and relationship trait overrides.
  - Each entry has the following fields:
    - `targetUid`: The uid of the character this relationship is toward.
    - `opinionBase`: The base value of the opinion from this character to the target.
    - `traits`: IDs of traits to attach to this relationship at the start of the game.
- `Poses[]`: A list of pose sprite information.
  - Each entry has the following fields:
    - `poseType`: The type of pose this is.
    - `sprite`: The sprite to display when the character has this pose.
- `defaultPose`: The sprite default to when showing this character (fallback if pose not found).

## Adding Locations

Location information is provided to the game using ScriptableObjects. This workflow deviates from the usual Anansi workflow by separating location data from its presentation on screen. The `LocationSO` class' fields are listed below. All locations are loaded into a single `LocationDatabaseSO` scriptable object that is loaded into the game.

- `uid`: The unique ID of this location.
- `displayName`: The name displayed when at this location or the location is mentioned in dialogue.
- `nameColor`: The color used when displaying the name in dialogue.
- `bio`: A short description of the location.
- `connectedLocations[]`: A list of locations accessible from this location.
- `backgrounds[]`: A list of background sprite information
  - Each entry has the following fields:
    - `timeOfDay`: The time of day to when the sprite is presented.
    - `sprite`: The sprite to display in the background.
- `defaultBackground`: The sprite to default to when showing this location (fallback when time of day not found).
- `lockConditions`: A list of conditions under which this location is inaccessible
  - Each entry has the following fields:
    - `preconditions[]`: A list of database statements
    - `text`: Text shown to the player when this condition is active and they cannot access the location

## Adding Non-Location Backgrounds

Non-location backgrounds are sprites that can be displayed without changing the current location of the story. These are all collected into a single `NonLocationBackgroundsSO`.

Each entry in the scriptable object has the following fields:

- `uid`: The unique ID of this background image.
- `sprite`: The sprite to display.

## Starting the Game

When the game starts it uses the following procedure:

1. Invoke the `OnGameStart` action.
2. Look for a storylet named `start`, and initialize and run it if found. The old version of Anansi required writers to include a `=== start ===` storylet in their Ink file. Start-storylets are now optional.
3. If `start` is not found, run the Ink script using Ink's default procedure (top to bottom).

## Changing Locations / Background Images

Location change has three approaches that do slightly different things depending your intentions and the current state of the game.

### 1. Changing player location outside of dialogue

The first case is when the player changes location while not engaging in dialogue. So, this process is *NOT* initiated within Ink. The Game Manager performs the following procedure to update the player's location, trigger any required dialogue, and notify external systems.

1. Check to see if the location is accessible. If yes, continue, if not show lock condition text and end.
2. Look for any storylets tagged as `OnLocationExit:<LocationID>` and attempt to instantiate one. If a storylet is successfully instantiated, the game manager ends the location change process and runs the dialogue.
3. Invoke the `OnLocationExit` action.
4. Update player's location in the game state
5. Change the background image shown
6. Invoke the `OnLocationEnter` action.
7. Look for any storylets tagged as `OnLocationEnter:<LocationID>` and attempt to instantiate one.
8. If none are found in the previous step, attempt to find and run the storylet with the matching name of this location's UID

### 2. Changing player location inside dialogue

This is the process used to move the player and update the location background while executing dialogue in an Ink script. Take note that storylets tagged as `OnLocationExit:<LocationID>` or `OnLocationEnter:<LocationID>` are **NOT** called when changing locations within Ink. Also, the storylet corresponding with this location is ignored, too. The game assumes that if the writer is moving the player, it is part of an on-going dialogue, and triggering new storylets would disrupt the existing flow.

1. `{SetPlayerLocation(<LocationID>)}` is called within Ink.
2. Invoke the `OnLocationExit` action.
3. Update player's location in the game state
4. Change the background image shown
5. Invoke the `OnLocationEnter` action.

### 3. Changing background image only

To only change the background image and leave the player where they are, call `{SetBackground(<backgroundID>)}` in Ink. This will retrieve the image associated with the provided `backgroundID` and set it as the current background. No C\# events or actions are invoked, nor are any location change storylets.

## The Save System

Most of this information is Academical-specific, but can help someone understand how to save data for their custom project(s). Data is saved using JSON. Below is a TypeScript schema if the data. Save data is stored at the persistent data path.

```typescript
interface DialogueHistoryEntry {
    // The ID of the character that spoke the line.
    speakerId: string;
    // The text spoken.
    text: string;
}

interface ChoiceHistoryEntry {
    // The unique ID of this choice.
    choiceId: string;
    // The text shown with this choice.
    choiceText: string;
    // This numerical index of the choice as it was presented on screen.
    choiceIndex: number;
}

interface RelationshipData {
    // The ID of the character that owns the opinion.
    subjectId: string;
    // The ID of the character the opinion is about.
    targetId: string;
    //  The base opinion score.
    opinionBase: number;
}

interface DateData {
    // Current day (total number of elapsed days).
    day: number;
    // Name of the current time of day.
    timeOfDay: string;
}

interface DilemmaData {
    // The Id of the dilemma.
    dilemmaId: string;
    // This will wither be 1 fo IN_PROGRESS or 2 for COMPLETED.
    state: number;
}

interface StoryletData {
    // The storylet ID.
    storyletId: string;
    // Number of chosen actions of storylet queues that must elapse before this on is eligible.
    cooldown: number;
    // Number of times the storylet was visited
    timesVisited: number;
}

interface StoryData {
    // Ink's serialized JSON data.
    inkJson: string;
    // State information about storylets.
    storylets: StoryletData[];
}

interface SaveData {
    // The ID of the level being played.
    levelId: string;
    // Dialogue lines presented in their last conversation / storylet.
    dialogueHistory: DialogueHistoryEntry[];
    // Recorded choices.
    choiceHistory: ChoiceHistoryEntry[];
    // Relationship state overrides.
    relationships: RelationshipData[];
    // Database information.
    databaseEntries: string[];
    // Total number of minutes played.
    timePlayed: number;
    // Save timestamp (ISO date string).
    saveTimeStamp: string;
    // Was this an auto save.
    isAutoSave: boolean;
    // The ID of the player's current location
    currentLocationId: string;
    // The current date in the game
    inGameDate: DateData;
    // Current state of dilemmas
    dilemmas: DilemmaData[];
    // State information for Ink and storylets.
    storyData: StoryData;
}
```

### Saving the game

The player can save the game at any point outside of a conversation. Within a conversation, we cannot guarantee that the state will load properly. So, we don't allow mid-conversation saves.

The game auto saves whenever the player leaves a conversation or when the day is advanced.

Auto saves can never override a non-autosave.

### Loading Save Data

Players can load previously saved games from the main menu. Clicking on a save slot will load the game scene and start the overriding process.

During the overriding process, default world information (character opinions, current date, storylet states, etc.) are overridden with data from the selected save file.

After the game state has been updated, the game passes control back to the player.

### Deleting Save Data

Game saves can be deleted in the main menu. The player will receive a confirmation dialog box asking if they are sure before they delete the save.

## Storylet Tooltips

This is an Academical-specific extension to storylets to add tooltip information if someone hovers over the choice button in the GUI.
