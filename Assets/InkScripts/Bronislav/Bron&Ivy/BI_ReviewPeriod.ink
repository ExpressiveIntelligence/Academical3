

=== BI_ReviewPeriod_SceneStart ===

//VAR IvyDealAccepted = false 
//VAR IvyDealConsidered = false
//VAR IvyDealDenied = false
//VAR SwitchingOpinionsReject = false 
//VAR SwitchingOpinionsAccept = false

VAR IvyAcceptedOfficial = false 
VAR IvyDeniedOfficial = false
VAR SwitchingOpinionsReject = false 
VAR SwitchingOpinionsAccept = false


# ---
# choiceLabel: Work on paper 
# @query
# Seen_BI_CONF
# date.day!4
# @end
# hidden: true
# repeatable: false
# tags: action, required, student_cubes
# ===

{DbInsert("Seen_BI_ReviewPeriod")}

~IvyDealAccepted = DbAssert("IvyDealAccepted")

~IvyDealConsidered = DbAssert("IvyDealConsidered")

~IvyDealDenied = DbAssert ("IvyDealDenied") 

~SwitchingOpinionsReject = DbAssert ("BI_SwitchingOpinions_Reject")

~SwitchingOpinionsAccept = DbAssert ("BI_SwitchingOpinions_Accept")

You sit down to go over the feedback. Ivy approaches you seeing you work on edits.

{ShowCharacter("Ivy", "left", "")}

Ivy: "Hey Bronislav. Got some helpful feedback?"

*["I did."]
->BI_RP_IDid

*["It was so-so."]
->BI_RP_SoSo

*["Not really."]
->BI_RP_NotReally

// TODO: if negative relationship with Jensen
// NOTE: THIS CURRENTLY ASSUMES PLAYER'S RELATIONSHIP WITH JENSEN IS NEGATIVE

~ temp jensenOpinion = GetOpinionState("Jensen", "Bronislav")
{
- jensenOpinion <= OpinionState.Good:
    *["Better than Jensen's." #>> ChangeOpinion Ivy Bronislav --]
    ->BI_RP_BetterThanJ
}


=== BI_RP_IDid ===
Bronislav: "Yep! Got some real helpful feedback that I'm editing to the paper right now."

Ivy gives a thumbs up.

Ivy: "That's great to hear! I know that you are already getting feedback, but I just really want to push how helpful Jensen could be for the paper. He's really smart, and well-spoken, and you'd be helping him more than you know."

With the conference around the corner, this will be your final say of how you want to manage this deal. 

*["I was planning on it." #>> ChangeOpinion Ivy Bronislav ++++]
->BI_RP_PlanningOnIt

*["As long as I get something." #>> ChangeOpinion Ivy Bronislav ++]
->BI_RP_GetSomething

*["I don't think I will." #>> ChangeOpinion Ivy Bronislav -]
->BI_RP_DontThinkSo

*["Definitely not." #>> ChangeOpinion Ivy Bronislav ----]
->BI_RP_DefNot

=== BI_RP_SoSo ===
Bronislav: "It was alright, not too great, but there was some helpful feedback."

Ivy shrugs sympathetically.

Ivy: "I'm sorry to hear that. You know... if you need someone to bounce ideas and feedback off of Jensen is really good for it. All he needs is just a good mentor like yourself!"

With the conference around the corner, this will be your final say of how you want to manage this deal. 

*["I was planning on it." #>> ChangeOpinion Ivy Bronislav ++++]
->BI_RP_PlanningOnIt

*["As long as I get something." #>> ChangeOpinion Ivy Bronislav ++]
->BI_RP_GetSomething

*["I don't think I will." #>> ChangeOpinion Ivy Bronislav -]
->BI_RP_DontThinkSo

*["Definitely not." #>> ChangeOpinion Ivy Bronislav ----]
-> BI_RP_DefNot

=== BI_RP_NotReally ===
Bronislav: "Not really, I've been pretty uninterested in all the feedback I have gotten. Hasn't been especially helpful."

Ivy raises her eyebrow.

Ivy: "O-oh? Well I'm sorry that nothing has been that helpful Bronislav. If I can suggest something, I know Jensen did give you some good feedback a while ago, maybe good enough for you to consider our deal?"

With the conference around the corner, this will be your final say of how you want to manage this deal. 

*["As long as I get something." #>> ChangeOpinion Ivy Bronislav ++]
->BI_RP_GetSomething

*["I don't think I will." #>> ChangeOpinion Ivy Bronislav -]
->BI_RP_DontThinkSo

*["Definitely not." #>> ChangeOpinion Ivy Bronislav ----]
->BI_RP_DefNot

=== BI_RP_BetterThanJ ===
Bronislav: "Well, the feedback I did get was definitely better than what Jensen gave me week one."

Ivy scoffs.

Ivy: "Bronislav! He's an undergrad, this is his first time at something like this. Cut him some slack will you?"

She takes a deep breath.

Ivy: "Look, you don't even need to have Jensen do anything. Just say he was a co-author and I'll leave my offer on the table."

With the conference around the corner, this will be your final say of how you want to manage this deal. 

*["As long as I get something." #>> ChangeOpinion Ivy Bronislav ++]
->BI_RP_GetSomething

*["Definitely not." #>> ChangeOpinion Ivy Bronislav ---]
->BI_RP_DefNot


=== BI_RP_PlanningOnIt ===

{DbInsert("BI_OfficiallyAccepted")}

// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper

{IvyDealAccepted: ->PlanningOnItAcceptedConsidered}
{IvyDealConsidered: ->PlanningOnItAcceptedConsidered}
{SwitchingOpinionsAccept: -> PlanningOnItAcceptedConsidered}
{IvyDealDenied: -> PlanningOnItDenied} 
{SwitchingOpinionsReject: -> PlanningOnItDenied}

=PlanningOnItAcceptedConsidered
Bronislav: "I was planning on adding Jensen actually! He, and you, convinced me enough to add him to the paper."

Ivy looks estatic hearing you say this.

Ivy: "Really!? That's great news Bronislav, you're such a lifesaver." 

{SwitchingOpinionsAccept: Ivy: "I was worried you were going to switch your choice again."}

I'll tell Jensen as soon as possible, and I'll talk to you about my uncle soon hopefully! I might even buy a coffee for you."

*["Thanks Ivy!"]
->BI_RP_ThanksIvy

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater


= PlanningOnItDenied
Bronislav: "I was planning on adding Jensen actually! You both convinced me enough to add him to the paper."

Ivy looks a bit confused, but estatic at the same time.

Ivy: "Wait, really? Oh! That's incredible news." 

{SwitchingOpinionsReject: Ivy: "You've been going back and forth but glad to know you've made the right decision."}

Ivy: "I'll make sure to relay the good news to Jensen, and I'll work something out with my uncle. Keep me updated on how this all goes, and we'll meet once I get this all situated."

*["Thanks Ivy!"]
->BI_RP_ThanksIvy

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater

=== BI_RP_GetSomething ===

{DbInsert("BI_OfficiallyAccepted")}
{IvyDealAccepted: ->GetSomethingAcceptedConsidered}
{IvyDealConsidered: ->GetSomethingAcceptedConsidered}
{SwitchingOpinionsAccept: ->GetSomethingAcceptedConsidered}
{IvyDealDenied: -> GetSomethingDenied} 
{SwitchingOpinionsReject: -> GetSomethingDenied}

=GetSomethingAcceptedConsidered
Bronislav: "As long as I get something out of it you've got yourself a deal Ivy."

She smiles and nods.

Ivy: "Of course. This is great news, I'll make sure to tell Jensen and call the firm. After I do that I'll call you for a coffee and we can discuss details further."

*["Sounds great."]
->BI_RP_SoundsGreat

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater

=GetSomethingDenied
Bronislav: "As long as I get something out of it you've got yourself a deal Ivy."

Ivy's shock on her face quickly turns into a smile.

Ivy: "Wait, really? What made you- Nevermind, nevermind. That's great to hear Bronislav! I'll make sure to tell Jensen, I know he'll be surprised! After that I'll see when I can talk with my uncle about getting you that position."

*["Sounds great."]
->BI_RP_SoundsGreat

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater


=== BI_RP_DontThinkSo ===

{DbInsert("BI_OfficiallyRejected")}

{IvyDealAccepted: ->DontThinkSoAcceptedConsidered}
{IvyDealConsidered: ->DontThinkSoAcceptedConsidered}
{SwitchingOpinionsAccept: ->DontThinkSoAcceptedConsidered}
{IvyDealDenied: -> DontThinkSoDenied} 
{SwitchingOpinionsReject: -> DontThinkSoDenied}
// if Bronislav said Jensen would be on the paper

=DontThinkSoAcceptedConsidered
Bronislav: "I just don't think I will Ivy. There's a lot that can go wrong, and I don't want to put all of us at that risk." 

Ivy looks shocked.

Ivy: "Y-wh-you what? You... won't? Bronislav, what happened? What changed?"

She struggles to find words for a moment.

{SwitchingOpinionsAccept: Ivy: "First you say no, then you say yes, now you're saying no again?!"}

Ivy: "So that's it? You just aren't now? You're letting all of these opportunities go because you're scared over a non-issue?"

*["Sorry Ivy."]
->BI_RP_SorryIvy

//if you said Jensen would be on the paper
*["It is an issue." #>> ChangeOpinion Ivy Bronislav --]->BI_RP_ItsAnIssue

=DontThinkSoDenied
Bronislav: "I just don't think I will Ivy. There's a lot that can go wrong, and I don't want to put all of us at that risk."

Ivy lets out a deep sigh.

{IvyDealDenied: Ivy: "Bronislav, it really isn't that big of an issue I promise. Seems like I can't change your mind anyway. You should personally tell Jensen about it, he'll be upset but it'll be for the best." }

{SwitchingOpinionsReject: Ivy: "Bronislav, it really isn't that big of an issue I promise. You seemed on board at one point, and I'm not sure what happened. Seems like I can't change your mind anyway. You should personally tell Jensen about it, he'll be upset but it'll be for the best."}


*["I'll talk to him later." #>> ChangeOpinion Ivy Bronislav +]
->BI_RP_TalkToHimLater


=== BI_RP_DefNot ===

{DbInsert("BI_OfficiallyRejected")}
// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper

{IvyDealAccepted: ->DefinatelyNotAcceptedConsidered}
{IvyDealConsidered: ->DefinatelyNotAcceptedConsidered}
{SwitchingOpinionsAccept: ->DefinatelyNotAcceptedConsidered}
{IvyDealDenied: -> DefinatelyNotDenied} 
{SwitchingOpinionsReject: -> DefinatelyNotDenied}

=DefinatelyNotAcceptedConsidered
Bronislav: "I'm definitely not putting Jensen on the paper. He just is not qualified for it."

Ivy looks betrayed.

 Bronislav: "Not qualified for it? Bronislav you said you'd have him on the paper! What's the big deal?"

{SwitchingOpinionsAccept: Ivy: "You keep switching on me, and frankly it's quite disrespectful of my time."}

Ivy: "I cannot believe you right now Bronislav."

{IvyDealAccepted: {HideCharacter("Ivy")}}

{DbInsert("Seen_BI_ReviewPeriod")}
 She storms out. -> DONE
 


=DefinatelyNotDenied

Bronislav: "I'm definitely not putting Jensen on the paper. He just is not qualified for it."


Ivy: "Bronislav he's still an undergrad. It's hard to be 'qualified' for something like this, but is it so hard to give him a chance? Well, I guess since you haven't already, it just might be."


Ivy: "I really thought this would've been a great opportunity for all of us. Hard to say I'm not disappointed Bronislav."

*["Sorry Ivy."]
->BI_RP_SorryIvy

*["Disappointed in me!?" #>> ChangeOpinion Ivy Bronislav ----]
->BI_RP_Disappointed

=== BI_RP_ThanksIvy ===
Bronislav: "Thanks Ivy, it's going to be great working with both of you. I'm really glad we could catch up and hash this out."

Ivy: "Me too Bronislav. I know Jensen is really looking forward to working with you, you'll be a great mentor."

Ivy: "I've got to head out now, but we'll be in touch."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

->DONE

=== BI_RP_TalkToYouLater ===
Bronislav: "I'll talk with you later Ivy."

She waves goodbye as she leaves.

Ivy: "Yep, talk with you later Bronislav."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

-> DONE

=== BI_RP_SoundsGreat ===
Bronislav: "That sounds great Ivy, look forward to hearing from you on how that goes."

IvyL "Speaking of, I've got somewhere to be, but I'll get on that as soon as possible."

She leaves, waving goodbye to you.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

->DONE

=== BI_RP_SorryIvy ===
Bronislav: "I'm sorry Ivy. It just didn't sit right with me after some time, and I feel pretty certain that it won't change anytime soon."

Ivy, dumbfounded, sits in silence for a moment.

Ivy: "I actually don't know what to say. That's... that's just really low Bronislav."

Despite your polite decline, she seems to be quite hurt by the outcome. 

You try to say something else, but she leaves without another word.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

->DONE

=== BI_RP_TalkToHimLater ===
{DbInsert("BI_TellJensen")}
Bronislav: "Yeah, I'll talk with him later. Sorry that things couldn't work out between the three of us. I wish you two the best of luck."

She half-heartedly smiles.

Ivy: "We'll be wishing you luck on your paper Bronislav. Talk to you later."

She leaves, waving goodbye to you.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

->DONE

=== BI_RP_ItsAnIssue ===
Bronislav: "You're disappointed in me? Ivy. I'm disappointed in seeing how low you'd stoop just to get your student false authorship."

Ivy scoffs.

Ivy: "Call it what you want Bronislav, Jensen was just really struggling and I thought that I'd help as much as I can. Nothing more."

She leaves promptly after saying this.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_ReviewPeriod")}

->DONE

=== BI_RP_Disappointed ===

{DbInsert("BI_Blowup")}

Bronislav: "Disappointed in what? In me? For saying to no to what is very obviously a trap? You have just been dangling my own visa issues in front of me to try an make me do what you want, and I'm tired of it."

Ivy looks furious.

Ivy: "How dare you suggest I am trying to trap you! I have been offering help to you in your situation, which you so clearly need, and instead you are spitting on all of my hard work to try and set up something nice for you."

Bronislav: "In exchange for me giving Jensen false authorship on my paper."

Ivy: "Excuse me for asking for a small something in return for my efforts. You really are something Bronislav, I can't believe you."


{HideCharacter("Ivy")}

Ivy storms off, you see other people around you quickly turn their attention back to their screens. 
{DbInsert("Seen_BI_ReviewPeriod")}

-> DONE
