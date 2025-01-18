# Persisting Data

There are several steps to managing save data and data across scenes. The two approaches are using a Data Persistence Interface (which will save data to Application.persistentDataPath, which is OS agnostic) or by using ScriptableObjects to persist data across scenes within a single session.

## Persisting to File System

Persisting values to the file system involves several steps across several files. This allows the system to be modular and be implemented using an interface. The steps are as follows:

1. Identify the data you'd like to persist across Game Sessions and what Game Objects are touching that data. There is always a Game Session object that can be used for global/player related data if needed.
2. Add a "GameSession" and "DataPersistenceManager" object to your scene if it's not already there. Attach the scripts with the same name to these objects.
3. Add the fields you would like to persist to GameState.cs with the relevant typing attached.
4. In the script containing the relevant data to be persisted:
- Ensure that the data to be saved is serializable and tag it as such.
- Add the "IDataPersistence" interface
- Implement SaveData and LoadData methods. SaveData should set the reference GameState object equal to the Game Object's current values. LoadData should set the Game Object's current values to the GameState's current values.

## Persisting across scenes with Scriptable Objects

Data can be saved across scenes within a single game session using Scriptable Objects. The steps are as follows:

1. Identify the GameObject and the data within that you'd like to persist across scenes
2. Create a script in the ScriptableObjects folder with the name convention (GameObject Name)SO - replace MonoBehaviour with ScriptableObject and delete Start and Update methods
3. Add in types and data for whatever you'd like to persist between scenes that correspond with the Game Object script that you are saving/reading from
4. In the GameObject file, add a field for the corresponding ScriptableObject.
5. In the Unity editor, create a Scriptable Object in the ScriptableObjects folder using the create menu. Link this object to the field created in step 4.
6. In the GameObject that is using the Scriptable Object, add code at the appropriate time for when you'd like to read/write to the Scriptable Object. For example, you might read from the Scriptable Object in the Start/Awake methods, and write to it whenever data is updated to the GameObject.

## Combining File Saving and Scriptable Objects

Data from the file system can be loaded into Scriptable Objects at the start of the game to be used across a session. Alternatively, you can read and save from the file system on scene load and exit. To combine both file data and scriptable object data, add code in the LoadGame method to populate the corresponding fields in the Scriptable Object with fields from the incoming GameState. The SaveGame method can be left alone as the GameObject will save to file using it's current data.

## System Notes

1. The current JSON tool does not support complex data types such as dictionaries out of the box. To handle this, you can either use an external class that parses the data you'd like to save into a serializable format, or we can consider replacing the JSON tooling with a library such as JSON.net to handle these cases.
2. The FileDataHandler can be swapped out with another type of handler that can handle online saves if we need to.
3. The save system should be platform agnostic, but still needs to tested on MacOS and WebGL to confirm.
4. Be careful when using Scriptable Objects across multiple instances of Game Objects - unless additional Scriptable Objects are created to correspond with specific Game Objects, they will all inherit from the same data store. Additional Save/Load code may have to be written if this path is taken.
5. GameObjects and scripts originating from a package (e.g. Anansi) are immutable by definition and cannot implement the save system. We can either import the package into assets to enable editing, or create scripts separately that can implement the save system.
6. The example for the save system is implemented in the "Authorship" scene.
