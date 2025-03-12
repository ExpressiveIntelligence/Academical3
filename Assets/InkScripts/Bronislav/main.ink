/*

The Main Ink file
=================

This file is the main entry point for all content in the game.
It is provided to the Dialogue Manager in the Unity Editor to
allow us to play through all the content.

Each additional Ink file with story content should be added
belowe following the "INCLUDE" keyword. When the Ink compiler
translates this file into JSON, the content from all files
listed below are included with it.

That being the case, we must ensure that:
1. There is only onne "start" storylet
2. We do not duplicate knot names
3. Location storylets are separated from conversation storylets
   unless we intend for the conversation to trigger
   immediately when the player navigates. If we do have
   immediate dialogue, the divert needs to be placed in
   a conditional block to ensure we don't visit it again on
   further navigations to that location.

*/

INCLUDE ../helpers.ink
INCLUDE ./locations.ink
INCLUDE ./actions.ink
INCLUDE ./Bron&Hendricks/BH_Socializing1.ink
INCLUDE ./Bron&Hendricks/BH_Socializing2.ink
INCLUDE ./Bron&Jen/BJ_Introduction.ink
INCLUDE ./Bron&Jen/BJ_Socializing3.ink
INCLUDE ./Bron&Jen/BJ_Socializing5.ink
INCLUDE ./Bron&Jen/BJ_Socializing6.ink
INCLUDE ./Bron&Jen/BJ_Conference.ink
INCLUDE ./Bron&Jen/BJ_ConferenceReview.ink
INCLUDE ./Bron&Ivy/BI_ConferenceSubmission.ink
INCLUDE ./Bron&Ivy/BI_Introduction.ink
INCLUDE ./Bron&Ivy/BI_IRBReview.ink
INCLUDE ./Bron&Ivy/BI_Socializing7.ink
INCLUDE ./Bron&Ivy/BI_Conference.ink
INCLUDE ./Bron&Ivy/BI_ReviewPeriod.ink
INCLUDE ./Bron&Ivy/BI_Socializing3.ink
INCLUDE ./Bron&Ned/BN_Socializing1.ink
INCLUDE ./Bron&Ned/BN_LabMeeting.ink


EXTERNAL DbInsert(statement)
EXTERNAL DbAssert(statement)
EXTERNAL ShowCharacter(characterName, location, spriteTags)
EXTERNAL HideCharacter(characterName)
EXTERNAL GetOpinion(from, to)
EXTERNAL HasUnseenAuxiliaryActions()
EXTERNAL HasUnseenRequiredActions()
EXTERNAL FadeToBlack(delay)
EXTERNAL FadeFromBlack(delay)


// There can be only one "start" storylet. We place it in this
// file to ensure its always available when the game starts.
=== start ===
# ---
# ===

// Show the current player character on screen
// (even when not in dialogue)
{ShowCharacter("Bronislav", "right", "")}

-> lecture_hall

-> DONE

=== go_home ===
# ---
# choiceLabel: Go Home
# repeatable: true
# tags: action, student_cubes
# ===

{
   - HasUnseenRequiredActions():
      There are still things you must do. Look for locations with unvisited actions.
   - HasUnseenAuxiliaryActions():
      There are still some things you could do.
      -> check_advance_day
   - else:
      It's been a busy day.
      -> check_advance_day
}

-> DONE

=== check_advance_day ===

Do you still want to advance the day?
+ [Yes]
   -> advance_day
+ [No]
-

-> DONE

=== advance_day ===

You go home for the day. {FadeToBlack(0)} {HideCharacter("Bronislav")}

New day. New things to do. {FadeFromBlack(1)} {ShowCharacter("Bronislav", "right", "")}

-> DONE

-> DONE
