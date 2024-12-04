=== student_cubes ===
#---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
#===
->SceneStart

=== SceneStart ===
//TODO: UNFINISHED IN DOC
While you are crunching away at your paper, Ivy approaches you.
//if you said you would add Jensen
Ivy: "Hey Bronislav. I know you said you'd put Jensen on the paper. If that's still on the table, allow me to explain my proposal. I've been talking to my uncle about you and I could arrange a meeting with him as well as a recommendation if you put Jensen on the paper. He's excited to meet you, so please, think about it."

*["Thanks Ivy." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50] 
->ThanksIvy

*["I've changed my mind."]
->ChangedMyMind

=== ThanksIvy ===
Bronislav: "That's really generous of you. Thank you Ivy. If I get this done in time, I'll be heavily considering adding him to the paper."

Ivy: "Yeah, I just hope Jensen can get into grad school with this and a few more papers under his belt. It's really important to him."

->DONE

=== ChangedMyMind ===

Filler Text.

->DONE

//if you considered Ivy's offer
 

