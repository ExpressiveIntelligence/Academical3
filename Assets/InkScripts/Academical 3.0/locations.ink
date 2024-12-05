/*

Locations
=========

This file contains all the storylet definitions for
locations the player can move between. This file should
only contain definitions for those locations. Exceptions
are made for any content that need to be triggered
immediately upon navigation. In those cases, please put
all the dialogue content in another file, include it here
using "INCLUDE <path_to_file>", and place the divert
within a conditional block to ensure it is only triggered
once and only when appropriate.

Rules for creating locations
----------------------------

- Knots must end with a "-> DONE". We will get an error
  if they don't.
- Call the "SetCurrentLocation" external function to
  ensure the background is updated when the game starts.
  The ID of a location is specified in the Unity Editor.
  Check the "backgrounds" GameObject group under the
  "canvas" object. The locationId is the UniqueID given
  in the Location component.

*/

EXTERNAL SetCurrentLocation(locationId)

=== cafe ===
# ---
# choiceLabel: Go to the cafe.
# hidden: true
# tags: location
# ===

{SetCurrentLocation("cafe")}

-> DONE


=== student_cubes ===
# ---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
# ===

{SetCurrentLocation("student_cubes")}

-> DONE


=== library ===
# ---
# choiceLabel: Go to the library.
# hidden: true
# tags: location
# ===

{SetCurrentLocation("library")}

-> DONE


=== lecture_hall ===
# ---
# choiceLabel: Go to the lecture hall.
# hidden: true
# tags: location
# ===

{SetCurrentLocation("lecture_hall")}

{action_selection_tutorial == 0:
  ->action_selection_tutorial
}

-> DONE

