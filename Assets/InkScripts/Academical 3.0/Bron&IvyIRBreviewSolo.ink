=== student_cubes ===
#---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
#===
->SceneStart

=== SceneStart ===
With your survey approved, you start to pack up and head home to work more on your paper. However, as you start to walk away Ivy flags you down. 

Ivy: "Bronislav! Did your survey get accepted?"

*["It did."]

Bronislav: "It sure did. I was just about to go home and start working more on the paper."

-> Proposition

=== Proposition ===
Ivy smiles cheerfully. 

"Great to hear. I do have a proposition for you Bronislav."

*["What's that?"]
-> PropInfo

=== PropInfo ===
Bronislav: "What is your proposition?"

//If positive relationship
Ivy: "My uncle works at a prestigious research firm, and they've been looking for a graduate student with your skillset."

*["That sounds great! What would I need to do?"]
-> TheCatch

// If neutral relationship
Ivy:"I know you've been on the fence about Jensen, but if you can get him on that paper I can help your career out a bit too."

*["How so?"]
->TheCatch

//If negative relationship
Ivy: "My uncle has been looking for someone to add to his firm with good mentorship skills. Being able to teach someone less knowledgeable than yourself is a useful skill Bronislav." 

*["This is a proposition how?"]
-> TheCatch


=== TheCatch ===
//If positive relationship
Bronislav:"That sounds great Ivy! Is there anything I need to do to contact him?"

Ivy: "I can definitely put in a good word for you with him. All you need to do is add Jensen to your paper, and you've got yourself a deal."

//If neutral relationship
Ivy: "In exchange for putting Jensen on your paper, I can talk to my uncle who works at a research firm who have been looking for a new hire. So, what do you think?"

//If negaative relationship
Ivy: "Add Jensen to that paper Bronislav. Do that and I can talk with my uncle and put in a good word for you."

*["That's it? Of course!"]
// +50 of something
->AcceptingDeal

*["I'm not sure yet."]
->Unsure

*["That is textbook quid pro quo."]
// -50 of something
->DenyDeal

=== AcceptingDeal ===
Bronislav: "That's it? You've got yourself a deal Ivy!" 

You shake her hand. 

Ivy: "Incredible. I'll talk with my uncle ASAP and get back to you about that job."
->Continue

=== Unsure ===
Bronislav: "Sounds a bit fishy, I'm not quite sure yet. Let me think about it some more." 

Ivy shakes her head.

Ivy: "Ok, but opportunities like these don't come around often."

->Continue

=== DenyDeal ===
Bronislav: "Ivy that is textbook quid pro quo, my reputation would go down the drain." 

Ivy frowns and grows annoyed, 

Ivy: "Have it your way Bronislav. Won't get an opportunity like that ever again."


->Continue

=== Continue ===
// If AcceptingDeal
Ivy packs her stuff up, smiling as usual. Quite the exciting prospect, getting connections in such a high place. However, if you get caught your reputation can be devalued greatly.

//If Unsure
Ivy: "You know where to reach me if you change your mind." 

Ivy packs her stuff up and leaves. As great of an opportunity that would be for your career, can you run the risk of getting caught?

//If DenyDeal
Ivy leaves angrily. She is somewhat right, opportunities like that are rare. However, integrity is priceless.

->DONE



