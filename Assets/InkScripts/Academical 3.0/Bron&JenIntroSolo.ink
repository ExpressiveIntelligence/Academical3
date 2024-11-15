/*

This file contains dialogue for the initial interaction
between Bronislav and Jensen. The player (Bronislav) presents
some of their research at a department seminar event. Afterward,
they are approached by an undergraduate student, Jensen, who is
eager to share their thoughts on Bronislav's work.

As Bronislav, you must chose how to approach this situation.

*/

=== action_selection_tutorial ===

Today you have to give a presentation to the department.

Select the "Choose Action" button in the interaction bar to see what actions are available at your current location.

-> DONE

=== bron_and_jen_intro ===
# ---
# choiceLabel: Give presentation
# @query
# not metJensen
# @end
# repeatable: false
# tags: action, lecture_hall, required
# ===

Today you have the honor of presenting a practice paper talk at the weekly department seminar.

You go to the front of the room and speak for about 45 minutes.

Surprisingly, the audience seemed to enjoy your work. A few tough questions, but nothing you couldn't handle.

Afterward, while packing up your laptop, a student approaches you, eager to talk.

Jensen: "Bronislav, right? Nice to meet you. I'm Jensen." {ShowCharacter("Jensen", "left", "")}

{DbInsert("metJensen")}

He extends his hand for you to shake.

*[Shake his hand.] Bronislav: "Nice to meet you too, Jensen."

->ShakeHand

=== ShakeHand ===
Jensen smiles.

Jensen: "I just wanted to talk to you about your presentation and some feedback I had for it."

He pulls out a small notebook.

// The line below has emotional nuance that isn't being captured in Bronislav's actions
// Clearly he's not pleased about the prospect of feedback. Do we need to describe his internal
// thought process while pullout out the notebook
*["Oh, fantastic."] You reluctantly pull out your own notebook.

->Notebook

=== Notebook ===
Jensen: "I liked how you presented your information for the first half, but I became really confused about halfway through."

Jensen: "I also thought that you could have presented your evidence better, and had a stronger conclusion."

He looks at you expecting.

*["Yes, of course." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50 ]
->WriteDown

*["Could you tell me a little more?"]
->MoreInfo

*["I'm not interested." #>> DecrRelationshipStat Jensen Bronislav Opinion -50 ]
->not_interested_bronislav_jensen

=== WriteDown ===
Bronislav: "Yes, of course. Thanks for letting me know."

You write down his feedback in your notebook. He smiles happily, and walks off.

{HideCharacter("Jensen")}

->mention_cafe_with_ivy

->DONE

=== MoreInfo ===
Bronislav: "Could you tell me a little more about what did confuse you, and how I could present my evidence better?"

Jensen explains his points. You zone out slightly, but remember to nod along to show you're listening.

You write down his feedback in your notebook. He smiles happily, and walks off.

{HideCharacter("Jensen")}

->mention_cafe_with_ivy

->DONE

=== not_interested_bronislav_jensen ===

Bronislav: "Sorry, I'm not interested in receiving feedback from other students."

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

{HideCharacter("Jensen")}

->mention_cafe_with_ivy

->DONE

=== FirstTime ===
// Jensen is ashamed
Bronislav: "This has to be your first time at a meeting like this isn't it?"

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

{HideCharacter("Jensen")}

->mention_cafe_with_ivy

->DONE


=== mention_cafe_with_ivy ===

Bronislav: Glad that's done. I should head over to the cafe to meet Ivy.

-> DONE
