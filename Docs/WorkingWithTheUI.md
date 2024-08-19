# Working with the UI

This document is for UI developers and explains how Academical's UI is implemented. We use a [Model-View-Controller (MVC)](https://en.wikipedia.org/wiki/Model–view–controller) architecture to manage UI in the game.

- (Model) UXML files configured using Unity UI Builder.
- (View) `UIView` class adds interactivity to models and are managed by a `UIManager` or parent UI view.
- (Controller) Controller MonoBehaviour that updates game state based on interactions

The UI system also uses an event bus architecture to keep the various UI screens decoupled.

The best example of this system is currently the main menu system.

## File Structure

- `Assets/Scripts/UI/Controllers` - Screen controller MonoBehaviour scripts
- `Assets/Scripts/UI/Events` - Static classes serving as event buses
- `Assets/Scripts/UI/Views` - UIView class implementations
- `Assets/Scripts/UI/UIManager.cs` - The UI Manager for the main menu. (subject to change)
- `Assets/UI Toolkit/**.uxml` - UI UXML files (subject to change)

## Creating Custom UI Views

UI Views can be entire screens or a sub component of a screen. To create a custom view to match a UXML, you need to make a new C\# file with a class that inherits from `Academical.UIView`. Take a look at `Assets/Scripts/UI/UIManager.cs` for an example of how to instantiate and manage UIView instances.

```csharp
// Example custom UI view

namespace Academical
{
    public class CustomView : UIView
    {
        // Method overrides
    }
}
```

## References

The design of our UI system is adapted from the [Dragon Crashers UI Toolkit Sample](https://assetstore.unity.com/packages/essentials/tutorial-projects/dragon-crashers-ui-toolkit-sample-project-231178).
