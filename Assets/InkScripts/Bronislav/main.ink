/*

The Main Ink file
=================

This file is the main entry point for all content in the game.
It is provided to the Dialogue Manager in the Unity Editor to
allow us to play through all the content.

Each additional Ink file with story content should be added
below following the "INCLUDE" keyword. When the Ink compiler
translates this file into JSON, the content from all files
listed below are included with it.

That being the case, we must ensure that:
1. There is only one "start" storylet
2. We do not duplicate knot names
3. Location storylets are separated from conversation storylets
   unless we intend for the conversation to trigger
   immediately when the player navigates. If we do have
   immediate dialogue, the divert needs to be placed in
   a conditional block to ensure we don't visit it again on
   further navigation to that location.

*/

INCLUDE ../helpers.ink

INCLUDE ./Bron&Hendricks/BH_Socializing1.ink
INCLUDE ./Bron&Hendricks/BH_Socializing2.ink
INCLUDE ./Bron&Hendricks/BH_Socializing3.ink
INCLUDE ./Bron&Hendricks/BH_Socializing4.ink
INCLUDE ./Bron&Hendricks/BH_Socializing5.ink
INCLUDE ./Bron&Hendricks/BH_Socializing6.ink

INCLUDE ./Bron&Jen/BJ_Introduction.ink
INCLUDE ./Bron&Jen/BJ_Socializing3.ink
INCLUDE ./Bron&Jen/BJ_Socializing5.ink
INCLUDE ./Bron&Jen/BJ_Socializing6.ink
INCLUDE ./Bron&Jen/BJ_Conference.ink
INCLUDE ./Bron&Jen/BJ_ConferenceReview.ink

INCLUDE ./Bron&Ivy/BI_ConferenceSubmission.ink
INCLUDE ./Bron&Ivy/BI_Introduction.ink
INCLUDE ./Bron&Ivy/BI_IRBReview.ink
INCLUDE ./Bron&Ivy/BI_Socializing6.ink
INCLUDE ./Bron&Ivy/BI_Conference.ink
INCLUDE ./Bron&Ivy/BI_ReviewPeriod.ink
INCLUDE ./Bron&Ivy/BI_Socializing3.ink
INCLUDE ./Bron&Ivy/BI_Socializing5.ink

INCLUDE ./Bron&Ned/BN_Socializing1.ink
INCLUDE ./Bron&Ned/BN_Socializing5.ink
INCLUDE ./Bron&Ned/BN_LabMeeting.ink

INCLUDE ./Bron&Praveen/BP_ConferenceSubmissionDeadline.ink
INCLUDE ./Bron&Praveen/BP_Socializing2.ink
INCLUDE ./Bron&Praveen/BP_Socializing3.ink
INCLUDE ./Bron&Praveen/BP_Socializing4.ink
INCLUDE ./Bron&Praveen/BP_Socializing6.ink
INCLUDE ./Bron&Praveen/BP_EvilPlan.ink

INCLUDE ./Bron&Brad/BB_LabMeeting.ink
INCLUDE ./Bron&Brad/BB_Socializing1.ink
INCLUDE ./Bron&Brad/BB_ConferenceSubmissionDeadline.ink
INCLUDE ./Bron&Brad/BB_Socializing4.ink
INCLUDE ./Bron&Brad/BB_Socializing6.ink
INCLUDE ./Bron&Brad/BB_Conference.ink

INCLUDE ./DayIntros/day1.ink

EXTERNAL DbInsert(statement)
EXTERNAL DbAssert(statement)
EXTERNAL ShowCharacter(characterName, location, spriteTags)
EXTERNAL HideCharacter(characterName)
EXTERNAL GetOpinion(from, to)
EXTERNAL HasUnseenAuxiliaryActions()
EXTERNAL HasUnseenRequiredActions()
EXTERNAL FadeToBlack(delay)
EXTERNAL FadeFromBlack(delay)
EXTERNAL ShowInfoDialog(dialogId)
EXTERNAL AdvanceDay()
EXTERNAL LockAllLocations(message)
EXTERNAL UnlockAllLocations()
EXTERNAL SetPlayerLocation(locationID)


// There can be only one "start" storylet. We place it in this
// file to ensure its always available when the game starts.
=== start ===
# ---
# ===

{SetPlayerLocation("lecture_hall")}

Welcome to the world of Academical!

{ShowCharacter("Bronislav", "right", "")}

This is you! Your name is Bronislav. 
You are a PhD student in the final stretch of their dissertation. You are trying to finish out a final round of publications while maintaining your relationships with professors and peers in the Psychology department at your university.
The stresses of your degree are getting to you - your Visa ends soon, and you need to find a job that will provide one shortly after graduation. You also need a few more peer-reviewed conference publications to demonstrate the quality of your dissertation.
You are just starting a new quarter, and a major conference is coming up soon. Students and Faculty alike are rushing around trying to get their work submitted on time.
Your job is to navigate through conversations and meetings with characters in the department throughout the upcoming term.

{HideCharacter("Bronislav")}

Before we start, some tips:
The top of the screen has a row of buttons to help you manage your time in this world.
The "Pause" button lets you change settings and take a break from the story.
The "Save" button lets you save your progress so you can return at a later time.
The "History" button shows a history of past dialogue you've encountered in the story.
The "Characters" button shows information about each character as well as your current relationship status with them.
The "Dilemmas" button shows what moral and relationship issues have arisen.
The "Agenda" button shows what key events are planned for the upcoming term.
Characters will be at various locations across campus during gameplay. The "Choose Location" button on the lower-right side of the screen allows you to go to various locations. Areas of interest will be represented with exclamation and question mark icons.
Once in a location, the "Choose Action" button on the bottom-left will allow you to choose a specific character to interact with at a given location.
With all of that out of the way, let's get started! 

{ShowCharacter("Bronislav", "right", "")}

It's the start of a new term - and you've (mostly) finished work on research that you aim to submit to a conference at the end of the term.

Your department has agreed to watch a presentation of your work so that you can get feedback before your final submission.

-> DONE
