# The Notification System

As players progress through the story they reach certain landmarks that we want
to call attention to (mainly within the dilemma system). The notification
system borrows design aspects from push notifications to alert players when
they have unlocked, completed, or progressed a dilemma.

## UI

The notification UI is placed on its own Canvas object. This is mainly for
performance purposes. We don't want unity to redraw the entire game canvas just
to animate the notification box.

The `NotificationAlertView` is a UI component that displays a message to the
player. Its appears automatically when the game issues a notification and
disappears after a given amount of time (this time is paused if the player's
mouse is hovering above). Players can click the notification alert to do
something related to the notification. In most cases, we will display dilemma-
related notifications, and clicking the box for these will open the Dilemma
Manager window and display information about the dilemma.

## Code Interface and Implementation

The notification system has two main components: the `NotificationAlertView` and
the `NotificationManager`. The `NotificationManager` is a singleton class that
external code systems interface with to display alerts in the UI. 

```csharp

// The code below requests the following alert message be shown
NotificationManager.QueueNotification(message)

// The code below requests the alert message to be shown
// and provides a callback function to execute if the player
// clicks on the notification
NotificationManager.QueueNotification(message, onClickAction)

```
