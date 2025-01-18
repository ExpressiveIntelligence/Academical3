/*

MAIN ENTRY SCRIPT FOR HENDRICKS' PLAYABLE CHARACTER
===================================================

All dialogue scripts for playing as Hendricks need to be imported below to be
included in the game.

*/

INCLUDE ./helpers.ink
INCLUDE ./locations.ink

EXTERNAL DbInsert(statement)
EXTERNAL DbAssert(statement)
EXTERNAL ShowCharacter(characterName, location, spriteTags)
EXTERNAL HideCharacter(characterName)
EXTERNAL GetOpinion(from, to)
EXTERNAL HasUnseenAuxiliaryActions()
EXTERNAL HasUnseenRequiredActions()
EXTERNAL FadeToBlack(delay)
EXTERNAL FadeFromBlack(delay)


=== start ===
# ---
# ===

{ShowCharacter("Hendricks", "right", "")}

In this playthrough, you are Hendricks, assistant professor in the Psychology department at Shiz University.

-> library

-> DONE
