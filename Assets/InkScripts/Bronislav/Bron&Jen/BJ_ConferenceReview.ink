VAR badidea = false
VAR thinking = false
=== BJ_CONF_Start ===
#---
# choiceLabel: Talk to Jensen
# @query
# date.day!4
# Seen_BI_ReviewPeriod
# @end
# repeatable: false
# tags: action, student_cubes, auxiliary 
#===
# Summary: Jensen checks in to see if he is on the paper 

~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

~BlowUp = DbAssert ("BI_Blowup")


{ShowCharacter("Jensen", "left", "")}




{IvyAcceptedOfficial: -> BJCR_accepted} 
{IvyDeniedOfficial: -> BJCR_denied} 
{BlowUp: -> JensenGhosted} 

===BJCR_accepted===

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{JenOpinionSocial3 >= OpinionState.Good: -> GoodJensenBeginningAccepted} 
{JenOpinionSocial3 >= OpinionState.Neutral && JenOpinionSocial3 < OpinionState.Good: -> NeutralJensenBeginningAccepted} 
{JenOpinionSocial3 <= OpinionState.Neutral: -> BadJensenBeginningAccepted} 


===BJCR_denied===
~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{JenOpinionSocial3 >= OpinionState.Good: -> GoodJensenBeginningDenied} 
{JenOpinionSocial3 >= OpinionState.Neutral && JenOpinionSocial3 < OpinionState.Good: -> NeutralJensenBeginningDenied} 
{JenOpinionSocial3 <= OpinionState.Neutral: -> BadJensenBeginningDenied} 

===JensenGhosted===
You got a message earlier today from Jensen to meet you here at this time, so you sit down and wait. 

And wait...

And wait....

And wait......

Did he ghost you? Why? Is it because you had that argument with Ivy? 

You're not sure why, but it seems like he wont show up. 

{HideCharacter("Jensen")}
// TODO: LOCK BAD TIMELINE
{DbInsert("Seen_BJS3")}
->DONE



=== BJS3_SureWhat ===
Bronislav: "Sure, what’s up?" You prompt back, with a smile.

Jensen: "I would like to ask you to reconsider adding me to the paper."

*["Actually, I have been thinking about it more." #>> ChangeOpinion Jensen Bronislav ++]
//Bronislav: + Supportive
->BJS3_ActuallyIhave

*["What is your reasoning?"]
->BJS3_Reasoning

*["Not this again." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_NotThis

*["There’s nothing to reconsider." #>> ChangeOpinion Jensen Bronislav --]
//Bronislav: Petty
->BJS3_NothingtoReconsider

=== BJS3_YeahIG ===
Bronislav: "Yeah, I guess you can. What’s up?"
Jensen: "I want to ask you to reconsider adding me to the paper."
*["Actually, I have been thinking about it more." #>> ChangeOpinion Jensen Bronislav ++]
//Bronislav: + Supportive
->BJS3_ActuallyIhave

*["What is your reasoning?"]
->BJS3_Reasoning

*["Not this again." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_NotThis

*["There’s nothing to reconsider." #>> ChangeOpinion Jensen Bronislav --]
//Bronislav: Petty
->BJS3_NothingtoReconsider

=== BJS3_KindaBusy ===
Bronislav: "I’m actually kind of busy, Jensen." 

You try to leave.

Jensen’s face shifts to a look of panic.

Jensen: "Wait, I just wanted to ask you to reconsider adding me to the paper."
*["Actually, I have been thinking about it more." #>> ChangeOpinion Jensen Bronislav ++]
//Bronislav: + Supportive
->BJS3_ActuallyIhave

*["What is your reasoning?"]
->BJS3_Reasoning

*["Not this again." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_NotThis

*["There’s nothing to reconsider." #>> ChangeOpinion Jensen Bronislav --]
//Bronislav: Petty
->BJS3_NothingtoReconsider

=== BJS3_ActuallyIhave ===
Bronislav: "Actually, I have been reconsidering, I think I was a bit harsh with you before."

Jensen: "Well, when I last talked with Ivy, she mentioned that she offered you a sweet job position in exchange for helping me out, but you turned that down too. I know you have some concerns, but all of this is simply friends helping friends out."
*["I’d love to help one of my friends out, maybe..." #>> ChangeOpinion Jensen Bronislav ++++]
//Bronislav: +Bad Advisor
->BJS3_HelpAFriend

*["I think it’s worth making an exception for you." #>> ChangeOpinion Jensen ++]
->BJS3_ExceptionforYou

*["I don’t think I can help."]
->BJS3_DontThinkICan

*["We’re not friends." #>> ChangeOpinion Jensen Bronislav ----]
//Bronislav: +Petty
->BJS3_NotFriends

=== BJS3_Reasoning ===
Bronislav: "Why should I reconsider?"

Jensen: "I know you are hesitant about the whole authorship thing, so I talked with Ivy. Apparently, she offered you a sweet job position in exchange for helping me, which seems like a more than generous reason to help a friend."

*["I’d love to help one of my friends out, maybe..." #>> ChangeOpinion Jensen Bronislav ++++]
//Bronislav: +Bad Advisor
->BJS3_HelpAFriend

*["I think it’s worth making an exception for you." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_ExceptionforYou

*["I don’t think I can help."]
->BJS3_DontThinkICan

*["We’re not friends." #>> ChangeOpinion Jensen Bronislav ----]
//Bronislav: +Petty
->BJS3_NotFriends

=== BJS3_NotThis ===
Bronislav: "Not this again,"

You say with a groan.

Bronislav: "I thought I was clear with you that I wasn’t going through with this."

Jensen: "I know you told me that you didn’t want to add me to the paper, but I talked with Ivy, and I think what she’s offering you in return for helping me is pretty generous. All of this is a simple as friends helping friends."

*["I’d love to help one of my friends out, maybe..." #>> ChangeOpinion Jensen Bronislav ++++]
//Bronislav: +Bad Advisor
->BJS3_HelpAFriend

*["I think it’s worth making an exception for you." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_ExceptionforYou

*["I don’t think I can help."]
->BJS3_DontThinkICan

*["We’re not friends." #>> ChangeOpinion Jensen Bronislav ----]
//Bronislav: +Petty
->BJS3_NotFriends

=== BJS3_NothingtoReconsider ===
Bronislav: "There’s nothing to reconsider."

You scoff.

Jensen: "Look, Bronislav, I know you’re feeling that way, but I talked to Ivy. Even though you turned it down, I think what she’s offering you for helping me is pretty generous. All of this is a simple as friends helping friends."

*["I’d love to help one of my friends out, maybe..." #>> ChangeOpinion Jensen Bronislav ++++]
//Bronislav: +Bad Advisor
->BJS3_HelpAFriend

*["I think it’s worth making an exception for you." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_ExceptionforYou

*["I don’t think I can help."]
->BJS3_DontThinkICan

*["We’re not friends." #>> ChangeOpinion Jensen Bronislav ----]
//Bronislav: +Petty
->BJS3_NotFriends

=== BJS3_HelpAFriend ===
{ShowCharacter("Jensen", "left", "happy")}
Bronislav: "Well, I’d love the chance to help one of my friends out, maybe I'll reconsider. Besides, you gave me some feedback that I took into consideration."

Jensen: "Really?"

Jensen smiles widely.

Jensen: "Thank you, thank you, thank you!"
Bronislav: "Yeah, no problem."

While it is great to see Jensen so happy, you can’t shake the feeling that this is somehow a bad idea. This could end badly for both of you if you’re caught.

*["I am happy to help a friend, no matter what."]
->BJS3_HappyToHelp

*[ Maybe I should reconsider... #>> ChangeOpinion Jensen Bronislav ----]
// Bronislav: +Guilty
~badidea = true
->BJS3_Reconsider

=== BJS3_ExceptionforYou ===
{ShowCharacter("Jensen", "left", "happy")}
Bronislav: "While I still have some reservations about all of this, I think it’s worth making an exception for you."
Jensen: "I’m so glad to hear it,"
Jensen says with a smile.

Jensen: "I really appreciate it Bronislav."
While it feels great to help Jensen out, you can’t shake the feeling that this is somehow a bad idea. Your credibility could be destroyed if you’re caught.

*["I am happy to help a friend, no matter what."]
->BJS3_HappyToHelp

*[ Maybe I should reconsider... #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
->BJS3_Reconsider

=== BJS3_DontThinkICan ===
Bronislav: "As much as I’d like to help Jensen, I am not sure that I can."

Jensen: "What do you mean? It’s as simple as adding me to the paper."

Jensen looks genuinely confused.

Bronislav: "I could, but it is not just throwing your name on a paper. I would be jeopardizing the credibility of me and my work if I did that."

Jensne: "You don’t understand, Bronislav, if I don’t get this opportunity, I can’t get into grad school. I can’t believe you’d put your own concerns over the chance to actually help me."

The desperation in Jensen’s voice is overwhelming. While it feels right to not add him to your paper, turning your back on someone doesn’t exactly feel good.

*["That's my final decision."]
// Bronislav: +Moral
~ thinking = true
->BJS3_Reconsider

*[ Maybe I should reconsider... ]
->BJS3_Reconsider

->BJS3_FinalDecision

=== BJS3_NotFriends ===

Bronislav: "We’re not friends, Jensen. You do not deserve co-authorship, and no amount of Ivy twisting my arm is going to change that."

Jensen looks absolutely crushed.

Jensen: "There’s truly nothing that I can say to change your mind?" 

Jensen is visibly distraught. While you have been firm in your beliefs, perhaps you’ve been too harsh.

*["That's my final decision."]
// Bronislav: +Petty
// Bronislav: +Bad Advisor
->BJS3_FinalDecision


*[ Maybe I should reconsider... ]
->BJS3_Reconsider

=== BJS3_HappyToHelp ===
Bronislav: "I am happy to help a friend, no matter what."
Jensen: "Thank you, truly. I can’t wait to tell Ivy."

{HideCharacter("Jensen")}
// TODO: LOCK BAD TIMELINE
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_Reconsider ===
{badidea == true:
Bronislav: "Wait, Jensen…"

Bronislav: "I don’t think I can do this."
Jensen: "What do you mean?"

Bronislav: "This authorship thing, it isn’t right. As much as I want to help you, I don’t think I can."
Jensen: "Even after everything you just said?"
Jensen is starting to get choked up.

Jensen: "Why would you even say all of that?"
Bronislav: "Because you’re a good guy, Jensen. But just because you are doesn’t mean I can just give you authorship on this paper."
Jensen shakes his head at you and leaves the room without another word. While you probably just made the right decision, you feel guilty for giving him hope like that.

// TODO: LOCK GOOD TIMELINE
- else:
Seeing Jensen this upset is starting to weigh on you. Perhaps you really are being unfair.

Bronislav: "You know what, Jensen, I’m willing to make an exception for you, just this once."
Jensen: "Really?"
Jensen says, shocked.

Jensen: "I don’t know what to say. You mean you will put me on the paper then?"
Bronislav: "Yeah, I will put you on the paper."
You say with a sigh.

Jensen: "Wow, I…"
Jensen is speechless in his relief,

Jensen: "Thank you so much Bronislav."
As he turns to leave, you can hear him say "I can’t wait to tell Ivy!" The amount of excitement on Jensen’s face almost feels worth it, but this is definitely a risky decision.

{HideCharacter("Jensen")}
// TODO: LOCK BAD TIMELINE
}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_FinalDecision ===
{thinking == true:
Bronislav: "That’s my final decision. I’m sorry, but that’s how it has to be."
You say apologetically.

Jensen: "I don’t understand why you insist on being this way, Bronislav. It hurts, like really hurts."
Jensen says as he leaves the room.

While you don’t like letting him down like this, it is important that he learns you can’t be bought.

- else:
Bronislav: "That’s my final decision,"
You say heatedly.

Bronislav: "And if you’re expecting sympathy for making such a ridiculous ask, you’re out of line."

Jensen hangs his head, utterly ashamed, and leaves as quickly as he can. You are determined to stick to your beliefs, no matter the cost.

{HideCharacter("Jensen")}
}

// TODO: LOCK GOOD TIMELINE
{DbInsert("Seen_BJS3")}
->DONE

=== GoodJensenBeginningAccepted ===
Jensen approaches you with a bright smile.

Jensen: "Hey Bronislav, just checking in! You put me as co-author, right?"

*["Of course!" #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_OfCourse

*["I don't see why not."]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_DontSeeWhyNot

*["I may have reconsidered." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: Ashamed
->BJS3_MayHaveReconsidered


===NeutralJensenBeginningAccepted===

Jensen sees you in the distance and starts walking over to your table.

Jensen: "Bronislav! Glad I caught up with you, I just had some questions about the paper."

*["Of course!" #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_OfCourse

*["I don't see why not."]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_DontSeeWhyNot

*["I may have reconsidered." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: Ashamed
->BJS3_MayHaveReconsidered


===BadJensenBeginningAccepted===
Jensen walks up to you tightly clutching one of his bag's shoulder straps.

Jensen: "Hey Bronislav, I still have co-authorship... right?"

*["Of course!" #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_OfCourse

*["I don't see why not."]
// Jensen: Hopeful
// Bronislav: Bad Advisor
->BJS3_DontSeeWhyNot

*["I may have reconsidered." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: Ashamed
->BJS3_MayHaveReconsidered


=== BJS3_OfCourse ===
Bronislav: "Of course Jensen!"

Jensen: "Wait, actually? Oh! OH!"

Jensen can barely contain his excitement with you confirming his status on the paper.

Jensen: "Thank you Bronsilav! I'll make sure to confirm it with Ivy so we can get you that position."

*["Glad we could help each other."]
->BJS3_GladWeCould

*["Just be careful."]
->BJS3_JustBeCareful

=== BJS3_DontSeeWhyNot ===
Bronislav: "I don't see why not."

Jensen looks at you, a bit confused but also excited.

Jensen: "So I am on the paper? LIke, I'll be a co-author for real?"

Bronislav: "That is what that would mean Jensen."

Jensen: "I'm sorry Bronislav I just didn't think you were serious! I need to tell Ivy about this!"

*["Glad we could help each other."]
->BJS3_GladWeCould

*["Just be careful."]
->BJS3_JustBeCareful

=== BJS3_MayHaveReconsidered ===
Bronislav: "Look Jensen, as much as I appreciate your ambition on the paper but I may have reconsidred since last we spoke."

Jensen: "You... you have?"

He says disparagingly.

Jensen: "Can I ask why Bronislav?"

He looks absolutely crushed.

Bronislav: "I wish it were easier to explain Jensen, it's a lot more than just a single thing."

*["Just work on yourself." #>> ChangeOpinion Jensen Bronislav ++]
// Bronislav: +Supportive
->BJS3_WorkOnYourself

*["This just wasn't for you." #>> ChangeOpinion Jensen Bronislav --]
// Bronislav: Petty
->BJS3_WasntForYou

*["You can't rely on workarounds."]
// Bronislav: Moral
->BJS3_Workarounds

=== BJS3_GladWeCould ===
Bronislav: "I'm really glad that we could help each other with this Jensen. I can't wait to work with you more."

Jensen looks as happy as ever hearing you say this.

Jensen: "Likewise with you Bronislav, it means a lot that you let me work with you on this. I won't let you down!"

He does a little fist pump and leaves.

{HideCharacter("Jensen")}
// TODO: LOCK BAD TIMELINE
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_JustBeCareful ===
Bronislav: "Just be careful and keep this between you, me, and Ivy. You'll get co-authorship, and I'll get in contact with Ivy."

Jensen: "Oh, alright Bronislav, sounds good!"

He smiles and leaves. It's nice to see Jensen happy, but you know that the risk of this decision is major.

{HideCharacter("Jensen")}
// TODO: LOCK BAD TIMELINE
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_WorkOnYourself ===
Bronislav: "Just work on yourself Jensen. You'll find an opportunity for yourself  as long as you put in the effort."

Jensen looks defeated.

Jensen: "I just thought this would be my opportunity..."

He then lets out a deep sigh.

Jensen: "Well, thanks anyways Bronislav. Hope your paper goes well."

He slumps his shoulders and walks out.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_WasntForYou ===
Bronislav: "I think you were just in over your head Jensen, this opportunity needed someone who may have a little more experience than yourself."


Jensen: "Yeah... yeah... you're right Bronislav. I just wish that this could've been a way to get more experience, but I guess just being in the environment is some experience."

He gets up and walks out.

Jensen: "Thanks for even considering me a little bit Bronislav."

As he leaves it isn't fun to see Jensen like that, but a choice like that had to be made for both of your reputations.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_Workarounds ===
Bronislav: "Jensen you and I both know that what you and Ivy were trying to do was wrong. You can't rely on workarounds like that."


Jensen: "It's not like I was planning on doing it any other time after this... I just really needed this co-authorship for grad school."

Letting out a deep sigh, he picks up his stuff and starts to leave.

Bronislav: "Jensen, be honest with yourself and people that you work with and you'll find a way to not need the workarounds."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

===GoodJensenBeginningDenied===
Jensen approaches you with a bit of excitement in his step.

Jensen: "Hey Bronislav, great to see you. If you have a second, there’s something I want to ask you."

*["Sure, what's up? #>> ChangeOpinion Jensen Bronislav ++]

->BJS3_SureWhat

*["Yeah, I guess."]

->BJS3_YeahIG

*["I'm kind of busy, actually." #>> ChangeOpinion Jensen Bronislav --]

->BJS3_KindaBusy

===NeutralJensenBeginningDenied===

Jensen approaches you, looking slightly nervous.

Jensen: "Hey Bronislav. If you have a second, there’s something I would like to ask you."
*["Sure, what's up? #>> ChangeOpinion Jensen Bronislav ++]

->BJS3_SureWhat

*["Yeah, I guess."]

->BJS3_YeahIG

*["I'm kind of busy, actually." #>> ChangeOpinion Jensen Bronislav --]

->BJS3_KindaBusy

=== BadJensenBeginningDenied===

Jensen looks over to you nervously, as though he is debating something. He appears to muster up the courage to talk to you.

Jensen: "Hi Bronislav, I uh… would like to ask you something, if that’s okay."


*["Sure, what's up? #>> ChangeOpinion Jensen Bronislav ++]

->BJS3_SureWhat

*["Yeah, I guess."]

->BJS3_YeahIG

*["I'm kind of busy, actually." #>> ChangeOpinion Jensen Bronislav --]

->BJS3_KindaBusy
