=== BB_Socializing1_SceneStart ===
#---
# choiceLabel: Go to your cube.
#@query
# date.day!1
# @end
# repeatable: false
# tags: action, student_cubes
#===

// Summary: You meet Brad and he expresses stress for the IRB not getting back to him. If you are good enough relationship he tells you about his concern about Jensen

{ShowCharacter("Brad", "left", "")}

{DbInsert("Seen_BBS1")}

You go back to your cubicle and go over the presentation review with all of the feedback in mind.

You hear a knock at your cubicle wall.

Brad: "It's the IRB! Stop working on that paper right now!"

You see your friend, Brad.

Brad: "Just kidding!"

*["They let anyone in the IRB."]
->BB_S1_LetAnyoneIn

*["Hey Brad."]
->BB_S1_HeyBrad

*[Keep working.]
->BB_S1_KeepWorking

=== BB_S1_LetAnyoneIn ===
Bronislav: "Wow they really let anyone in the IRB nowadays, huh?"

Brad whistles.

Brad: "And they really let anyone submit a paper to us too! How's it going Bronny?"

*["Going good."]
->BB_S1_GoingGood

*["Alright."]
->BB_S1_Alright

*["Could have gone better."]
->BB_S1_CouldHaveBeenBetter

=== BB_S1_HeyBrad ===
Bronislav: "Hey Brad. It's been a while, how did the lab meeting go for you?"

Brad takes a chair and sits down in your cubicle.

Brad: "It went alright, I've been a bit stressed about the paper so I really only half absorbed the feedback we got."

*[Did something go wrong with our paper?]
->BB_S1_PaperExposition

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_KeepWorking ===
You just keep working.

Brad rolls his eyes and brings a chair into your cubicle.

Brad: "Always a hard worker, Bronislav. How was the lab meeting for you?"

*["Going good."]
->BB_S1_GoingGood
*["Fine." #>> DecrRelationshipStat Brad Bronislav Opinion 5]
->BB_S1_Fine
*["Could have gone better."]
->BB_S1_CouldHaveBeenBetter

=== BB_S1_GoingGood ===
Bronislav: "I'd say it went pretty well. Good to always get some fresh eyes on what I've been up to. How about you Brad?"

Brad shrugs.

Brad: "I mean it felt like it went fine, I've been a bit distracted recently. Pretty stressful."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_Alright ===
Bronislav: "It was alright, some helpful, some unhelpful. Did it go any better for you?"

Brad thinks on it for a moment.

Brad: "I'd say it went about the same for me. I've just been stressed recently, and I feel like that might have taken my attention away from it."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_CouldHaveBeenBetter ===
Bronislav: "It really could have gone better, not much to take note of personally. How about you? Get anything helpful out of it?"

Brad laughs.

Brad: "I also didn't get much out of it. To be fair, I've had something kind of stressing me recently so this whole thing was in the back of my mind."

*["Stressed about what?"]
->BB_S1_StressedAbtWhat

*["Sorry to hear." #>> ChangeOpinion Brad Bronislav +]
->BB_S1_SorryToHear

=== BB_S1_Fine ===
Bronislav: "Fine."

Brad raises an eyebrow.

Brad: "Went... well for me too... Sorry Bronislav, did I come in at a bad time?"

*["Just a bit stressed."]
->BB_S1_JustABitStressed

*["Could be better."]
->BB_S1_CouldBeBetter

=== BB_S1_StressedAbtWhat ===
Bronislav: "Oh? What's been stressing you out?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my survey. I feel like I'm really starting to fall behind, and I'm not sure what to do."

*["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*["They do take a bit."]
->BB_S1_TheyDoTakeABit

*["Stressed about that?" #>> DecrtRelationshipStatus Brad Bronislav 10]
->BB_S1_StressedAbtThat

==BB_S1_PaperExposition==
You and Brad have been working on a paper together for the past couple of weeks, but recently you've been so busy with other things that Brad has been the primary author. The survey is expected to receive IRB approval soon, but with deadlines approaching, it has been a source of stress for both of you. 

-> BB_S1_HeyBrad

=== BB_S1_SorryToHear ===
Bronislav: "I'm sorry to hear that Brad. What's going on?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my survey. I feel like I'm really starting to fall behind, and I'm not sure what to do."

*["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*["They do take a bit."]
->BB_S1_TheyDoTakeABit

=== BB_S1_JustABitStressed ===
Bronislav: "Sorry, I've just gotten a bit stressed."

Brad smiles.

Brad: "Yeah, tell me about it. The IRB is taking forever to approve my research and it's just been this looming cloud over me."

*["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*["They do take a bit."]
->BB_S1_TheyDoTakeABit

*["Stressed about that?" #>> DecrtRelationshipStatus Brad Bronislav 10]
->BB_S1_StressedAbtThat

=== BB_S1_CouldBeBetter ===
Bronislav: "There definitely was a better time, but it's really fine. What's up?"

He lets out a deep sigh.

Brad: "It's just... it feels like the IRB has been taking a long time to approve my research. I feel like I'm really starting to fall behind, and I'm not sure what to do."

*["Sounds stressful." #>> ChangeOpinion Brad Bronislav ++]
->BB_S1_SoundsStressful

*["They do take a bit."]
->BB_S1_TheyDoTakeABit

*["Stressed about that?" #>> DecrtRelationshipStatus Brad Bronislav 10]
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

*["Fair."]
->BB_S1_Fair

*["Whatever you say."]
->BB_S1_WhateverYouSay

=== BB_S1_OfCourse ===

Bronislav: "Of course Brad. Anytime."

Brad started packing up his things, but then looks back toward you.

Brad: "Hey Bronislav, I saw that you were talking with a person during the lab meeting. Johnson? Jeremy?"

*["Jensen?"]
->BB_S1_Jensen

=== BB_S1_GladICould ===
Bronislav: "Glad I could help with that Brad."

Brad smiles.

Brad: "I'm glad too. Oh! Also, I saw that you were talking with a person during the lab meeting. Johnson? Jeremy?"

*["Jensen?"]
->BB_S1_Jensen

=== BB_S1_HopeSoToo ===
~temp status = GetOpinionState("Brad", "Bronislav")
{status == OpinionState.Excellent || status == OpinionState.Good :
Bronislav: "I hope so too Brad."

Brad started packing up his things, but then looks back toward you.

Brad: "Hey Bronislav, I saw that you were talking with a person during the lab meeting. Johnson? Jeremy?"

*["Jensen?"]
->BB_S1_Jensen

- else:

Bronislav: "I hope so too Brad."

Brad starts packing up his things.

Brad: "Keep your fingers crossed they get back to me today. I've got to thead back home now, but thanks for talking with me. I'll hopefully have better news next time we talk."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck

}

=== BB_S1_Agreed ===
~temp status = GetOpinionState("Brad", "Bronislav")
{status == OpinionState.Excellent || status == OpinionState.Good :
Bronislav: "Agreed. Never soon enough."

Brad laughs while packing up his things, but then looks back toward you.

Brad: "Hey Bronislav, I saw that you were talking with a person during the lab meeting. Johnson? Jeremy?"

*["Jensen?"]
->BB_S1_Jensen

- else:

Bronislav: "Agreed. Never soon enough."

Brad laughs while packing up his things.

Brad: "Ain't that the truth. I've got to head out now, but thanks for talking with me. I'll hopefully have better news next time we talk."

*["See you later Brad."]
->BB_S1_SeeYouLaterBrad

*["Good luck."]
->BB_S1_GoodLuck

}

=== BB_S1_Fair ===
Bronislav: "Fair."

Brad awkwardly laughs packing up his things.

Brad: "Uhm... well I've got to go... See you Bronislav."

He leaves without another word.

{HideCharacter("Brad")}
->DONE

=== BB_S1_WhateverYouSay ===
Bronislav: "Whatever you say."

Brad looks very confused.

Brad: "Right..."

He starts packing up his things.

Brad: "I'll... see you later Bronislav. Bye."

He hastily leaves.

{HideCharacter("Brad")}
->DONE

=== BB_S1_Jensen ===
{DbInsert("BronBradJensenDiscussion")}
Bronislav: "Who? Jensen?"

Brad snaps his fingers.

Brad: "Right, Jensen. Something about him really sets off some alarms. I don't have anything direct, but he also talked with me and...well, I hope you're not considering putting him on this paper. He doesn't seem fit for something like this."

*["I wasn't planning on it."]
->BB_S1_WasntPlanningOnIt

*["He could be nervous."]
->BB_S1_CouldBeNervous

*["Pretty harsh."]
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
->DONE

=== BB_S1_GoodLuck ===
Bronislav: "Good luck Brad, hope you hear from them soon."

Brad gives a thumbs up and waves goodbye to you.

{HideCharacter("Brad")}
->DONE
