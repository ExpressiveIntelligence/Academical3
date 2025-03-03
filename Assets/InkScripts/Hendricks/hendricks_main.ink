/*

MAIN ENTRY SCRIPT FOR HENDRICKS' PLAYABLE CHARACTER
===================================================

All dialogue scripts for playing as Hendricks need to be imported below to be
included in the game.

*/

INCLUDE ../helpers.ink
INCLUDE ./locations.ink
INCLUDE ./Hendricks&Jensen/HJ_IntroLab.ink
INCLUDE ./Hendricks&Praveen/HenPra_Socializing1.ink
INCLUDE ./Hendricks&Praveen/HenPra_Conference.ink

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

-> library

-> DONE
