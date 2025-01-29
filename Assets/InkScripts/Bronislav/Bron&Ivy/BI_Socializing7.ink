VAR hello = false
VAR apology = true

=== BI_S7_SceneStart ===
# ---
# choiceLabel: Talk with Ivy
# hidden: true
# repeatable: false
# tags: action, student_cubes, auxiliary
# ===

{ShowCharacter("Ivy", "left", "")}

{DbInsert("Seen_BI_S7")}

As you walk over to the cubicles, you notice Ivy hunched over at her desk.

*["Hey, are you okay?"]
->AreYouOkay

*[Keep walking.]
->KeepWalking

=== AreYouOkay ===
Bronislav: "Hey, are you okay?"

Ivy lifts her head to look back at you silently, returning to her original position.

*["What's wrong?"]
->WhatsWrong

*[Say nothing.]
~ hello = true
->KeepWalking

=== WhatsWrong ===
// TODO: WRITE SELECTORS BASED OFF OF POSTIVE/NEUTRAL/NEGATIVE IVY RELATIONSHIP
//if positive relationship
Bronislav: "What's wrong Ivy?"

Ivy sighs, and you can tell she is very upset.

Ivy: "I really screwed up. I never should have used our friendship to try and leverage something for Jensen. It was my own stupid attempt to twist your arm into helping Jensen, and all of it was just wrong."

She shakes her hed sadly.

Ivy: "I took advantage of our frienship, and for that I am truly sorry."

*["I appreciate your apology." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->AppreciateYourApology

*["You should be sorry." #>> DecrRelationshipStat Ivy Bronislav Opinion -50]
->YouShouldBe

*[Say nothing.]
->SayNothing

//if neutral relationship
// Bronislav: "What's wrong Ivy?"

// Ivy sighs, and you can tell she is very upset.

// Ivy: "I.. uh.. would like to apologize. I pressured you into helping Jensen because I so desperately wanted to help him. But, it was so wrong for me to put you in that type of situation, and I feel awful for it."

// She shakes her hed sadly.

// Ivy: "I tried to leverage my connections to force you to help, and for that I am truly sorry."

// *["I appreciate your apology." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
// ->AppreciateYourApology

// *["You should be sorry." #>> DecrRelationshipStat Ivy Bronislav Opinion -50]
// ->YouShouldBe

// *[Say nothing.]
// ->SayNothing

//if negative relationship
// Bronislav: "What's wrong Ivy?"

// Ivy glares at you, and you can tell your question has struck a nerve.

// Ivy: "Don't act like you care all of a sudden."

// She barks before biting her lip, regreting her harshness.

// Ivy: "Sorry, uh... Bronislav, I..."

// She sighs as she gathers her thoughts.

// "Look, I want to apologize. I know we aren't close or anything, but that was no excuse to pressure you like I did to try and help Jensen. It was so wrong for me to put you in that type of situation, and I feel awful about it. I am truly sorry, for all of it."

// *["I appreciate your apology." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
// ->AppreciateYourApology

// *["You should be sorry." #>> DecrRelationshipStat Ivy Bronislav Opinion -80]
// ->YouShouldBe

// *[Say nothing.]
// ->SayNothing

=== AppreciateYourApology ===
Bronislav: "I appreciate your apology."

You say with a small smile, as you see some of the stress lift off of Ivy's shoulders.

Bronislav: "I know you were coming from a good place, and just trying to help a friend. I can tell you feel guilty about everything."

Ivy: "I have no plans of doing it again, that's for certain."

You both smile breifly, before you nod and continue on your way.

{HideCharacter("Ivy")}

->DONE

=== YouShouldBe ===
Bronislav: "You should be sorry."

The coldness in your voice catches Ivy off-guard.

Ivy: "I was apologizing Bronislav..."

Bronislav: "Well, maybe you should have thought about what would happen before you tried to pressure me like you did."

Ivy stands up from her chair, hurt clouding her face.

Ivy: "I am sorry for everything, but you don't need to shove this in my face."

Ivy pushes past you and walks out of the room before you can say another word.

{HideCharacter("Ivy")}

->DONE

=== SayNothing ===

You say nothing as you akwardly glance away from her.
{apology == false:
~apology = true
Ivy: "I just, um... wanted to say that I'm sorry. To you, about... well a lot of things."

*["I'm listening."]
->ImListening

*[Walk away. #>> DecrRelationshipStat Ivy Bronislav Opinion -10]
->WalkAway

-else:
Ivy: "I know this is a lot, and you don't need to accept my apology, but I just at least want you to know I feel guilty for everything I've put you through."

You nod, acknowledging her.

Bronislav: "Okay. I hear you."

Ivy thinks about saying something else, but stops herself, turning back to her desk. You decide to continue on your way.

{HideCharacter("Ivy")}

->DONE

}

=== ImListening ===
Bronislav: "I'm listening."

Ivy figets in her chair, and you notice her eyes look swollen from crying.

->WhatsWrong


=== WalkAway ===
You turn and begin to walk away, which prompts Ivy to stand up and chase you.

"Wait! Please, just hear me out."

You look back to find Ivy staring at the floor, her arms crossed as she shakes a bit.

->WhatsWrong

=== KeepWalking ===
{hello:
Unsure of what to say, you turn to walk away. As you do so, you hear Ivy's voice faintly from behind you.
-else:
As you continue to walk by the cubicles, you hear Ivy's voice faintly from behind you.
}
Ivy: "Bronislav?"

*["Hey, how are you holding up?"]
->HoldingUp

*["Uh, hi Ivy."]
->UhHi

*[Say nothing.]
~ apology = false
->SayNothing

=== HoldingUp ===
Bronislav: "Hey, how are you holding up?"

Ivy shuffles uncomfortablly.
//if positive relationship
Ivy: "Terrible, if I'm honest. And I owe you a huge apology."

->WhatsWrong

//if neutral relationship
//Ivy: "Not great. And I really have been meaning to talk to you."

//->WhatsWrong

//if negative relationship
//Ivy: "I'm fine."

//Ivy sighs, staring at the floor.

//Ivy: "But, there is something I need to get off my chest."

//->WhatsWrong


=== UhHi ===
Bronislav: "Uh, hi Ivy."

You say quietly.

Ivy: "I... uh..."

You notice her eyes look swollen from crying.

->WhatsWrong
