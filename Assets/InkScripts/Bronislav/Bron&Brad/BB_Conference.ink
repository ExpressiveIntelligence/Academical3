VAR withdrew = false

=== BB_Conference_SceneStart ===
# ---
# choiceLabel: Go to a talk.
# @query
# date.day!5
# @end
# repeatable: false
# tags: action, lecture_hall, auxiliary
# Summary: Brad discusses rejected paper/confronted about IRB stuff w/ Ned, talks to Bronislav about Jensen being on paper



~withdrew = DbAssert("BradWithdrawsData")

~temp r = GetOpinionState("Brad", "Bronislav")
{r >= OpinionState.Neutral: -> HappyBrad} 
{r <= OpinionState.Neutral: -> UpsetBrad} 

==HappyBrad==

{withdrew: -> withdraw}
{not withdrew: ->notWithdraw}

=withdraw
You sit down and watch an interesting talk. It finishes and you get up to go talk to other people. To your surprise, you see Brad there. He also notices you and walks up.

{ShowCharacter("Brad", "left", "")}
Brad: "Bronislav! Just the guy I wanted to see."

*["You withdrew right?" #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_YouWithdrewRight

*["Brad, why are you here?" #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_WhyAreYouHere

*["You didn't withdraw, did you?" #>>ChangeOpinion Brad Bronislav -]
->BB_Conference_DidntWithdraw


=notWithdraw 
After the talk, you roam around to chat with other people, and are surprised to see Brad there. You don't see Ned with him and he awkwardly glances at you, takes a deep breath and slowly approaches you.

{ShowCharacter("Brad", "left", "")}
Brad: "Hey Bronislav..."

*["You withdrew right?"]
->BB_Conference_YouWithdrewRightBad

*["Brad, why are you here?"]
->BB_Conference_WhyAreYouHereBad

*["You didn't withdraw, did you?" #>>ChangeOpinion Brad Bronislav +]
->BB_Conference_DidntWithdrawBad

==UpsetBrad==

{withdrew: -> withdraw}
{not withdrew: ->notWithdraw}

//{HappyBrad && !withdrew: //didnt tell him, good relationship

=withdraw
After the talk you chat with some other people. You see Brad, but no Ned, and he approaches you deafeatedly.

{ShowCharacter("Brad", "left", "")}
Brad: "I have some bad news Bronislav."

*["Did you withdraw?"]
->BB_Conference_DidYouWithdraw

*["Did something go wrong?"]
->BB_Conference_DidSomethingGoWrong

*["It got rejected?"]
->BB_Conference_ItGotRejected


= notWithdraw
After the talk you chat with some other people. You see Brad, but no Ned. He walks up to you.

{ShowCharacter("Brad", "left", "")}

Brad: "Well, it happened Bronislav."

*["What happened?"]
->BB_Conference_WhatHappened

*["Did you withdraw?"]
->BB_Conference_DidYouWithdraw

*["It got rejected?"]
->BB_Conference_ItGotRejected



=== BB_Conference_YouWithdrewRight ===
Bronislav: "You withdrew the paper, right Brad?"

Brad sarcastically rolls his eyes.

Brad: "Well good to see you too." 

Brad: "But yes, I did! It was, not an easy conversation to have with Ned, but he and I both realized that it was our best option. No hassle with the IRB, and everything is still in tact."

*["That's great to hear!" #>>ChangeOpinion Brad Bronislav +]
->BB_Conference_GreatToHear

*["Ned isn't mad?"]
->BB_Conference_NedIsntMad

*["You came to your senses." #>>ChangeOpinion Brad Bronislav -]
->BB_Conference_CametoYourSenses

=== BB_Conference_WhyAreYouHere ===
Bronislav: "Brad, why are you here? I thought you were going to withdraw."

Brad sarcastically rolls his eyes.

Brad: "Well good to see you too." 

Brad: "I did. I'm just here because I wanted to catch you and tell you thanks. Obviously Ned was a bit mad at first, but he's glad that I told him. So, no more worries!"

*["That's great to hear!" #>>ChangeOpinion Brad Bronislav +]
->BB_Conference_GreatToHear

*["Ned isn't mad now?"]
->BB_Conference_NedIsntMad

*["You came to your senses."]
->BB_Conference_CametoYourSenses

=== BB_Conference_DidntWithdraw ===
Bronislav: "You didn't withdraw, did you Brad?"

Brad rolls his eyes.

Brad: "I did this time Bronislav, seriously. I talked with Ned and he okayed it too. He definitely wasn't happy with me, but he knew it was the right thing to do. So, thanks for leading me in the right direction Bronislav."

*["Ned isn't mad now?"]
->BB_Conference_NedIsntMad

*["You came to your senses."]
->BB_Conference_CametoYourSenses

=== BB_Conference_YouWithdrewRightBad ===
Bronislav: "You withdrew the paper, right Brad?"

Brad struggles to speak for a moment.

BradL "I... I didn't withdraw the paper Bronislav. Somehow the IRB found out and the paper has been rejected. Ned is furious with me, and now I've got ethics trainings I've got to go to."

*["I'm sorry to hear that."  #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_SorrytoHear


*["You should have listened."  #>>ChangeOpinion Brad Bronislav --]
->BB_Conference_YouShouldhaveListened

*["That was really dumb."  #>>ChangeOpinion Brad Bronislav ---]
->BB_Conference_ThatWasDumb

=== BB_Conference_WhyAreYouHereBad ===
Bronislav: "Brad, why are you here? I thought you were going to withdraw."

Brad scratches his head.

Brad: "I kind of thought I would too. Something in me told me not to and now the IRB rejected the paper, Ned is angry with me, and I've got ethics trainings to go to."


*["You should have listened."]
->BB_Conference_YouShouldhaveListened

*["That was really dumb."  #>>ChangeOpinion Brad Bronislav ---]
->BB_Conference_ThatWasDumb

=== BB_Conference_DidntWithdrawBad ===
Bronislav: "You didn't withdraw, did you Brad?"

Brad looks at the ground.

Brad: "No, I didn't. You were right all along, the IRB rejected the paper, Ned doesn't want to talk with me, and now I have ethics trainings on my plate."


*["You should have listened."]
->BB_Conference_YouShouldhaveListened

*["That was really dumb."  #>>ChangeOpinion Brad Bronislav --]
->BB_Conference_ThatWasDumb

=== BB_Conference_DidYouWithdraw ===
Bronislav: "Did you withdraw the paper Brad?"

Brad shakes his head.

Brad: "No I didn't, I swear! I thought this plan would work but somehow the IRB found out and now the paper is rejected, Ned is furious with me, and I've got ethics trainings to go to."

*["I'm sorry to hear that."  #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_SorrytoHear


*["Should have expected that." #>>ChangeOpinion Brad Bronislav --]
->BB_Conference_ShouldHaveExpected

=== BB_Conference_DidSomethingGoWrong ===
Bronislav: "Did something go wrong?"

Brad grimaces.

Brad: "It all went very wrong Bronislav. The IRB rejected the paper because of my data, Ned is angry with me, and I've got ethics trainings to go to."

*["I'm sorry to hear that."  #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_SorrytoHear


*["Should have expected that." #>>ChangeOpinion Brad Bronislav --]
->BB_Conference_ShouldHaveExpected

=== BB_Conference_ItGotRejected ===
Bronislav: "It got rejected?"

Brad looks surprised.

Brad: "It did! I thought it would be ok, I really did. First, the IRB rejected the paper, Ned finds out it is because of my data and now he doesn't want to talk with me, and I've got to fit in ethics trainings into my schedule now."

*["I'm sorry to hear that."  #>>ChangeOpinion Brad Bronislav ++]
->BB_Conference_SorrytoHear


*["Should have expected that." #>>ChangeOpinion Brad Bronislav --]
->BB_Conference_ShouldHaveExpected

=== BB_Conference_WhatHappened ===
Bronislav: "What do you mean? What happened?"

Brad looks shocked that you don't know.

Brad: "The IRB found out Bronislav! They rejected the paper, and now Ned isn't talking to me because I told him about using the data. Now I've also got to go to ethics trainings because of this."


*["Should have expected that." #>>ChangeOpinion Brad Bronislav -]
->BB_Conference_ShouldHaveExpected

=== BB_Conference_GreatToHear ===
Bronislav: "That's great to hear Brad! I know it was a tough decision to make, but you made the right choice."

Brad is overjoyed.

Brad: "I wouldn't have done it without you Bronislav. Thanks for guiding me in the right direction."

*["Glad things worked out."]
->BB_Conference_GladThingsWokedOut

*["Don't mention it."]
->BB_Conference_DontMentionIt

=== BB_Conference_NedIsntMad ===
Bronislav: "Ned isn't mad?"

Brad shrugs.

Brad: "I mean, reasonably I think, he was pretty mad initially. After he took some time to cool down though he seems to be fine now, and appreciated me telling him about it."

*["Glad things worked out."]
->BB_Conference_GladThingsWokedOut

*["What now?"]
->BB_Conference_WhatNow

=== BB_Conference_CametoYourSenses ===
Bronislav: "You came to your senses. It's about time."

Brad awkwardly laughs.

Brad: "Yeah I guess I did. Thanks again Bronislav for, I guess, bringing me to my senses."

*["Glad things worked out."]
->BB_Conference_GladThingsWokedOut

*["Anytime."]
->BB_Conference_Anytime

=== BB_Conference_SorrytoHear ===
Bronislav: "I'm sorry to hear that Brad. I really thought it would work too. I should've told you to withdraw."

Brad sighs.

Brad: "It's not your fault Bronislav. I really should have known I was doing something wrong and withdrew my paper because of it."

*["Wish you the best."]
->BB_Conference_WishYouTheBest

*["Good luck."]
->BB_Conference_GoodLuck

=== BB_Conference_YouShouldhaveListened ===
Bronislav: "You really should have listened when I told you to withdraw the paper Brad."

Brad grumbles.

Brad: "Yeah yeah yeah. You were right Bronislav, I know, but I just really thought it would all be ok. It's whatever now."

*["Good luck."]
->BB_Conference_GoodLuck

*["Whatever you say." #>> ChangeOpinion Brad Bronislav --]
->BB_Conference_WhateverYouSay

=== BB_Conference_ThatWasDumb ===
Bronislav: "That was really dumb Brad."

Brad scoffs.

Brad: "You really think I don't know that Bronislav? I know that I messed everything up, you don't need to patronize me."

*["Sorry."]
->BB_Conference_Sorry

*["Whatever you say." #>> ChangeOpinion Brad Bronislav --]
->BB_Conference_WhateverYouSay

=== BB_Conference_ShouldHaveExpected ===
Bronislav: "This really is something I should have expected. It was always going to happen."

Brad looks at you confused.

Brad: "What? Bronislav, if it was always going to happen why didn't you tell me? Are you serious?"

*["I thought about it." #>> ChangeOpinion Brad Bronislav -]
->BB_Conference_ThoughtAbtIt

*["It's in the past now."]
->BB_Conference_InThePast

=== BB_Conference_GladThingsWokedOut ===
Bronislav: "I'm just really glad that things worked out in their own way, even if it definitely wasn't the best in the end."

Brad nods.

Bronislav: "Not the best outcome, but it could've gone way worse. I've got to head out now, but just wanted to let you know about everything going on. Thanks!"

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_DontMentionIt ===
Bronislav: "Don't mention it, Brad. Wish your paper went in a better direction, but glad to help where I could."

Brad nods.

Brad: "Definitely in the same boat, but it's just how it goes. I'll see you later Bronislav, sorry to catch you off guard here at the conference."

Bronislav: "No worries Brad, take care."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_WhatNow ===
Bronislav: "So, what now Brad? I'm curious."

Brad thinks for a bit.

Brad: "I'm... not really sure. I think, I just need to get some rest asap. With that being said, I'll see you later Bronislav."

Bronislav: "Rest well Brad."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_Anytime ===
Bronislav: "Anytime! Happy to help."

Brad: "Yeah, thanks."

Brad says and starts ot pack up to leave.

Brad: "I've got somewhere to be now, I'll talk to you later then."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_WishYouTheBest ===
Bronislav: "I wish you the best Brad. I've got to head out now."

Brad: "I should just head home too, hope to see you later."

Brad says as he waves goodbye.

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_GoodLuck ===
Bronislav: "Good luck on your future endeavours Brad. Hope they go better."

Brad: "Me too Bronislav, me too."

Brad says as he stands up.

Brad: "Well, I'm going to head home now but thanks for talking. See you."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_WhateverYouSay ===
Bronislav: "Whatever you say, Brad."

Brad turns his head.

Brad: "What? Ok. Bronislav, I get it. I'll just leave then. Thanks for nothing."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_Sorry ===
Bronislav: "I'm sorry Brad, I should've said it differently. Sad things couldn't work out."

"It's fine." Brad says. "I'm going to head home now, but I'll probably talk to you later."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_ThoughtAbtIt ===
Bronislav: "I thought about it recently, but I would've told you if I thought it was really going to happen."

Brad groans. "Well, it did actually happen Bronislav. Thanks for not telling me."
He silently packs his things up and leaves the conference hall.

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE

=== BB_Conference_InThePast ===

Bronislav: "It's in the past now anyway Brad. No need to dwell on it."

Brad seems to begrugingly agree.

Brad: "Yeah, I guess that's true. Maybe talk with you later Bronislav, see you later."

{HideCharacter("Brad")}
{DbInsert("Seen_BB_Conference")}
->DONE


