VAR hello = false
VAR apology = true

=== BI_S6_SceneStart ===
# ---
# choiceLabel: Check in with Ivy 
# hidden: true
# @query
# date.day!6
# @end
# repeatable: false
# tags: action, student_cubes, auxiliary
# ===

{ShowCharacter("Ivy", "left", "")}

As you walk over to the cubicles, you notice Ivy is here too.

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

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good: -> PositiveConsole
    - ivyOpinion >= OpinionState.Neutral: -> NeutralConsole
    - ivyOpinion <= OpinionState.Bad: -> BadConsole
} 

===PositiveConsole===
Bronislav: "What's wrong Ivy?"

Ivy sighs, and you can tell she is very upset.

Ivy: "I really screwed up. I never should have tried to leverage your situation for Jensen. It was my own stupid attempt to twist your arm into helping Jensen, and all of it was just wrong."

She shakes her hed sadly.

Ivy: "I took advantage of you, and for that I am truly sorry."

*["I appreciate your apology." #>> ChangeOpinion Ivy Bronislav ++]
->AppreciateYourApology

*["You should be sorry." #>> ChangeOpinion Ivy Bronislav --]
->YouShouldBe

*[Say nothing.]
->SayNothing

===NeutralConsole===
Bronislav: "What's wrong Ivy?"

Ivy sighs, and you can tell she is very upset.

Ivy: "I.. uh.. would like to apologize. I pressured you into helping Jensen because I so desperately wanted to help him. But, it was so wrong for me to put you in that type of situation, and I feel awful for it."

She shakes her head sadly.

Ivy: "I tried to leverage my knowledge of your situation and my connections to force you to help, and for that I am truly sorry."

*["I appreciate your apology." #>> ChangeOpinion Ivy Bronislav ++]
 ->AppreciateYourApology

*["You should be sorry." #>> ChangeOpinion Ivy Bronislav --]
 ->YouShouldBe

 *[Say nothing.]
 ->SayNothing

===BadConsole===
Bronislav: "What's wrong Ivy?"

Ivy glares at you, and you can tell your question has struck a nerve.

Ivy: "Don't act like you care all of a sudden."

She bites her lip, regreting her harshness.

Ivy: "Sorry, uh... Bronislav, I..."

She sighs as she gathers her thoughts.

Ivy: "Look, I want to apologize. I know we aren't close or anything, but that was no excuse to pressure you like I did to try and help Jensen. I used my knowledge of your situation and problems to try and help him, and it was so wrong. I feel awful about what I did, and I am truly sorry, for all of it."

*["I appreciate your apology." #>> ChangeOpinion Ivy Bronislav ++]
->AppreciateYourApology

*["You should be sorry." #>> ChangeOpinion Ivy Bronislav ---]
->YouShouldBe

*[Say nothing.]
 ->SayNothing

=== AppreciateYourApology ===
Bronislav: "I appreciate your apology."

You see some of the stress lift off of Ivy's shoulders.

Bronislav: "I know you were coming from a good place, and just trying to help your family. I can tell you feel guilty about everything."

Ivy: "I have no plans of doing it again, that's for certain."

You both smile breifly, before you nod and continue on your way.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_S6")}

->DONE

=== YouShouldBe ===
Bronislav: "You should be sorry."

The coldness in your voice catches Ivy off-guard.

Ivy: "I was apologizing Bronislav..."

Bronislav: "Well, maybe you should have thought about what would happen before you tried to pressure me like you did. You made me painfully conscious of my own struggles to get a job and find a sponsor for my visa, and I really can't accept any excuse for why you thought that was a reasonable thing to do."

Ivy stands up from her chair, hurt clouding her face.

Ivy: "I am sorry for everything, but you don't need to shove this in my face."

Ivy pushes past you and walks out of the room before you can say another word.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_S6")}

->DONE

=== SayNothing ===

You say nothing as you awkardly glance away from her.

Ivy: "Please wait...just hear me out."

*["I'm listening."]
->ImListening

*[Walk away. #>> ChangeOpinion Ivy Bronislav -]
->WalkAway


=== ImListening ===
Bronislav: "I'm listening."

Ivy fidgets in her chair, and you notice her eyes look swollen from crying.

->WhatsWrong


=== WalkAway ===
You turn and begin to walk away, which prompts Ivy to stand up and chase you.

Ivy: "Wait! Please, just hear me out."

You look back to find Ivy staring at the floor, her arms crossed as she shakes a bit.

->WhatsWrong

=== KeepWalking ===
Ivy: "Bronislav?"

*["Hey, how are you holding up?"]
->HoldingUp

*["Uh, hi Ivy."]
->UhHi

*[Say nothing.]
->SayNothing

=== HoldingUp ===
Bronislav: "Hey, how are you holding up?"

Ivy shuffles uncomfortablly.
-> BI_HoldingUp_Branches 

===BI_HoldingUp_Branches===
~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good: -> PositiveHoldUp
    - ivyOpinion >= OpinionState.Neutral: -> NeutralHoldUp
    - ivyOpinion <= OpinionState.Bad: -> BadHoldUp
} 

===PositiveHoldUp===
Ivy: "Terrible, if I'm honest. And I owe you a huge apology."

->WhatsWrong

===NeutralHoldUp===
//if neutral relationship
Ivy: "Not great. And I really have been meaning to talk to you."

->WhatsWrong

===BadHoldUp===
//if negative relationship
Ivy: "I'm fine."

Ivy sighs, staring at the floor.

Ivy: "But, there is something I need to get off my chest."

->WhatsWrong


=== UhHi ===
Bronislav: "Uh, hi Ivy."

You say quietly.

Ivy: "I... uh..."

You notice her eyes look swollen from crying.

->WhatsWrong
