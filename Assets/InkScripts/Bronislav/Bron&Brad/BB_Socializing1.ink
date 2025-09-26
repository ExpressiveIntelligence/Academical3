=== BB_Socializing1_SceneStart ===
# ---
# choiceLabel: Go to your cube.
# @query
# date.day!1
# @end
# repeatable: false
# tags: action, student_cubes, required
# ===

// Summary: You meet Brad and he expresses stress for the IRB not getting back to him. If you are good enough relationship he tells you about his concern about Jensen

{ShowCharacter("Brad", "left", "")}



You go back to your cubicle and go over the presentation review with all of the feedback in mind.

You hear a knock at your cubicle wall.

Brad: "It's the IRB! Stop working on that paper right now!"

You see your friend, Brad.

Brad: "Just kidding!"

*["They let anyone in the IRB." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_LetAnyoneIn

*["Hey Brad."]
->BB_S1_HeyBrad

*[Keep working. #>> ChangeOpinion Brad Bronislav -]
->BB_S1_KeepWorking

=== BB_S1_LetAnyoneIn ===
Bronislav: "Wow they really let anyone in the IRB nowadays, huh?"

Brad whistles.

Brad: "And they really let anyone submit a conference paper too! How's it going Bronny?"

*["Going good."]
->BB_S1_GoingGood

*["Alright."]
->BB_S1_Alright

*["Could have gone better."]
->BB_S1_CouldHaveBeenBetter

=== BB_S1_HeyBrad ===
Bronislav: "Hey Brad!"

Brad takes a chair and sits down in your cubicle.

Brad: "Seems like the presentation went well!" 

Bronislav: "Yeah, just working on annotations right now. While I do this, could you look at the feedback notes and see what we need to fix?" 

Brad: "You got it!" 

Bronislav: "By the way, how's your paper with Ned going?" 

Brad: "It's alright, I've been pretty stressed so I really only half absorbed the feedback I got."

-> BB_S1_HeyBrad_Choices

= BB_S1_HeyBrad_Choices

*{not BB_S1_PaperExposition} [Did something go wrong with his paper?]
->BB_S1_PaperExposition -> BB_S1_HeyBrad_Choices

*{BB_S1_PaperExposition}["Stressed about what?"]
->BB_S1_StressedAbtWhat

*{BB_S1_PaperExposition}["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_KeepWorking ===
You just keep working.

Brad rolls his eyes and brings a chair into your cubicle.

Brad: "Always a hard worker, Bronislav. Seems like the presentation went well though!"

*["It went pretty well."]
->BB_S1_GoingGood
*["It was fine." #>> ChangeOpinion Brad Bronislav -]
->BB_S1_Fine
*["Could have gone better."]
->BB_S1_CouldHaveBeenBetter

=== BB_S1_GoingGood ===
Bronislav: "I'd say it went pretty well. Good to get some fresh eyes on what we've been up to. How about you? How's your paper with Ned going?"

Brad shrugs.

Brad: "I mean it's fine, I've been a bit distracted recently. Pretty stressful."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_Alright ===
Bronislav: "It was alright, some helpful, some unhelpful. At this rate, we should just take what we get." 

Brad: "Hey, anything helps!" 

Bronislav: "Yeah, I guess you're right. How's your paper with Ned going?"

Brad thinks on it for a moment.

Brad: "I'd say it's been ok. I've just been stressed recently, and I feel like that might have taken my attention away from it."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_CouldHaveBeenBetter ===
Bronislav: "It really could have gone better, not much to take note of personally."

Brad: "Well I'll look over the feedback to see what we can take from it." 

Bronislav: "Alright. Well, how's your paper with Ned going?" 

Brad laughs.

Brad: "Eh, it's going ok. To be fair, I've had something kind of stressing me recently so this whole thing was in the back of my mind."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_Fine ===
Bronislav: "Fine."

Brad raises an eyebrow.

Brad: "Well... my paper with Ned is also doing "fine" I guess... Sorry Bronislav, did I come in at a bad time?"

*["Just a bit stressed."]
->BB_S1_JustABitStressed

*["Could be better."]
->BB_S1_CouldBeBetter

=== BB_S1_StressedAbtWhat ===
Bronislav: "Oh? What's been stressing you out?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my survey. I feel like I'm really starting to fall behind, and I'm not sure what to do."

-> BB_S1_StressedAbtWhat_Choices

= BB_S1_StressedAbtWhat_Choices

*{not BB_S1_PaperExposition}[Did something go wrong with his survey?]
->BB_S1_PaperExposition -> BB_S1_StressedAbtWhat_Choices

*{BB_S1_PaperExposition}["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*{BB_S1_PaperExposition}["They do take a bit."]
->BB_S1_TheyDoTakeABit


*{BB_S1_PaperExposition}["Stressed about that?" #>> ChangeOpinion Brad Bronislav --]
->BB_S1_StressedAbtThat

==BB_S1_PaperExposition==
You and Brad have been working on a paper together for the past couple of weeks, but it seems like his paper with Ned has been taking his priority lately. 

In order to conduct a survey, Brad must first get IRB approval. The survey is expected to receive approval soon, but with deadlines approaching, it has been a source of stress for him. 

->->

=== BB_S1_SorryToHear ===
Bronislav: "I'm sorry to hear that Brad. What's going on?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my survey. I feel like I'm really starting to fall behind, and I'm not sure what to do."

-> BB_S1_SorryToHear_Choices

=BB_S1_SorryToHear_Choices

*{not BB_S1_PaperExposition}[Did something go wrong with his survey?]
->BB_S1_PaperExposition -> BB_S1_SorryToHear_Choices

*{BB_S1_PaperExposition}["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*{BB_S1_PaperExposition}["They do take a bit."]
->BB_S1_TheyDoTakeABit

=== BB_S1_JustABitStressed ===
Bronislav: "Sorry, I've just gotten a bit stressed."

Brad smiles.

Brad: "Yeah, tell me about it. The IRB is taking forever to approve my research and it's just been this looming cloud over me."

->BB_S1_JustABitStressed_Choices

=BB_S1_JustABitStressed_Choices

*{not BB_S1_PaperExposition}[Did something go wrong with his survey?]
->BB_S1_PaperExposition->BB_S1_JustABitStressed_Choices

*{BB_S1_PaperExposition}["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*{BB_S1_PaperExposition}["They do take a bit."]
->BB_S1_TheyDoTakeABit

*{BB_S1_PaperExposition}["Stressed about that?" #>> ChangeOpinion Brad Bronislav --]
->BB_S1_StressedAbtThat

=== BB_S1_CouldBeBetter ===
Bronislav: "There definitely was a better time, but it's really fine. What's up?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my research. I feel like I'm really starting to fall behind, and I'm not sure what to do." 

-> BB_S1_CouldBeBetter_Choices


=BB_S1_CouldBeBetter_Choices

*{not BB_S1_PaperExposition} [Did something go wrong with his survey?]
->BB_S1_PaperExposition -> BB_S1_CouldBeBetter_Choices

*{BB_S1_PaperExposition}["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*{BB_S1_PaperExposition}["They do take a bit."]
->BB_S1_TheyDoTakeABit

*{BB_S1_PaperExposition}["Stressed about that?" #>> ChangeOpinion Brad Bronislav --]
->BB_S1_StressedAbtThat

=== BB_S1_SoundsStressful ===
Bronislav: "Wait they still haven't? That sounds justified to me, I know I'd be stressed about it too. They'll get back to you soon Brad, I know they will."

Brad seems relieved.

Brad: "Ok, good to know. Thanks Bronislav, good to hear it from someone else."

*["Of course."]
->BB_S1_OfCourse

*["Glad I could help."]
->BB_S1_GladICould

=== BB_S1_TheyDoTakeABit ===
Bronislav: "Wow, I know that the IRB can take a while. It is crazy it's taken them this long, but they have to get back eventually."

Brad whistles.

Brad: "I mean I know that, just really wish they would speed it up. Let's hope it is soon."

*["Hope so too."]
->BB_S1_HopeSoToo

*["Agreed."]
->BB_S1_Agreed

=== BB_S1_StressedAbtThat ===
Bronislav: "You're stressed about that Brad? We both know how long the IRB can take, this shouldn't be a surprise."

Brad shuffles in his seat.

Brad: "I-I guess so, doesn't make it any less stressful though."

*["Fair."]->BB_S1_Fair

*["Whatever you say." #>> ChangeOpinion Brad Bronislav --]->BB_S1_WhateverYouSay

===BB_S1_Fair===
Bronislav: "Fair."

Brad awkwardly laughs packing up his things.

Brad: "Uhm... well I've got to go... See you Bronislav."

He prepares to leave. 

*["I'm sorry if I'm a bit short today" #>> ChangeOpinion Brad Bronislav +++]-> BB_S1_BadEnd
*[Let him leave] -> BB_S1_BadEnd

===BB_S1_WhateverYouSay ===
Bronislav: "Whatever you say."

Brad looks very confused.

Brad: "Right..."

He starts packing up his things.

Brad: "I'll... see you later Bronislav. Bye."

He hastily leaves.

*["I'm sorry if I'm a bit short today" #>> ChangeOpinion Brad Bronislav +++]-> BB_S1_BadEnd
*[Let him leave] -> BB_S1_LetHimLeave 

= BB_S1_LetHimLeave 

Brad leaves the cubicles. 
{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
->DONE

===BB_S1_BadEnd===
Brad: "Oh, it's alright. Seems like I caught you at a bad time. Let's chat when you're less...tired." 

*["You can just say 'less grouchy'"#>> ChangeOpinion Brad Bronislav ++] -> BB_S1_JokeEnd

*["Yeah...that will be nice" #>> ChangeOpinion Brad Bronislav +] -> BB_S1_OkEnd

*[Remain quiet #>> ChangeOpinion Brad Bronislav -] -> BB_S1_OkEnd 

=BB_S1_JokeEnd

Brad: "Is 'less grouchy Bronislav' real? I thought it was a myth!" 

Bronislav: "Oh shut it, don't you have somewhere to be?" 

You both share a quick laugh. 

Brad: "Alright, catch you later." 

{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
-> DONE 

=  BB_S1_OkEnd 

Brad: "Alright, see you later." 

{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
-> DONE

=== BB_S1_OfCourse ===

Bronislav: "Of course Brad. Anytime."

Brad started packing up his things, but then looks back toward you.

~temp r = GetOpinionState("Brad", "Bronislav")
{r >= OpinionState.Neutral: -> BB_S1_JensenGossip} 
{r <= OpinionState.Neutral: -> BB_S1_GoodByeOfc}


=BB_S1_GoodByeOfc

Brad: "Alright, I'll see you around!" 

Bronislav: "Bye!" 
{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
-> DONE

=== BB_S1_GladICould ===
Bronislav: "Glad I could help with that Brad."

Brad smiles.

~temp r = GetOpinionState("Brad", "Bronislav")
{r >= OpinionState.Neutral: -> BB_S1_JensenGossip} 
{r <= OpinionState.Neutral: -> BB_S1_GoodByeGlad}

=BB_S1_GoodByeGlad

Brad: "Alright, I'll see you around!" 

Bronislav: "Bye!" 
{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
-> DONE

=== BB_S1_HopeSoToo ===
Bronislav: "I hope so too Brad."

Brad started packing up his things, but then looks back toward you.

~temp r = GetOpinionState("Brad", "Bronislav")
{r >= OpinionState.Neutral: -> BB_S1_JensenGossip} 
{r <= OpinionState.Neutral: -> BB_S1_GoodbyeHope}

=BB_S1_GoodbyeHope

Brad: "Keep your fingers crossed they get back to me today. I've got to thead back home now, but thanks for talking with me. I'll hopefully have better news next time we talk."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck


=== BB_S1_Agreed ===
Bronislav: "Agreed. Never soon enough."

~temp r = GetOpinionState("Brad", "Bronislav")
{r > OpinionState.Neutral: -> BB_S1_JensenGossip} 
{r <= OpinionState.Neutral: -> BB_S1_GoodByeAgreed}

=BB_S1_GoodByeAgreed

Bronislav: "Agreed. Never soon enough."

Brad laughs while packing up his things.

Brad: "Ain't that the truth. I've got to head out now, but thanks for talking with me. I'll hopefully have better news next time we talk."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck




===BB_S1_JensenGossip===

Brad: "Hey Bronislav, I saw that you were talking with a person during the lab meeting. Johnson? Jeremy?"

*["Jensen?"]
->BB_S1_Jensen

=== BB_S1_Jensen ===
{DbInsert("BronBradJensenDiscussion")}
Bronislav: "Who? Jensen?"

Brad snaps his fingers.

Brad: "Right, Jensen. Something about him really sets off some alarms. I don't have anything direct, but he also talked with me and...well, I hope you're not considering putting him on this paper. He doesn't seem fit for something like this."

*["I wasn't planning on it." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_WasntPlanningOnIt

*["He could be nervous."]
->BB_S1_CouldBeNervous

*["Pretty harsh." #>> ChangeOpinion Brad Bronislav -]
->BB_S1_PrettyHarsh

=== BB_S1_WasntPlanningOnIt ===
Bronislav: "Trust me, I wasn't planning on having Jensen on the paper anyway. I think you're right, he's just out of his element."

Brad chuckles.

Brad: "You're a smart guy Bronislav. Great minds think alike."

He stands up out his chair.

Brad: "Well I've got to head out now, but it was nice to get assurance on this. Darn IRB."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck

=== BB_S1_CouldBeNervous ===
Bronislav: "He could've just been nervous. I see where you're coming from though."

Brad thinks for a moment.

Brad: "Yeah I suppose. It just felt like something more than that though. Stay safe out there Bronislav."

He stands up out his chair.

Brad: "Well I've got to head out now, but it was nice to get assurance on this. Darn IRB."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck

=== BB_S1_PrettyHarsh ===
Bronislav: "Pretty harsh don't you think Brad? You don't even know the guy, or have a great reason. We all start somewhere."

Brad thinks for a moment.

Brad: "That's fair, just warning you Bronislav. He really gives the wrong vibes for a project like this."

He stands up out his chair.

Brad: "Just think about it if he does approach you again Bronislav. I've got to head out, though. Take care Bronislav."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck

=== BB_S1_SeeYouLaterBrad ===
Bronislav: "I'll see you later Brad, talk soon!"

Brad waves goodbye and walks out.

{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
->DONE

=== BB_S1_GoodLuck ===
Bronislav: "Good luck Brad, hope you hear from them soon."

Brad gives a thumbs up and waves goodbye to you.

{HideCharacter("Brad")}
{DbInsert("Seen_BBS1")}
->DONE

