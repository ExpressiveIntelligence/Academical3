=== BI_CONFERENCE_SceneStart ===
# ---
# choiceLabel: Talk with Ivy about the deal.
# hidden: true
# @query
# Seen_BI_IRB
# date.day!3
# @end
# repeatable: false
# tags: action, student_cubes, required
# ===
# Summary: Ivy officially gives the deal to Bronislav 

{ShowCharacter("Ivy", "left", "")}

{DbInsert("Seen_BI_CONF")}

// TODO: Branching based off of previously saying you'd add Jensen or not
While you are crunching away at your paper, Ivy approaches you.
//if you said you would add Jensen
Ivy: "Hey Bronislav. I know you said you'd put Jensen on the paper. If that's still on the table, allow me to explain my proposal."

Ivy: "I've been talking to my uncle about you, and I could arrange a meeting with him as well as a recommendation if you put Jensen as first author on the paper." 

Ivy: "I told him that you are an international student, and he said he would be more than happy to sponsor someone of your talents. He's excited to meet you, so please, think about it."
-> ChoiceOptionsForDeal

=ChoiceOptionsForDeal
*[This could really help me...] -> internalReflectionAddJensen
*[What has Jensen done for authorship...?] -> internalReflectionAddJensen2

*{internalReflectionAddJensen2}["Thanks Ivy." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->ThanksIvy

*{internalReflectionAddJensen2}["I've changed my mind."]
->ChangedMyMind

*{internalReflectionAddJensen2}["I'm not sure yet."]
->NotSureYet

=internalReflectionAddJensen
If you take this offer, it could basically guarentee your job and help with your visa issues. 
->ChoiceOptionsForDeal

=internalReflectionAddJensen2
All he gave was that one piece of feedback, is that enough to be put as first author? 
->ChoiceOptionsForDeal

=== ThanksIvy ===
Bronislav: "That's really generous of you. Thank you Ivy. If I get this done in time, I'll be heavily considering putting him as first author."

Ivy: "Thank you, I just hope Jensen can get into grad school with this and a few more papers under his belt. It's really important to him."

{HideCharacter("Ivy")}

->DONE

=== ChangedMyMind ===

Bronislav: "I'm actually not comfortable with this. I don't feel as though Jensen's feedback is enough, and with a generous offer from you on the table like this, I think it would be too risky for the both of us."

Ivy: "Aw, c'mon Bronislav, you know how hard it is to get into grad school."

Ivy sighs.

Ivy: "Jensen needs all the help he can get, wouldn't you have liked help like this back then?"

*["You're right." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->YouAreRight

*["It's hard, but..."]
->ItsHardBut

*["This is Jensen, not me."]
->JensenNotMe

=== YouAreRight ===
Bronislav: "You're right, I would have liked this help back then. I'll think about it some more, Ivy. You had a rough time getting into grad school back when you were a student too, right? That's why you're sympathizing with Jensen?"

Ivy starts to smile, relieved by this turn of events.

Ivy: "Yeah, back then it was a struggle getting onto papers, and I feel like Jensen needs the help. Thank you for thinking it over, Bronislav, I've got to go."

{HideCharacter("Ivy")}

->DONE

=== ItsHardBut ===
Bronislav: "It is hard, but I feel like Jensen really just isn't going to hold up to review. His feedback was basic, we'd get caught..."

Ivy interrupts you, clearly you hit a nerve.

Ivy: "Look, if you pull this off, I'll give you that recommendation. You and I know both of you need this. Don't disappoint him." 

She walks off with a huff.

{HideCharacter("Ivy")}

->DONE

=== JensenNotMe ===
Bronislav: "This is Jensen, not me, Ivy. I worked so hard to get in and he's nowhere near my level that I was when I was his age. The feedback I got from him was the most basic possible, I don't feel like it would hold up."

 Ivy frowns, looking peeved.

 Ivy: "Yeah, but what if it does? Jensen would have his credit, and you would have not only a recommendation, but a sponsor for your visa which by our conversations, I can tell you desperately need."

Ivy sighs, shaking her head.

 Ivy: "Look, just think it over, okay? He's in the same place you were years ago, and while he may not be 'on your level', but he's trying his hardest."

Ivy turns away, heading out.

{HideCharacter("Ivy")}

->DONE

=== NotSureYet ===
Bronislav: "Look, I'm not sure yet Ivy..."

You hesitantly speak up.

Ivy:"Not sure yet? We are right on the deadline, Bronislav."

Ivy: "Look, you get Jensen on that paper and I'll see what I can do about getting you that recommendation. You get a visa sponsor, and Jensen gets into grad school, it's as simple as that."

With that, Ivy waves goodbye to you and walks off.

{HideCharacter("Ivy")}

->DONE

// if you did not say you would add Jensen
// TODO: WRITE SELECTORS BASED OFF OF POSITIVE/NEUTRAL/NEGATIVE IVY RELATIONSHIP
// if positive relationship
Ivy: "Hey Bronislav, last time we talked you were really helpful with Jensen. I want to make sure you follow through on that, so I've got an offer for you."

Ivy: "If you put Jensen as first author on the paper, I'll recommend you to the firm and see about getting my uncle to meet you."

=ChoiceOptionsForDealPositive
*[This could really help me...] -> internalReflectionPositive
*[What has Jensen done for authorship...?] -> internalReflectionPositive2

*{internalReflectionPositive2}["That's really helpful."  #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->ThatsReallyHelpful

*{internalReflectionPositive2}["Thanks, but are you sure?" #>> IncrementRelationshipStat Ivy Bronislav Opinion 20]
->YouSure

*{internalReflectionPositive2}[I'm not sure about this]
->ImNotSure

=internalReflectionPositive
If you take this offer, it could basically guarentee your job and help with your visa issues. 
->ChoiceOptionsForDealPositive

=internalReflectionPositive2
All he gave was that one piece of feedback, is that enough to be put as first author? 
->ChoiceOptionsForDealPositive

=== ThatsReallyHelpful ===
Bronislav: "That's really helpful, Ivy, I'll need to see how the paper turns out first but if I keep it together, I'm leaning towards putting Jensen on the paper."

Ivy smiles, pleased by this.

Ivy: "Thank you Bronislav, Jensen really needs the help getting into grad school, it's nice to see you being so supportive."

Ivy: "I'll keep in touch, hope to see you again soon!"

Ivy walks off with a pleased pep in her step.

{HideCharacter("Ivy")}

->DONE

=== YouSure ===
Bronislav: "Thank you, Ivy, but are you sure? That's really generous of you but you're kind of sticking your neck out for me on this one."

Ivy cracks a smile at that.

Ivy: "I wouldn't be too worried, you're doing great. If you hold up your end of the bargain, it'll be worth it."

Ivy: "I'll keep in touch, hope to see you again soon!"

Ivy walks off with a pleased pep in her step.

{HideCharacter("Ivy")}

->DONE

=== ImNotSure ===

Bronislav: "I'm not sure about this, Ivy. Now that there's an explicit deal on the table, it feels..."

You try to come up with the words, your altruistic intentions to help Jensen feeling conflicted with your need for a job.

Ivy: "Hey, no big deal. But I would like to remind you that you are running on tight deadline to get those visa issues of yours solved, and I just offered you a lifeline."

Ivy drops her tone.

Ivy: "Just think it over while you're working here, Bronislav."

Ivy waves goodbye, taking her leave briskly.

{HideCharacter("Ivy")}

->DONE

// if neutral or negative relationship
Ivy: "Hey, Bronislav. I know you were not having it last time when we discussed about Jensen."

She looks dejected.

Ivy: "So, this time around, I've got a deal for you. You put Jensen on the paper, and I'll see about getting you that job. Any thoughts?"

=ChoiceOptionsForDealNegative
*[This could really help me...] -> internalReflectionNegative
*[What has Jensen done for authorship...?] -> internalReflectionNegative2

*["I'm sorry about what I said."]
->SorryAbtThat

*["That won't help."]
->ThatWontHelp

*["No way."]
->NoWay

=internalReflectionNegative
If you take this offer, it could basically guarentee your job and help with your visa issues. 
->ChoiceOptionsForDealNegative

=internalReflectionNegative2
All he gave was that one piece of feedback, is that enough to be put as an author? 
->ChoiceOptionsForDealNegative

=== SorryAbtThat ===
Bronislav: "I'm sorry about what I said regarding Jensen. I'm sure he's a fine guy, he just rubbed me wrong when we first met. I think I'll be putting him on the paper."

Ivy looks slightly relieved.

Ivy: "That actually means a lot, Bronislav. Jensen really needs it, as you've clearly noticed."

With the slight bit of sass, she continues.

Ivy: "For now, maybe try being a bit nicer to poor Jensen from now on."

Ivy walks away, not even waving goodbye.

{HideCharacter("Ivy")}

->DONE

=== ThatWontHelp ===
Bronislav: "Look, it won't really help with the feedback he gave."

You smile a little.

Bronislav: "As enticing as a job recommendation is, Jensen's feedback is iffy."

Ivy frowns.

Ivy: "Bronislav, you know how much help he needs. Please. Think about it."

Ivy: "I know it might be hard, but you're struggling with getting a job. And we both know what could happen if you don't find anything. Think it over."

Ivy waves goodbye and leaves without another word.

{HideCharacter("Ivy")}

->DONE

=== NoWay ===
Bronislav: "No way. Jensen would need to step it up a notch if he wants my help. We would get caught instantly."

Ivy: "C'mon Bronislav, this is a big opportunity for you, to secure something you really need, if you just add him to the paper. Think about what you're missing out on by saying no."

Ivy frowns and turns away.

Ivy: "Think it over, okay?"

Ivy leaves wordlessly.

{HideCharacter("Ivy")}

->DONE
