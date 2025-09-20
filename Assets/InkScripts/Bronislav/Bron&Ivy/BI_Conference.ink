@ -1,754 +0,0 @@

// Ivy Conference
// [MANDATORY] Ivy:
// Recommends or rejects Bronislav
// Reflection of decisions up to this point
// Questioning if what he did was right/wrong

VAR BlowUp = false 
VAR BI_C_negativeNelly = false

// NOTE: CURRENT DEFAULT IS BRONISLAV WAS RECEPTIVE OF IVY'S DEAL (positive relationship)
// TODO: Add decisions based on whether or not you accepted Ivy's deal, relationship status
=== BI_Conference_SceneStart ===
# ---
# choiceLabel: Chat with Ivy
# hidden: true
# @query
# date.day!5
# @end
# repeatable: false
# tags: action, lecture_hall, required
# ===
#Summary: You confront Ivy at the conference and exchange apologies 

~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

~SwitchingOpinionsReject = DbAssert("BI_SwitchingOpinions_Reject")

~SwitchingOpinionsAccept = DbAssert("BI_SwitchingOpinions_Accept")

~BlowUp = DbAssert ("BI_Blowup")

You notice Ivy and decide to approach her.
{ShowCharacter("Ivy", "left", "")}
-> BI_Conference_Branches

===BI_Conference_Branches===
{IvyAcceptedOfficial: -> dealAccepted} 
{IvyDeniedOfficial: -> dealDenied} 
{BlowUp: -> IvyIgnore} 

->dealAccepted 

===IvyIgnore===
You make eye contact and wave, but she does not reciprocate. 

Even as you approach her, she turns her back towards you as though you're not even there. 

Maybe it's best to leave her alone. 

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
-> DONE

===dealAccepted===
~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> goodAccept} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> goodAccept} 
{ivyOpinion < OpinionState.Neutral: -> badAccept} 

=goodAccept
Ivy: "Hey Bronislav! Enjoying the conference so far?"

*["Yeah I am."]
->BI_C_YeahIAm

*["It's been alright."]

->BI_C_ItsBeenAlright

*["Ehhh..."  #>> ChangeOpinion Ivy Bronislav -]

->BI_C_Ehhh

=badAccept
//neutral or negative relationship

Ivy: "Oh, hi Bronislav. Wasn't expecting to run into you here."

*["Neither was I."]
->BI_C_NeitherWasI

*["Good to see you too, Ivy." #>> ChangeOpinion Ivy Bronislav +]
->BI_C_GoodToSeeYouTooIvy

*["Have you talked to the firm yet?"  #>> ChangeOpinion Ivy Bronislav -]
->BI_C_HaveYouTalked

===dealDenied===
~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{ivyOpinion >= OpinionState.Good: -> goodDenied} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> goodDenied} 
{ivyOpinion < OpinionState.Neutral: -> badDenied} 

=goodDenied
// if you didn't accept Ivy's Deal
// positive relationship

Ivy: "Oh, uh, hey Bronislav. How's the conference treating you?"

*["It's been good, actually."]
->BI_C_ItsBeenGood

*["It's all been pretty standard."]
->BI_C_PrettyStandard

*["It's been pretty slow honestly." #>> ChangeOpinion Ivy Bronislav -]
->BI_C_Slow

= badDenied

// neutral or negative relationship
Ivy: "Um, hi Bronislav. Is there a reason you came over here?"

*["I wanted to say hi."  #>> ChangeOpinion Ivy Bronislav +]
->BI_C_WantedToSayHi

*["How are you doing?"  #>> ChangeOpinion Ivy Bronislav +]
->BI_C_HowAreYouDoing

*["You know, I wish I hadn't."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishIHadnt

=== BI_C_YeahIAm ===
Bronislav: "Yeah, I am so far, there's been some good talks that I've enjoyed for sure."

Ivy: "Glad to hear it! I have been trying to absorb everything myself, there's a lot of good presentations this year."

Bronislav: "Do you have a favorite so far?"

Ivy: "Actually, I'd need to think about that more, I'll get back to you on that."

Ivy smiles as she remembers something.

Ivy: "Speaking of getting back to you, I talked to the firm for you."

Bronislav: "Did you? How'd it go?"

Ivy: "They said they would love to have someone of your talent for the position, and they would be more than happy to sponsor your visa."

*["That's amazing."]
->BI_C_ThatsAmazing

*["Wait, seriously?"]
->BI_C_Seriously

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt


=== BI_C_ItsBeenAlright ===
Bronislav: "Oh, it's been alright so far. Some of it has been pretty trivial, but there's also some good presentations too."

Ivy: "Hmmm... maybe you've been checking out the wrong things, because everything I have been going to has been super interesting."

Ivy smiles as she remembers something.

Ivy: "Actually, I was going to tell you, I talked to the firm."

Bronislav: "Did you? How'd it go?"

Ivy: "They said they would love to have someone of your talent for the position, and they would be more than happy to sponsor your visa."

*["That's amazing."]
->BI_C_ThatsAmazing

*["Wait, seriously?"]
->BI_C_Seriously

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt


=== BI_C_Ehhh ===
~ BI_C_negativeNelly = true
Bronislav: "Ehhh... this all been pretty boring and pretty standard. I'm surprised some of these people decided their work was presentation worthy."

Ivy: "Ouch, pretentious much."

Ivy rolls her eyes at you.

Ivy: "I, believe it or not, have been enjoying this conference."

Bronislav: "Could have fooled me. You looked bored out of your mind, hence why I thought I'd come over for a chat."

Ivy shakes her head at you.

Ivy: "You're lucky I think you're a good student, Bronislav."

Ivy suddenly smiles as she remembers something.

Ivy: "Actually, I was going to tell you, I talked to the firm."

Bronislav: "Did you? How'd it go?"

Ivy: "They said they would love to have someone of your talent for the position, and they would be more than happy to sponsor your visa."

*["That's amazing."]
->BI_C_ThatsAmazing

*["Wait, seriously?"]
->BI_C_Seriously

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt


=== BI_C_NeitherWasI ===
Bronislav: "I wasn't exactly planning on running into you either, but here we are."

Ivy: "Mhm."

She grows quiet, before she appears to remember something.

Ivy: "You know, I actually did talk to the firm for you."

Bronislav: "Did you? How'd it go?"

Ivy: "They said they would definitely be willing to consider someone of your skill for the position. While sponsoring your visa defintiely is a complication to the whole process, they are still willing to go through with it."

*["That's great!" #>> ChangeOpinion Ivy Bronislav ++++]
->BI_C_ThatsGreat

*["Is there something else I could do to improve his opinion of me?"]
->BI_C_SomethingElse

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt

=== BI_C_GoodToSeeYouTooIvy ===
Bronislav: "Good to see you too, Ivy. I almost thought you didn't want to talk to me."

Ivy looks like she feels guilty for her inital greeting.

Ivy: "Uh, sorry Bronislav, I guess I just didn't know what to expect with you just coming over to talk all of a sudden."

Bronislav: "Is it so bad if I just want to say hi, especially to someone who's doing me a favor?"

Ivy: "No, I guess not."

She sighs and grows quiet, before she appears to remember something.

Ivy: "You know, I actually did talk to the firm for you."

Bronislav: "Did you? How'd it go?"

Ivy: "They said they would definitely be willing to consider someone of your skill for the position. While sponsoring your visa defintiely is a complication to the whole process, they are still willing to go through with it."

*["That's great!" #>> ChangeOpinion Ivy Bronislav ++++]
->BI_C_ThatsGreat

*["Is there something else I could do to improve his opinion of me?"]
->BI_C_SomethingElse

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt

=== BI_C_HaveYouTalked ===
Bronislav: "Have you talked to the firm yet?"

Ivy looks annoyed.

Ivy: "Wow, I should have expected as much. Straight for the buisness as always, not even a hello."

Bronislav: "Well, did you?"

Ivy sighs. You are definitely trying her patience.

Ivy: "As a matter of a fact, I did."

Bronislav: "You did? What did they say?"

Ivy: "They said they would definitely be willing to consider someone of your skill for the position. While sponsoring your visa defintiely is a complication to the whole process, they are still willing to go through with it."

*["That's great!" #>> ChangeOpinion Ivy Bronislav +]
->BI_C_ThatsGreat

*["Is there something else I could do to improve his opinion of me?"]
->BI_C_SomethingElse

*["I kind of wish you hadn't gone through with it."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_WishYouHadnt


=== BI_C_ItsBeenGood ===
Bronislav: "It's been good actually, I have really been enjoying everything so far. There's definitely been some good talks that I've enjoyed."

Ivy: "Glad to hear it! I have been trying to absorb everything myself, there's a lot of good presentations this year."

Bronislav: "Do you have a favorite so far?"

Ivy: "Actually, I'd need to think about that more, I'll get back to you on that."

Bronislav: "Alright then."

As you stand near Ivy, your mind keeps wandering back to the deal. While it surprised you that she was so adamant on you taking it, you genuinely hope that all of this hasn't messed too much of her perception of you. You aren't sure if you should even bring it up.

// TODO: did the player do optional dialogue in socalizing 4
// THIS DIALOUGE ASSUMES IT DIDN'T HAPPEN


*["How are you holding up?" #>> ChangeOpinion Ivy Bronislav +]
->BI_C_HoldingUp

*[Don't bring it up. #>> ChangeOpinion Ivy Bronislav -]
->BI_C_DontBringUp

=== BI_C_PrettyStandard ===
Bronislav: "It's been pretty standard so far. There's been some good presentations, but most of the things here are not all that interesting or new."

Ivy: "Hmmm... maybe you've been checking out the wrong things, because everything I have been going to has been super interesting."

Bronislav: "Yeah, maybe."

As you stand near Ivy, your mind keeps wandering back to the deal. While it surprised you that she was so adamant on you taking it, you genuinely hope that all of this hasn't messed too much of her perception of you. You aren't sure if you should even bring it up.

// TODO: did the player do optional dialogue in socalizing 4
// THIS DIALOUGE ASSUMES IT DIDN'T HAPPEN


*["How are you holding up?" #>> ChangeOpinion Ivy Bronislav +]
->BI_C_HoldingUp

*[Don't bring it up. #>> ChangeOpinion Ivy Bronislav -]
->BI_C_DontBringUp

=== BI_C_Slow ===
Bronislav: "It's all been pretty slow honestly. I guess I set my expectations too high after doing my own research, but I can't say I've seen a single novel thing today."

Ivy: "Ouch, pretentious much."

Ivy rolls her eyes at you.

Ivy: "I, believe it or not, have been enjoying this conference."

Bronislav: "Could have fooled me. You looked bored out of your mind, hence why I thought I'd come over for a chat."

Ivy shakes her head at you.

Ivy: "You're lucky I think you're a good student, Bronislav."

As you stand near Ivy, your mind keeps wandering back to the deal. While it surprised you that she was so adamant on you taking it, you genuinely hope that all of this hasn't messed too much of her perception of you. You aren't sure if you should even bring it up.


*["How are you holding up?" #>> ChangeOpinion Ivy Bronislav +]
->BI_C_HoldingUp

*[Don't bring it up. #>> ChangeOpinion Ivy Bronislav -]
->BI_C_DontBringUp


=== BI_C_WantedToSayHi ===
Bronislav: "Is it a crime to just want to say hello now?"

Ivy: "No, I guess not. It's just... you seem like you don't like me very much, and maybe you have reason to, but yeah, that's why I'm surprised you even want to talk."

*["I don't have a problem with you as a person Ivy." #>> ChangeOpinion Ivy Bronislav ++]
->BI_C_NoProblemWithYou

*["I'm sorry if I came off that way, but I would like an apology." #>> ChangeOpinion Ivy Bronislav +]
->BI_C_ApologyNotHate

*["You're not wrong, but I was trying to be polite."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_YoureNotWrong

=== BI_C_HowAreYouDoing ===
Bronislav: "How are you doing?"

Ivy: "I guess about as good as you would expect, given everything. I came here to focus on the conference, but clearly everything I tried with the whole deal is still on your mind. Otherwise why would you want to talk with me, right?"

Ivy: "You clearly didn't like me very much before, but maybe you had a good reason to. Why would that be any different now?"

*["I don't have a problem with you as a person Ivy." #>> ChangeOpinion Ivy Bronislav ++]
->BI_C_NoProblemWithYou

*["I'm sorry if I came off that way, but I would like an apology." #>> ChangeOpinion Ivy Bronislav +]
->BI_C_ApologyNotHate

*["You're not wrong, but I was trying to be polite."  #>> ChangeOpinion Ivy Bronislav --]
->BI_C_YoureNotWrong

=== BI_C_WishIHadnt ===

Bronislav: "You know, now I really wish I hadn't."

Ivy: "Okay Bronislav. You know I really didn't want to do this in a professional setting but clearly you are not going to let this go." 

Ivy: "I don't know what I did to make you hate me, but I apologize for even bringing the deal up to you in the first place because clearly you don't care about other people or their feelings."

*["I don't have a problem with you as a person Ivy." #>> ChangeOpinion Ivy Bronislav ++]
->BI_C_NoProblemWithYou

*["I'm sorry if I came off that way, but I would like an apology." #>> ChangeOpinion Ivy Bronislav +]
->BI_C_ApologyNotHate

*["And you clearly don't care about integrity." #>> ChangeOpinion Ivy Bronislav ----]
->BI_C_Integrity


=== BI_C_ThatsAmazing ===
Bronislav: "That's amazing Ivy, thank you so much!"
{BI_C_negativeNelly == false :
Ivy: "Of course, it's the least I can do."
- else:
Ivy: "And that was all it took for you to stop whining."
}
Bronislav: "No, seriously Ivy, this means so much to me."

Ivy: "What can I say, they were very impressed with you."

You shake your head, trying to process what that means for you and your career. You feel as if a weight is being lifted off of your shoulders. All your concerns about finding a sponsor for your visa, staying in this country, all of them are being solved, right now, by this confirmation.

Ivy: "I'm so glad I could help you out like this Bronislav."

->BI_C_DealOutro

=== BI_C_Seriously ===
Bronislav: "Wait, seriously? What did you say?"
{BI_C_negativeNelly == false :
Ivy: "I told them about your research, and they were impressed with the breadth of it."
- else:
Ivy: "I told them that you are super pretentious and like to hate on everyone else's work."

You give Ivy an annoyed glare which causes her to giggle.

Ivy: "Okay, okay, I told them about your research and they were impressed."

}

You shake your head, trying to process what that means for you and your career. You feel as if a weight is being lifted off of your shoulders. All your concerns about finding a sponsor for your visa, staying in this country, all of them are being solved, right now, by this confirmation.

Bronislav: "I can't believe- this doesn't even feel real."

Ivy: "Best believe, it's very real. I'm just glad I could help you out like this."

->BI_C_DealOutro

=== BI_C_WishYouHadnt ===
Bronislav: "Honestly Ivy, I kind of wish you hadn't said anything."

Ivy looks completely stunned.

Ivy: "What do you mean? I spoke super highly of you, your work, and your research, and they were very impressed. Why wouldn't you want me to do that?"

Bronislav: "Maybe I would appreciate it more under different circumstances, but this... it's just not sitting right with me at all. I appreciate the gesture, but this all feels so wrong.

Ivy: "Or maybe you could just say thank you and move on Bronislav? Would it kill you to be grateful for once?"

Ivy: "Nobody cares about what you have to do to get a job, they just care whether or not you have one. You now have one, a real, prestigious job."

Ivy shakes her head in frustration.

Ivy: "I just don't understand where you are coming from."

Bronislav: "I regret putting myself in this situation to begin with. That's where I am coming from."

You turn to walk away from Ivy, before she can say anything else.

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_DealOutro ===
Bronislav: "You know, I had slightly mixed feelings about everything and going through with all of this Jensen stuff, but now it feels like its all going to be worth it."

Ivy smiles.

Ivy: "I'm so glad Bronislav. You really deserve it."

Ivy notices as some other friends flag her down in the distance.

Ivy: "Oh, looks like they're calling me, let's grab a coffee later if you can!"

Bronislav: "Alright!"

{DbInsert("BI_Coffee")}

{HideCharacter("Ivy")}

->DONE

=== BI_C_ThatsGreat ===
Bronislav: "That's great Ivy! I really appreciate you doing that."

Ivy: "Yeah, sure, it's the least I could do, considering you're helping Jensen out."

Bronislav: "No, I'm serious Ivy, I know I haven't exactly been the warmest to you, but I'm just glad you were willing to see past that and help me out."

Ivy: "Now, the job isn't perfectly set in stone, but I'll give you my uncle's contact so you can chat with him more."

She hands you a slip of paper with her Uncle's number on it.

Ivy: "Give him a call when you get a chance."

-> BI_C_DealAltOutro

=== BI_C_SomethingElse ===
Bronislav: "Is there anything else that I can do to improve his opinion of me? I know you talked to him, but is there anything else I can do to ensure I get the job?"

Ivy: "Yeah, the job isn't perfectly set in stone, but my uncle told me to give you his contact because he wanted to chat with you more before making any final decisions."

She hands you a slip of paper with her Uncle's number on it.

Ivy: "Give him a call when you get a chance."

-> BI_C_DealAltOutro

=== BI_C_DealAltOutro ===
You gratefully take the paper, and carefully place it in your pocket. This could be your ticket to solve everything that has been burdening you, to solve all of your stress surronding getting a job, keeping your visa, all of it.

Bronislav: "You know, I had slightly mixed feelings about everything and going through with all of this Jensen stuff, but now it feels like its all going to be worth it."

Ivy smiles slightly and nods.

Ivy: "I hope it all works out for you. Hey! Let's grab coffee later if you have the time!"

Bronislav: "Yeah, sure."


{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_HoldingUp ===
Bronislav: "How are you holding up, you know, after everything?"

Ivy looks a bit surprised by you asking.

Ivy: "I'm okay. I just..."

Ivy trails off as she searches for her next words.

Ivy: "I genuinely don't want all of this to mess with us working together in the future."

*["We definitely will."  #>> ChangeOpinion Ivy Bronislav ++++]
->BI_C_WeAreStillFriends

*["I'm not sure anymore."  #>> ChangeOpinion Ivy Bronislav -]
->BI_C_NotSureAnymore

=== BI_C_DontBringUp ===
You decide to not bring up the deal. It's better not to make things awkard, especially at an event like this.

Ivy: "Uh... Bronislav, I just wanted to apologize, about putting you in that position the other day." 

Ivy: "I know I said a lot of things I regret, and I think that was just because I was so desperate to help Jensen. You don't have to respond to any of this, but just know I'm sorry."

*["I appreciate your apology." #>> ChangeOpinion Ivy Bronislav +]
->BI_C_AppreciateApology

*["You should be sorry." #>> ChangeOpinion Ivy --]
->BI_C_YouShouldBe

=== BI_C_WeAreStillFriends ===
Bronislav: "Of course we'll continue working together. I get that you were just trying to help Jensen out. I think just next time, if you didn't place me in the middle of that, I think I would feel much better about it."

Ivy: "Yeah, I'm sorry I did. I'm just glad there's no hard feelings."

Bronislav: "Well, it was good talking with you Ivy. I'm going to check out a few more presentations, but it was nice seeing you."

Ivy: "Yeah you too Bronislav. Maybe we should grab a coffee later today if you're available."

Bronislav: "Sounds good." 


{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_NotSureAnymore ===
Bronislav: "Realistically Ivy, I'm not sure I can be anymore. You put me in a really uncomfortable position, and I just don't feel comfortable pretending like nothing happened."

Ivy: "Oh... yeah... I guess I understand."

Ivy looks visibly saddened.

Ivy: "I'm really sorry for putting you in this position. I just really wanted to help Jensen, but I can see I took it too far. I just hope I can make it up to you at some point."

Bronislav: "Well, I'm glad I could talk with you some more, Ivy. I'm going to check out a few more presentations, but I'll see you around."

Ivy: "Yeah, okay... take care."

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}

->DONE

=== BI_C_AppreciateApology ===
Bronislav: "I appreciate your apology. I certainly wasn't perfect in my own handling of that situation either, so I'm sorry for that."

Ivy: "Do you think we will still be able to work together, after all this?"

*["Definately."  #>> ChangeOpinion Ivy Bronislav ++++]
->BI_C_WeAreStillFriends

*["I'm not sure anymore."  #>> ChangeOpinion Ivy Bronislav -]
->BI_C_NotSureAnymore

=== BI_C_YouShouldBe ===
Bronislav: "Yeah, Ivy, you really should be. You can't force people into doing what you want, even people you think are friends."

Ivy lowers her head, trying to hide her shame.

Ivy: "Yeah, I know that now... I think I'm going to go."

{HideCharacter("Ivy")}

Ivy walks away before you can say any more to her.

While this certainly hasn't been the cleanest resolution to the whole situation, the important thing is that Ivy learns she can't force people to do things, even if she has an incentive. At this point, you're more concerned about preserving your integrity than associating with someone who wants to use your research for someone else's benefit like she tried to.

With that on your mind, you return to the rest of the conference.

{DbInsert("BI_Coffee")}
->DONE

=== BI_C_NoProblemWithYou ===
Bronislav: "Ivy. I don't have a problem with you as a person. I only have a problem with the way you handled this situation."

Ivy: "Oh... I guess I hadn't considered that."

Bronislav: "I just would ask that we don't try to do any 'deals' in the future. It put me in a really uncomfortable position, but I think if we can maintain some boundaries, I don't really see us having another problem."

Ivy: "Yeah, I'm sorry Bronislav. I got a bit wrapped up in helping Jensen, and I dragged you into it. I can definitely try to respect your boundaries in the future."

Bronislav: "Thanks, I appreciate that."

Ivy smiles sadly.

*["What's wrong?"]
Bronislav: "What's wrong, Ivy?"

Ivy: "I'm realizing I misjudged you. I hope we can move past this at some point."

Bronislav: "Me too."

Ivy: "Alright, there's a talk I'm going to head off to now, but maybe we can grab coffee later?"

Bronislav: "Sounds good. I'll see you around."

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE


*[Say nothing.]
You decide to stay quiet and wait for Ivy to speak.

Ivy: "I'm realizing I misjudged you. I hope we can move past this at some point."

Bronislav: "Me too."

Ivy: "Alright, there's a talk I'm going to head off to now, but see you around Bronislav."

Bronislav: "Okay, see you."

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_ApologyNotHate ===
Bronislav: "I'm sorry if I came off that way, but I would like an apology."

Ivy sighs, realizing that you feel bad your own reaction to the situation.

Ivy: "Yeah I'm sorry too. This turned into a whole mess when I was really hoping it wouldn't."

Bronislav: "Well, next time, can I just ask that you respect my boundaries and not ask me to do any more 'deals'?"

Ivy: "Obviously. You won't be getting any requests like that again, that's for sure."

Bronislav: "Thanks, I really appreciate that."

Ivy sighs.

Ivy: "Sure Bronislav. Look, I'm going to go to a talk now, but maybe we can grab coffee later?"

Bronislav: "Maybe, I'll see you around."

{HideCharacter("Ivy")}
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_YoureNotWrong ===
Bronislav: "You're not wrong, but I was trying to be polite."

Ivy: "Gee thanks Bronislav. And here I was thinking you could potentially be nice."

Bronislav: "Look Ivy, you and I both know you were in the wrong, but I would feel better about the whole situation if you could just apologize and we could move on."

Ivy: "Sure, I had some part in this situation Bronislav, but acting like you were a perfect in this situation is far from the truth. So I guess I'm sorry for trying to pressure you, but you owe me an apology as much as I owe you one. You were really rude to me, and its not really something that I can just move on from."

*["I'm sorry for my behavior." #>> ChangeOpinion Ivy Bronislav +]
Bronislav: "I'm sorry for the way I acted too, Ivy. I shouldn't have been so harsh about everything, I guess I was just uncomfortable with the whole situation, but that doesn't mean I have the right to treat you poorly."

Ivy smiles slightly.

Ivy: "I appreciate that Bronislav. Now, if you don't mind, I'm going to head off to another talk, so I guess I will see you later."

Bronislav: "Yeah, no problem, see you around."

{HideCharacter("Ivy")}

While this certainly hasn't been the cleanest resolution to the whole situation, the important thing is that you are setting boundaries with Ivy so you don't have go through something like this again in the future. You couldn't help Jensen, but maybe there's still some hope for both of your futures. For now, you just need to give the whole thing some space.
{DbInsert("BI_Coffee")}
->DONE

*[Don't apologize.#>> ChangeOpinion Ivy -]
You remain silent as you look at Ivy. Sure you're behavior wasn't perfect, but apologizing to her when she was the one in the wrong doesn't feel right.

Ivy appears frustrated with your lack of response.

Ivy: "Okay, Bronislav, be that way. It's sad that I'm the only one who can be a bigger person in this situation, but I guess that's to be expected given your track record."

Ivy turns and leaves without another word.

{HideCharacter("Ivy")}

While this certainly hasn't been the cleanest resolution to the whole situation, the important thing is that Ivy learns she can't force people to do things, even if she has an incentive. At this point, you're more concerned about preserving your integrity than associating with someone who wants to use your research for someone else's benefit like she tried to.
{DbInsert("BI_Coffee")}
->DONE

=== BI_C_Integrity ===
Bronislav: "And you clearly don't care about integrity. That's plain as day."

Ivy: "Wow. Just wow."

Ivy looks absolutely apalled.

Ivy: "My intentions were good, and I was just trying to help a student, but if you are really this heartless, then I have nothing more to say to you. Goodbye, Bronislav."

{HideCharacter("Ivy")}

Ivy turns and storms off before you can say another word.

While she may have very much been in the wrong, maybe you shouldn't have treated her like that. The way people around you perceive you is just as important as your integrity, and while it might not matter if you and Ivy don't get along, it will matter if the other people in the lab think you are heartless too.

A bit troubled by that interaction, you return your attention back to the conference.
{DbInsert("BI_Coffee")}
->DONE
