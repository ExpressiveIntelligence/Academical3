@ -1,156 +0,2 @@
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


You nervously approach the podium. The room has filled up with what seems like the entire department - Professors, undergrads, grads, admins.

You go to the front of the room and speak for about 45 minutes. It starts off a little shaky, but you quickly get into the flow and feel confident by the end.

They seemed to enjoy your work. A few tough questions, but nothing you couldn't handle. It's a major relief after so many months of hard research and writing.

Afterward, while packing up your laptop, a line forms of people in the department to give their congratulations.

{ShowCharacter("Hendricks", "left", "")}
Hendricks: "Congratulations Bronislav! That was great - I'm so lucky to have such a great advisee!" 
{HideCharacter("Hendricks")}

{ShowCharacter("Brad", "left", "")}
Brad: "Awesome job up there! Our work together on this is paying off!"
{HideCharacter("Brad")}

{ShowCharacter("Ned", "left", "")}
Ned: "Heh, Brad seems excited about our work. I think this is all but guaranteed to get into the conference."
{HideCharacter("Ned")}

{ShowCharacter("Praveen", "left", "")}
Praveen: "Wow, great stuff! So many people involved - I hope I can one day match your networking skills!"
{HideCharacter("Praveen")}

{ShowCharacter("Ivy", "left", "")}
Ivy: "Such an impressive presentation. The department could use more of this! One of my mentees wanted to talk to you - keep an ear out!"
{HideCharacter("Ivy")}

<i>(You can learn more about any character using the "Characters" button at the top of the screen.)</i>

The room clears out. A final person approaches you nervously.

Jensen: "Bronislav, right? Nice to meet you. I'm Jensen." {ShowCharacter("Jensen", "left", "")}

{DbInsert("metJensen")}

He extends his hand for you to shake.

You've heard of Jensen before, but have never met him face-to-face. 

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

You write down his feedback in your notebook.

Jensen: "And hey, is there a chance of becoming a co-author on this paper? I think it's a really interesting topic and am looking into something similar. Maybe my feedback could be considered when editing?" 

Bronislav: "I'll have to see." 

He smiles happily, and walks off.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy
{DbInsert("Seen_BJ_INTRO")}
->DONE

=== BJIntro_MoreInfo ===
Bronislav: "Could you tell me a little more about what did confuse you, and how I could present my evidence better?"

Jensen explains his points. You zone out slightly, but remember to nod along to show you're listening.

Jensen: "And hey, is there a chance of becoming a co-author on this paper? I think it's a really interesting topic and am looking into something similar. Maybe my feedback could be considered when editing?" 

Bronislav: "um...I'll have to see." 

You write down his feedback in your notebook. He smiles happily, and walks off.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy
{DbInsert("Seen_BJ_INTRO")}
->DONE

=== BJIntro_not_interested_bronislav_jensen ===

Bronislav: "Sorry, I'm not interested in receiving feedback from other students."

Jensen: "Oh...ok. Um...is there a chance of becoming a co-author on this paper? I think it's a really interesting topic and am looking into something similar. Maybe my feedback could be considered when editing?" 

Bronislav: "I'll have to see." 

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy
{DbInsert("Seen_BJ_INTRO")}
->DONE

=== BJIntro_FirstTime ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "This has to be your first time at a meeting like this isn't it?"

You put the pen and notebook back away. 

Jensen: "Oh...uh yeah kinda. Well I did want to ask...is there a chance of becoming a co-author on this paper? I think it's a really interesting topic and am looking into something similar. Maybe my feedback could be considered when editing?" 

Bronislav: "I'll have to see." 

Jensen: "Ok!" 

He walks away.

{HideCharacter("Jensen")}

->BJIntro_mention_cafe_with_ivy
{DbInsert("Seen_BJ_INTRO")}
->DONE


=== BJIntro_mention_cafe_with_ivy ===

Bronislav: "Glad that's done."

You check the time on your phone. You promised to meet Professor Ivy for coffee later at the cafe, but you may have a little time for something else.

->BHS1_Hint->
{DbInsert("Seen_BJ_INTRO")}
-> DONE

