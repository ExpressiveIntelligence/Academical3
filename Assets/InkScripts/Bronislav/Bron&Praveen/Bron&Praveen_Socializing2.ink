// Wishes Hendricks would ask to help with conference 
// Tell Praveen he will put in a good word for him or not

VAR BP_Suggestion = false
VAR BP_S2_Pretentious = false
//=== student_cubes ===
//#---
//# choiceLabel: Go to the student cubes
//# hidden: true
//# tags: location
//#===

//{SetCurrentLocation("student_cubes")}

->BP_Socializing2_SceneStart

=== BP_Socializing2_SceneStart ===

You notice your friend Praveen working at his desk in the lab and decide to talk to him. It's been a while since you two have talked.

Bronislav: "Hey Praveen, what are you working on?"

Praveen: "Oh hey Bronislav."

He pushes aside his laptop.

Praveen: "I was just working on this paper on the multitude of perspectives regarding the influence of AI in various technological fields. Convulted, I know, but nevertheless I am tackling it."

*["Oh, nice." ]
->BP_Socializing2_OhNice

*["Well, that sounds like a lot." #>> IncrementRelationshipStat Praveen Bronislav 5]
->BP_Socializing2_SoundsLikeALot

*["As pretentious as ever." #>> DecrRelationshipStat Praveen Bronislav 10]
->BP_Socializing2_AsPretentious

=== BP_Socializing2_OhNice ===
Bronislav: "Oh, nice. Sounds interesting."

Praveen: "Endlessly so, but enough about me. How have you been doing?"

*["I've had a lot on my plate as well."]
->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_SoundsLikeALot ===
Bronislav: "Well, that sounds like a lot of work."

Praveen becomes excited that you think something he's working on is difficult.

Praveen: "Yes, it is, but I am managing. But enough about me, how have you been doing?"

*["I've had a lot on my plate as well."]
->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_AsPretentious ===
Bronislav: "As pretentious as ever I see."

You say with an unmasked eye roll.

Praveen: "Ouch. And here I hoped that you were less pretentious than you used to be. Whatever, you clearly didn't come over here to talk about me. How have you been doing?"

*["I've had a lot on my plate as well."  #>> DecrRelationshipStat Praveen Bronislav 5]
~ BP_S2_Pretentious = true
Bronislav: "I've had a lot on my plate. I just finished getting my own paper ready for IRB review." 

Praveen: "I'm not surprised that's keeping you busy. You probably are getting plenty of pushback knowing your tendency to work alone. Hendricks certainly never helps matters."

->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_LotOnMyPlate ===
{ BP_S2_Pretentious == false:
Bronislav: "I've had a lot on my plate. I just finished getting my own paper ready for IRB review." 

Praveen: "Oh wow, that is a lot. Hopefully the stress hasn't been too much for you. Hendricks certainly never helps matters."
}

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_PrettyGood ===
Bronislav: "I've been pretty good overall. I just finished getting my own paper ready for IRB review." 

Praveen: "Oh, I see. Well, good luck with that. And hopefully you can get more help from Hendricks than I have been able to."

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_CouldBeBetter ===
Bronislav: "Things could be better for sure. I just finished getting my own paper ready for IRB review, but I have been busy working on everything else I have been neglecting."

Praveen: "That is certainly a lot, especially when you can't exactly expect too much help from Hendricks."

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_NotStressed ===
Bronislav: "Ehh... I'm not too stressed honestly. I just got to jump through all the hoops and I'll be fine."

Praveen: "So Hendricks is going to help you then?"

*["I'd assume so."]
->BP_Socializing2_ShesMyAdvisor

*["Why are you so interested in talking about Hendricks?"]
->BP_Socializing2_InterestedHendricks

=== BP_Socializing2_ShesMyAdvisor ===
Bronislav: "She's my advisor, so I'd assume I will receive feedback from her, yes."

Praveen groans as he spins in his chair.

Praveen: "Why is she helpful to everyone else besides me?"

*["I'm not sure I follow."]
->BP_Socializing2_NotSureIFollow

*["What are you whinning about?"  #>> DecrRelationshipStat Praveen Bronislav 5]
->BP_Socializing2_Whinning

=== BP_Socializing2_InterestedHendricks ===
Bronislav: "Why are you so interested in talking about Hendricks?"

Praveen slumps over at his desk dramatically.

Praveen: "It's not that I'm super interested in talking about her, I just..."

Bronislav: "Yes?"

Praveen: "I really wish Hendricks would ask me to help with the conference. I have been subtly trying to suggest she include me in it, but honestly, I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_ShesNotAProblem ===
Bronislav: "Hendricks? How is she a problem?"

Praveen slumps over at his desk dramatically.

Praveen: "It's not that she's a problem... it's just..."

Bronislav: "It's just what?"

Praveen sighs as he looks over at you.

Praveen: "I really wish Hendricks would ask me to help with the conference. I have been subtly trying to suggest she include me in it, but honestly, I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_HendricksHelpful ===
Bronislav: "Hendricks has been nothing but helpful to me, Praveen. I'm not sure what you're issue is, but maybe it's a bit unfounded."

Praveen: "I don't have an issue with her..."

Bronislav: "But?"

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "But I really wish Hendricks would ask me to help with the conference. I have been subtly trying to suggest she include me in it, but honestly, I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_NotSureIFollow ===
Bronislav: "I'm not sure I follow."

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "Look, I just really wish Hendricks would ask me to help with the conference. I have been subtly trying to suggest she include me in it, but honestly, I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_Whinning ===
Bronislav: "What are you whinning about? Get yourself together, Praveen."

Praveen: "Easy for you to say, you're clearly a favorite of hers."

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "It's just... I really wish Hendricks would ask me to help with the conference. I have been subtly trying to suggest she include me in it, but honestly, I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_Suggestion ====
// TODO: create Suggestion setter branch here and finish up this dialogue
It's clear by the way....to be continued.

->DONE

