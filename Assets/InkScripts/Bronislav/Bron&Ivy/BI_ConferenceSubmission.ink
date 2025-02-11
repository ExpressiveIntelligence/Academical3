=== BI_CONFERENCE_SceneStart ===
# ---
# choiceLabel: Talk with Ivy about the deal.
# hidden: true
# repeatable: false
# tags: action, student_cubes, auxiliary
# ===

{ShowCharacter("Ivy", "left", "")}

{DbInsert("Seen_BI_CONF")}

// TODO: Branching based off of previously saying you'd add Jensen or not
While you are crunching away at your paper, Ivy approaches you.
//if you said you would add Jensen
Ivy: "Hey Bronislav. I know you said you'd put Jensen on the paper. If that's still on the table, allow me to explain my proposal. I've been talking to my uncle about you and I could arrange a meeting with him as well as a recommendation if you put Jensen on the paper. He's excited to meet you, so please, think about it."

*["Thanks Ivy." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->ThanksIvy

*["I've changed my mind."]
->ChangedMyMind

*["I'm not sure yet."]
->NotSureYet

=== ThanksIvy ===
Bronislav: "That's really generous of you. Thank you Ivy. If I get this done in time, I'll be heavily considering adding him to the paper."

Ivy: "Yeah, I just hope Jensen can get into grad school with this and a few more papers under his belt. It's really important to him."

{HideCharacter("Ivy")}

->DONE

=== ChangedMyMind ===

Bronislav: "I'm actually leaning towards no on this, now. I don't feel as though Jensen's feedback is enough now, and with a generous offer from you on the table like this, I think it would be too risky for the both of us."

Ivy: "Aw, c'mon Bronislav, you know how hard it is to get into Grad School."

Ivy sighs.

Ivy: "Jensen needs all the help he can get, wouldn't you have liked help like this back then?"

*["You're right." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->YouAreRight

*["It's hard, but..."]
->ItsHardBut

*["This is Jensen, not me."]
->JensenNotMe

=== YouAreRight ===
Bronislav: "You're right, I would have liked this help back then. I'll mull it over some more, Ivy. You had a rough time getting into grad school too, right? That's why you're sympathizing with Jensen?"

Ivy starts to smile, relieved by this turn of events.

Ivy: "Yeah, it was a struggle getting onto papers, and I feel like Jensen needs the help. Thank you for mulling it over, Bronislav, I've got to go."

{HideCharacter("Ivy")}

->DONE

=== ItsHardBut ===
Bronislav: "It is hard, but I feel like Jensen really just isn't going to hold up to review. His feedback was basic, we'd get caught..."

Ivy interrupts you, clearly you hit a nerve.

Ivy: "Look, if you pull this off, I'll give you that recommendation to my uncle's place. Don't disapoint him." She walks off with a huff.

{HideCharacter("Ivy")}

->DONE

=== JensenNotMe ===
Bronislav: "This is Jensen, not me, Ivy. I worked so hard to get in and he's nowhere near my level that I was when I was his age. The feedback I got from him was the most basic possible, I don't feel like it would hold up."

 Ivy frowns, looking peeved.

 Ivy: "Yeah, but what if it does? Jensen would have his credit, and you would have a recommendation to a job at my Uncle's place."

Ivy sighs, shaking her head.

 Ivy: "Look, just think it over, okay? He's in the same place you were years ago, he may not be 'on your level' or whatever, but he's trying his hardest."

Ivy turns away, heading out.

{HideCharacter("Ivy")}

->DONE

=== NotSureYet ===
Bronislav: "Look, I'm not sure yet Ivy..."

You hesitantly speak up.

Ivy:"Not sure yet? Things are getting a bit close for authorship, Bronislav."

Ivy: "Look, you get Jensen on that paper and I'll see what I can do about getting you that recommendation."

With that, Ivy waves goodbye to you and walks off.

{HideCharacter("Ivy")}

->DONE

// if you did not say you would add Jensen
// TODO: WRITE SELECTORS BASED OFF OF POSTIVE/NEUTRAL/NEGATIVE IVY RELATIONSHIP
// if positive relationship
Ivy: "Hey Bronislav, last time we talked you were really helpful with Jensen. I want to make sure you follow through on that, so I've got an offer for you."

Ivy: "If you put Jensen on the paper, I'll recommend you to my uncle's place and see about getting him to meet you."

*["That's relly helpful."  #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
->ThatsReallyHelpful

*["Thanks, but are you sure?" #>> IncrementRelationshipStat Ivy Bronislav Opinion 20]
->YouSure

*[I'm not sure about this?"]
->ImNotSure

=== ThatsReallyHelpful ===
Bronislav: "That's really helpful, Ivy, I'll need to see how the paper turns out first but if I keep it together, I'm leaning towards putting Jenson on the paper."

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

Ivy: "Hey, no big deal. Just think it over while you're working here, Bronislav."

Ivy waves goodbye, taking her leave briskly.

{HideCharacter("Ivy")}

->DONE

// if neutral or negative relationship
Ivy: "Hey, Bronislav. I know you were not having it last time when we discussed Jensen."

She looks dejected.

Ivy: "So, this time around, I've got a deal for you. You put Jensen on the paper, and I'll see about getting you a job at my uncle's place. Any thoughts?"

*["I'm sorry about what I said."]
->SorryAbtThat

*["That won't help."]
->ThatWontHelp

*["No way."]
->NoWay

=== SorryAbtThat ===
Bronislav: "I'm sorry about what I said regarding Jensen. I'm sure he's a fine guy, he just rubbed me wrong when we first met. I think I'll be putting him on the paper."

Ivy looks slightly relieved.

Ivy: "That actually means a lot to hear you say that, Bronislav. Jensen really needs it, as you've clearly noticed."

With the slight bit of sass, she continues.

Ivy: "For now, keep mulling it over, and be a bit nicer to poor Jensen from now on."

Ivy walks away, not even waving goodbye.

{HideCharacter("Ivy")}

->DONE

=== ThatWontHelp ===
Bronislav: "Look, it won't really help with how the feedback from Jensen is."

You grimace a little.

Bronislav: "As enticing as a job recommendation is, Jensen's feedback is iffy."

Ivy frowns.

Ivy: "Bronislav, you know how much help he needs. Please. Think about it."

Ivy: "I know it might be hard, but you're struggling with gettting a job. Mull it over."

Ivy waves goodbye and leaves without another word.

{HideCharacter("Ivy")}

->DONE

=== NoWay ===
Bronislav: "No way for now, Jensen needs to step it up a notch if he wants my help. We would get caught instantly."

Ivy: "C'mon Bronislav, this is a big oppurtunity for you if you just add him to the paper. You're missing out on a lot."

Ivy frowns and turns away.

Ivy: "Think it over, okay?"

Ivy leaves wordlessly.

{HideCharacter("Ivy")}

->DONE
