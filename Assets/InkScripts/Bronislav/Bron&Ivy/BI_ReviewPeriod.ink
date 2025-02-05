=== lecture_hall ===
#---
# choiceLabel: Go to the lecture hall.
# hidden: true
# tags: location
#===

{SetCurrentLocation("lecture_hall")}

->BI_ReviewPeriod_SceneStart

=== BI_ReviewPeriod_SceneStart ===

After the review of papers at the lecture hall, you sit down and go over the feedback. Ivy approaches you seeing you work on edits. 

Ivy: "Hey Bronislav. Get some helpful feedback?"

*["I did."]
->BI_RP_IDid

*["It was so-so."]
->BI_RP_SoSo

*["Not really."]
->BI_RP_NotReally

// TODO: if negative relationship with Jensen
// NOTE: THIS CURRENTLY ASSUMES PLAYER'S RELATIONSHIP WITH JENSEN IS NEGATIVE
*["Better than Jensen's." #>> DecrRelationshipStat Ivy Bronislav Opinion -5]
->BI_RP_BetterThanJ


=== BI_RP_IDid ===
Bronislav: "Yep! Got some real helpful feedback that I'm editing to the paper right now."

Ivy gives a thumbs up. 

Ivy: "That's great to hear! I know that you are already in the review period, but I just really want to push how helpful Jensen could be for the paper. He's really smart, and well-spoken, and you'd be helping him more than you know."

*["I was planning on it." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 20]
->BI_RP_PlanningOnIt

*["As long as I get something." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 10]
->BI_RP_GetSomething

*["I don't think I will." #>> DecrRelationshipStat Ivy Bronislav Opinionn -5] 
->BI_RP_DontThinkSo

*["Definitely not." #>> DecrRelationshipStat Ivy Bronislav Opinionn -20]
->BI_RP_DefNot

=== BI_RP_SoSo ===
Bronislav: "It was alright, not too great, but there was some helpful feedback."

Ivy shrugs sympathetically. 

Ivy: "I'm sorry to hear that. You know... if you need someone to bounce ideas and feedback off of Jensen is really good for it. All he needs is just a good mentor like yourself!"

*["I was planning on it." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 20]
->BI_RP_PlanningOnIt

*["As long as I get something." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 10]
->BI_RP_GetSomething

*["I don't think I will." #>> DecrRelationshipStat Ivy Bronislav Opinionn -5] 
->BI_RP_DontThinkSo

*["Definitely not." #>> DecrRelationshipStat Ivy Bronislav Opinionn -20]

=== BI_RP_NotReally ===
Bronislav: "Not really, I've been pretty uninterested in all the feedback I have gotten. Hasn't been especially helpful."

Ivy raises her eyebrow. 

Ivy: "O-oh? Well I'm sorry that nothing has been that helpful Bronislav. If I can suggest something, I know Jensen's good with authorship so if you just need some help writing down everything I'm sure Jensen can do that."

*["As long as I get something." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 10]
->BI_RP_GetSomething

*["I don't think I will." #>> DecrRelationshipStat Ivy Bronislav Opinionn -5] 
->BI_RP_DontThinkSo

*["Definitely not." #>> DecrRelationshipStat Ivy Bronislav Opinionn -20]
->BI_RP_DefNot

=== BI_RP_BetterThanJ ===
Bronislav: "Well, the feedback I did get was definitely better than what Jensen gave me week one."
Ivy scoffs. 

Ivy: "Bronislav! He's an undergrad, this is his first time at something like this. Cut him some slack will you?"

She takes a deep breath. 

Ivy: "Look, you don't even need to have Jensen do anything. Just say he was a co-author and I'll leave that offer with my uncle on the table."

*["As long as I get something." #>> IncrementRelationshipStat Ivy Bronislav Opinionn 10]
->BI_RP_GetSomething

*["Definitely not." #>> DecrRelationshipStat Ivy Bronislav Opinionn -20]
->BI_RP_DefNot

=== BI_RP_PlanningOnIt ===
// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper
// Bronislav: "I was planning on adding Jensen actually! He, and you, convinced me enough to add him to the paper."

// Ivy looks estatic hearing you say this. 

// Ivy: "Really!? That's great news Bronislav, you're such a lifesaver. I'll tell Jensen ASAP, and I'll talk to you about my uncle soon hopefully! I might even buy a coffee for you."

// if Bronislav said Jensen would not be on the paper
Bronislav: "I was planning on adding Jensen actually! He, and you, convinced me enough to add him to the paper."

Ivy looks a bit confused, but estatic at the same time.

Ivy: "Wait, really? Oh! That's incredible news. I'll make sure to relay the good news to Jensen, and I'll work something out with my uncle. Keep me updated on how this all goes, and we'll meet once I get this all situated."

*["Thanks Ivy!"]
->BI_RP_ThanksIvy

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater

=== BI_RP_GetSomething ===
// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper
//Bronislav: "As long as I get something out of it you've got yourself a deal Ivy."

//She smiles and nods.

//Ivy: "Of course. This is great news, I'll make sure to tell Jensen and call my uncle for you. After I do that I'll call you for a coffee and we can discuss details further."

// if Bronislav said Jensen would not be on the paper
Bronislav: "As long as I get something out of it you've got yourself a deal Ivy."  

Ivy's shock on her face quickly turns into a smile.

Ivy: "Wait, really? What made you- Nevermind, nevermind. That's great to hear Bronislav! I'll make sure to tell Jensen, I know he'll be surprised! After that I'll see when I can talk with my uncle about getting you that position."

*["Sounds great."]
->BI_RP_SoundsGreat

*["I'll talk to you later then."]
->BI_RP_TalkToYouLater

=== BI_RP_DontThinkSo ===
// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper
//Bronislav: "I just don't think I will Ivy. There's a lot that can go wrong, and I don't want to put all of us at that risk."

//Ivy looks shocked. 

//Ivy: "Y-wh-you what? You... won't? Bronislav, what happened? What changed?"

//She struggles to find words for a moment. 

//Ivy: "So that's it? You just aren't now? You're letting all of these opportunities go because you're scared over a non-issue?"

// if Bronislav said Jensen would not be on the paper
Bronislav: "I just don't think I will Ivy. There's a lot that can go wrong, and I don't want to put all of us at that risk."

Ivy lets out a deep sigh. 

Ivy: "Bronislav, it really isn't that big of an issue I promise. Seems like I can't change your mind anyway. You should personally tell Jensen about it, he'll be upset but it'll be for the best."

*["Sorry Ivy."]
->BI_RP_SorryIvy

//if you said Jensen would be on the paper
//*["It is an issue."]
//->BI_RP_ItsAnIssue

//if you said Jensen would not be on the paper
*["I'll talk to him later."]
->BI_RP_TalkToHimLater

=== BI_RP_DefNot ===
// TODO: selector based off of whether the player said Jensen would be on the paper or not
// NOTE: THIS CURRENTLY ASSUMES THEY SAID NO

// if Bronislav said Jensen would be on the paper
//Bronislav: "I'm definitely not putting Jensen on the paper. He just is not qualified for it."

//Ivy looks betrayed. 

//Bronislav: "Not qualified for it? Bronislav you said you'd have him on the paper! What's the big deal?"

//She grumbles quietly to herself and gets up with her stuff.

//Ivy: "I cannot believe you right now Bronislav. We are going to talk later."

//She storms out of the lecture hall.

//{HideCharacter(“Ivy”)}

//->DONE

// if Bronislav said Jensen would not be on the paper
Bronislav: "I'm definitely not putting Jensen on the paper. He just is not qualified for it."

Ivy frowns. 

Ivy: "Bronislav he's still an undergrad. It's hard to be 'qualified' for something like this, but is it so hard to give him a chance? Well, I guess since you haven't already, it just might be."

Ivy: "I really thought this would've been a great opportunity for all of us. Hard to say I'm not disappointed Bronislav."

*["Sorry Ivy."]
->BI_RP_SorryIvy

*["Disappointed in me?"]
->BI_RP_Disappointed

=== BI_RP_ThanksIvy ===
Bronislav: "Thanks Ivy, it's going to be great working with both of you. I'm really glad we could catch up and hash this out."

Ivy, overjoyed, gets up with her stuff. 

Ivy: "Me too Bronislav. I know Jensen is really looking forward to working with you, you'll be a great mentor."

Ivy: "I've got to head out now, but we'll be in touch."

{HideCharacter(“Ivy”)}

->DONE

=== BI_RP_TalkToYouLater ===
Bronislav: "I'll talk with you later Ivy."

She waves goodbye as she leaves. 

Ivy: "Yep, talk with you later Bronislav."

=== BI_RP_SoundsGreat ===
Bronislav: "That sounds great Ivy, look forward to hearing from you on how that goes."

She packs her things up.

IvyL "Speaking of, I've got somewhere to be, but I'll get on that as soon as possible."

She leaves, waving goodbye to you.

{HideCharacter(“Ivy”)}

->DONE

=== BI_RP_SorryIvy ===
Bronislav: "I'm sorry Ivy. It just didn't sit right with me after some time, and I feel pretty certain that it won't change anytime soon."

Ivy, dumbfounded, sits in silence for a moment. 

Ivy: "I actually don't know what to say. That's... that's just really low Bronislav."

She leaves without another word. 

{HideCharacter(“Ivy”)}

->DONE

=== BI_RP_TalkToHimLater ===
Bronislav: "Yeah, I'll talk with him later. Sorry that things couldn't work out between the three of us. I wish you two the best of luck."

She half-heartedly smiles. 

Ivy: "We'll be wishing you luck on your paper Bronislav. Talk to you later."

She leaves, waving goodbye to you.

{HideCharacter(“Ivy”)}

->DONE

=== BI_RP_ItsAnIssue ===
Bronislav: "You're disappointed in me? Ivy I'm disappointed in seeing how low you'd stoop just to get a friend of yours false authorship."

She lets out a chuckle. 

Ivy: "Call it what you want Bronislav, Jensen was just really struggling and I thought that I'd help as much as I can. Nothing more."

She gets up with her things packed up. 

Ivy: "Nothing more." 

She leaves promptly after saying this.

{HideCharacter(“Ivy”)}

->DONE
