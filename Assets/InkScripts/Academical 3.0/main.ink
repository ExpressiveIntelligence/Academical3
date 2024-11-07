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

INCLUDE ./locations.ink
INCLUDE ./Bron&IvyFirstCoffeeSolo.ink
INCLUDE ./Bron&IvyIRBReviewSolo.ink
INCLUDE ./Bron&JenCoffee.ink
INCLUDE ./Bron&JenIntroSolo.ink

EXTERNAL DbInsert(statement)


// There can be only one "start" storylet. We place it in this
// file to ensure its always available when the game starts.
=== start ===
# ---
# ===

-> lecture_hall

-> DONE
