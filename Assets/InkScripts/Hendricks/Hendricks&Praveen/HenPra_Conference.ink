=== HP_CON_SceneStart ===
# ---
# choiceLabel: Meet with Praveen about Conference
# @query
# Seen_HPCON
# @end
# hidden: true
# tags: action, office, auxiliary
# ===

// {DbInsert("Seen_HPCON")}

// {ShowCharacter("Praveen", "left", "")}

As you watched the clock tick, you awaited your appointment with Praveen. 

Per your promise, you had found an opportunity for him as a peer review writer. 

After a few more minutes a familiar knock is heard at the door.

*["Come in!"]

- Hendricks: "Come in."

Praveen steps inside as the door opens, giving you a slight nod, his usual greeting. 

With a motion of your hand, he sits in front of your desk.

Hendricks: "Hello Praveen, how have you been?"

He shrugs his shoulders.

Praveen: "Unfortunately I've had no luck so far." 


*["Tell me more?"]

- Hendricks: "Would you mind telling me a little more?"

Praveen: "I've looked into getting on several papers, but haven't been able to get myself on any of them.

*["That is okay, if I recall you were looking into getting on a paper as well as become more involved with the community?"]

- Hendricks: "That is okay. Try not to stress too much."

Hendricks: "If I recall correctly you were looking into getting on a paper and becoming more involved with the community. Have you ever thought of combining these?"

Praveen: "Combining them?"

Hendricks: "If you remember our previous meeting I promised to look into some opportunities for you."

Praveen: "Yes I recall, have you had any luck?"

*["I have, would you like to be a peer reviewer?"] -> OfferPraOpportunity

*["Yes I have, however, would you prefer to look on your own first?"] -> OfferPraIndependence


== OfferPraOpportunity ==
Hendricks: "Yes I have, would you like to be put on papers as a peer reviewer?

Praveen: "That would be greatly appreciated. As a graduate student, I have a great deal of experience!"

You nod your head.

Hendricks: "Yes I've looked into some of your work and believe this would be the best option for you." 

Praveen sits back in his chair, seeming to have a weight lifted off his chest.

Hendricks: "There will be an email sent to you with your first assignment, if you run into any problems you can always come to me."

Praveen gives a nod.

*["Is there anything else going on at the moment?"] -> AnythingElseGoingOn

== AnythingElseGoingOn ==
Hendricks: "Is there anything else you would like to talk about?"

Praveen: "Not at the moment, everything else is going wonderfully"

Hendricks: "That's great to hear."

Praveen looks at the time before he stands from his seat grabbing his bag.

Praveen: "I appreciate your time, I'll check in with you soon." 

Hendricks: "See you soon, keep an eye out, your email will have your first assignment."

Praveen nods his head as he steps out of the office.

// {HideCharacter("Praveen")}

-> DONE


== OfferPraIndependence ==
Praveen thinks for a moment as he runs his hand through his hair.

Praveen: "I appreciate your faith in me, however, I believe I've reached the limit of my search I must admit."

You give a nod of your head 

Hendricks: "Thank you for your honesty. With that, would you like to be added to papers as a peer reviewer?"

Praveen: "That would be immensely appreciated. I will make sure to provide good feedback. As a graduate student, I have a great deal of experience!"

*[I believe this is the best option for you.]

- Hendricks: "Yes I've looked into some of your work and believe this would be the best option for you." 

Praveen sits back in his chair, seeming to have a weight lifted off his chest.

Hendricks: "There will be an email sent to you with your first assignment, if you run into any problems you can always come to me."

Praveen gives a nod.

-> AnythingElseGoingOn