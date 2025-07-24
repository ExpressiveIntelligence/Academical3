/*

This file contains dialogue for the initial interaction
between Bronislav and Jensen. The player (Bronislav) presents
some of their research at a department seminar event. Afterward,
they are approached by an undergraduate student, Jensen, who is
eager to share their thoughts on Bronislav's work.

As Bronislav, you must chose how to approach this situation.

*/

=== BJIntro_bron_and_jen_intro ===
# ---
# choiceLabel: Give presentation
# @query
# not metJensen
# date.day!1
# @end
# repeatable: false
# tags: action, lecture_hall, required
# ===
# Summary: Jensen gives not so great feedback on your presentation

{UnlockAllLocations()}
{DbInsert("Seen_BJ_INTRO")}

Today you are presenting a practice paper talk at the weekly psychology department seminar.

You go to the front of the room and speak for about 45 minutes.

Surprisingly, your peers seemed to enjoy your work. A few tough questions, but nothing you couldn't handle.

Afterward, while packing up your laptop, someone approaches you, eager to talk.

Jensen: "Bronislav, right? Nice to meet you. I'm Jensen." {ShowCharacter("Jensen", "left", "")}

{DbInsert("metJensen")}

He extends his hand for you to shake.

*[Shake his hand.] Bronislav: "Nice to meet you too, Jensen."
    ->BJIntro_ShakeHand

=== BJIntro_ShakeHand ===
Jensen smiles.

Jensen: "I just wanted to talk to you about your presentation and some feedback I had for it."

He pulls out a small notebook.

*["Oh, fantastic."] You reluctantly pull out your own notebook.
    ->BJIntro_Notebook

=== BJIntro_Notebook ===
Jensen: "I liked how you presented your information for the first half, but I became really confused about halfway through."

Jensen: "I also thought that you could have presented your evidence better, and had a stronger conclusion."

*["Yes, of course." #>> ChangeOpinion Jensen Bronislav ++]
    ->BJIntro_WriteDown

*["Could you tell me a little more?"]
    ->BJIntro_MoreInfo

*["This has to be your first time at a meeting like this isn't it."#>> ChangeOpinion Jensen Bronislav --]
    ->BJIntro_FirstTime

=== BJIntro_WriteDown ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "Yes, of course. Thanks for letting me know."

You write down his feedback in your notebook. He smiles happily, and walks off.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy

->DONE

=== BJIntro_MoreInfo ===
Bronislav: "Could you tell me a little more about what did confuse you, and how I could present my evidence better?"

Jensen explains his points. You zone out slightly, but remember to nod along to show you're listening.

You write down his feedback in your notebook. He smiles happily, and walks off.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy

->DONE

=== BJIntro_not_interested_bronislav_jensen ===

Bronislav: "Sorry, I'm not interested in receiving feedback from other students."

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy

->DONE

=== BJIntro_FirstTime ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "This has to be your first time at a meeting like this isn't it?"

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy

->DONE


=== BJIntro_mention_cafe_with_ivy ===

Bronislav: "Glad that's done."

You check the time on your phone. You promised to meet Professor Ivy for coffee later at the cafe, but you may have a little time for something else.

->BHS1_Hint->

-> DONE
