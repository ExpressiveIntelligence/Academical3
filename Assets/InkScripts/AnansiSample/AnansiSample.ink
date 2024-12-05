// INCLUDE ./EvelynDialogue.ink
// INCLUDE ./SampleDialogue.ink

EXTERNAL ShowCharacter(characterName, location, spriteTags)
EXTERNAL HideCharacter(characterName)
EXTERNAL SetPlayerLocation(locationId)
// EXTERNAL DbInsert(statement)
// EXTERNAL DbDelete(statement)
// EXTERNAL DbAssert(statement)
// EXTERNAL AdvanceTime()
// EXTERNAL QueueStorylet(storyletId)
// EXTERNAL QueueStoryletWithTags(tags, fallback)
// EXTERNAL GetInput(dataType, prompt, variableName)
// EXTERNAL DivertToStorylet(knot)
// EXTERNAL GetEligibleActions()
// EXTERNAL GetEligibleLocations()


VAR speaker = ""
VAR PlayerName = "player"
VAR StudentID = 0


=== start ===
#---
#===

{ShowCharacter("player", "right", "")}

-> library

-> DONE

=== library ===
#---
# choiceLabel: Go to Library.
# hidden: true
# tags: location
#===

{SetPlayerLocation("library")}

-> DONE

=== student_cubes ===
#---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
#===

{SetPlayerLocation("student_cubes")}

-> DONE

=== lecture_hall ===
#---
# choiceLabel: Go to the lecture hall.
# hidden: true
# tags: location
#===

{SetPlayerLocation("lecture_hall")}

-> DONE

=== outside ===
#---
# choiceLabel: Go Outside.
# hidden: true
# tags: location
#===

{SetPlayerLocation("outside")}

-> DONE

=== cafe ===
#---
# choiceLabel: Go to the Cafe.
# hidden: true
# tags: location
#===

{SetPlayerLocation("cafe")}

-> DONE

=== talk_to_brad ===
# ---
# choiceLabel: Talk to Brad
# @query
# Brad.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Brad: Hi {ShowCharacter("Brad", "left", "")}

{HideCharacter("Brad")}

-> DONE

=== talk_to_bronislav ===
# ---
# choiceLabel: Talk to Bronislav
# @query
# Bronislav.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Bronislav: Hi {ShowCharacter("Bronislav", "left", "")}

{HideCharacter("Bronislav")}

-> DONE

=== talk_to_hendricks ===
# ---
# choiceLabel: Talk to Hendricks
# @query
# Hendricks.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Hendricks: Hi {ShowCharacter("Hendricks", "left", "")}

{HideCharacter("Hendricks")}

-> DONE

=== talk_to_ivy ===
# ---
# choiceLabel: Talk to Ivy
# @query
# Ivy.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Ivy: Hi {ShowCharacter("Ivy", "left", "")} {ShowCharacter("Matilda", "center", "")}

Ivy: How are you?

+ [Let's be friends #>> FireSocialEvent BecomeFriends player Ivy]
+ [I'm Okay #Random Tag]
+ [I could be better #>> AddTrait player sad]
+ [Good. You? #>> AddTrait player happy]
-

Ivy: Good to hear. See you later.

{HideCharacter("Ivy")} {HideCharacter("Matilda")}

-> DONE

=== talk_to_ned ===
# ---
# choiceLabel: Talk to Ned
# @query
# Ned.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Ned: Hi {ShowCharacter("Ned", "left", "")}

{HideCharacter("Ned")}

-> DONE

=== talk_to_matilda ===
# ---
# choiceLabel: Talk to Matilda
# @query
# Matilda.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Matilda: Hi {ShowCharacter("Matilda", "left", "")}

{HideCharacter("Matilda")}

-> DONE

=== talk_to_Praveen ===
# ---
# choiceLabel: Talk to Praveen
# @query
# Praveen.location!?loc
# player.location!?loc
# @end
# hidden: true
# tags: action
# ===

Praveen: Hi {ShowCharacter("Praveen", "left", "")}

{HideCharacter("Praveen")}

-> DONE

=== conversation_fallback ===
# ---
# ===

They have nothing to say to you.

-> DONE
