# Adding New Content

Academical 3 has "scenes" in which one or more characters have a conversation with the main character, Bronislav. Each set of scenes is assigned to one or more days, allowing them to appear in multiple time steps. Each "day" is a non-continuous time step (i.e. the game does not occur over six continuous days, but rather six days throughout a school term). Conversations can be required or optional. Each day begins with a brief summary of the story thus far. 

Adding new scene content involves a combination of adding .ink files and setting configurations across the code base.

## Structure

Each day has the following structure:

- Intro Scene
- Open Scene Exploration
- End Day*

* "End Day" is only accessible if all "required" scenes have been completed.

## Adding Days

To add a day to the game, you must:
1. Add a new "dayX.ink" file, which specifies the day being added. You may have to update other "dayX.ink" files to match the new order. 
2. Write the introduction to the day in the "dayX.ink" file.
3. Update day configurations in the Assets/Scripts/Constants/DateLabelConstants.cs file to ensure the day is properly fetched at runtime.
4. Add the scene in Assets/InkScripts/CharacterName/main.ink for compilation inclusion.

## Adding Scenes

### Showing/Hiding Characters

### Adding Flags

### Changing Relationship Stats

### Querying Current Relationship Stats

### Headers/Tags

#### Adding Preconditions

#### Specifying Date

#### Specifying Location

#### Adding "required" Scenes
Required scenes can be added by specifying the "required" tag in the header of an ink file.