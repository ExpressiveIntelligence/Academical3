=== HJ_ConferenceReviewPeriod_sceneStart ===
# ---
# choiceLabel: Start meeting with Jensen.
# repeatable: false
# @query
# Seen_HJINTRO
# @end
# hidden: true
# tags: action, library, required
# repeatable: false
# ===

// {DbInsert("Seen_HJConferenceReviewPeriod")}

Heading to your office you pass through the library. Snapped from your thoughts you hear your name called. 

// {ShowCharacter("Jensen", "left", "")}

Jensen: "Hello Professor." 

Hendricks: "Oh hello Jensen how are you?" 

Jensen's eyes dart around the room seemingly looking for someone. 

* ["Is something the matter?"]

- You turn your head to where Jensen was previously looking.

Hendricks: "Is something the matter, Jensen?"

Jensen: "No no, I just heard something about Praveen?"

* ["Something about Praveen?"]

- Hendricks: "Something about Praveen, is something wrong?"

Jensen: "Well..."

* ["Take your time."]->HJCRP_TakeYourTime

* [Say nothing.]->HJCRP_SayNothing

== HJCRP_TakeYourTime ==

Hendricks: "Take your time."
 
Jensen: "Thank you. I ended up hearing a rumor from some of my friends."

He seems to think for a second

Jensen: "Apparently Praveen has been leaving bad reviews on a paper."

*["Bad reviews on a paper?"]->HJCRP_BadReviews

== HJCRP_SayNothing ==

Jensen: "Uh well...I heard a rumor from some of my friends that Praveen has been leaving bad reviews on a paper..."

*["Bad reviews on a paper?"]->HJCRP_BadReviews

== HJCRP_BadReviews == 

Hendricks: "Leaving bad reviews? Could you clarify?"

Jensen: "I heard that the reviews he's been leaving are not ones for improvement but straight up dissing the paper itself..."

Hendricks: "I see."

Jensen: "I'm not really sure what specific things are being said, but that's just what I've heard..."

* ["It's no problem, I appreciate you telling me."]

- Hendricks: "Hey, that's okay, don't stress, I appreciate you bringing this to my attention."

Jensen nods his head, a weight off his chest. 

VAR OnPraveenPaper = true

{OnPraveenPaper : 
    * ["How have you been?"]->HJCRP_HowYouBeenOnPaper
    - else: 
    * ["How have you been?"]->HJCRP_HowYouBeenFailedPaper
}

== HJCRP_HowYouBeenOnPaper ==

- Hendricks: "Other than Praveen, how have you been?"

Jensen: "I've been really good actually!"

Hendricks: "Thats great to hear, any particular reason? I know last time we talked about Bronislav?"

Jensen: "Yes, he invited me to join him on the paper!"

* ["I see, I'll need to talk to Bronislav to check up on his progress."]-> HJCRP_CheckProgress

*["That's great! Congratulations!"]->HJCRP_Congratulations


== HJCRP_HowYouBeenFailedPaper ==

- Hendricks: "Other than Praveen, how have you been?"

Jensen: "I've been okay..."

Hendricks: "Any particular reason? I know last time we talked about Bronislav?"

Jensen: "Yes, he decided not to invite me onto the paper..."

Jensen hangs his head.

* ["I see, I'll need to talk to Bronislav to check up on his progress."]-> HJCRP_CheckProgress

*["Try not to feel discouraged, you'll get another chance."]->HJCRP_DontBeDiscouraged

== HJCRP_CheckProgress ==
Hendricks: "I'll need to check up on Bronislav to see the progress on his paper." 

Jensen nods his head

Jensen: "In any case, I wanted to find you to let you know about Praveen."

* ["Thank you, I appreciate you looking out for your friends and Praveen."]->HJCRP_ThanksForLookingOut

== HJCRP_Congratulations ==
Hendricks: "That's great to hear! I hope it goes well!" 

You feel you should check up on Bronislav for the motives behind Jensen's addition.

Jensen: "Thank you I appreciate it! This will look really good for my grad school application!"

* [Smile and nod]->HJCRP_SmileAndNod


== HJCRP_DontBeDiscouraged ==
Hendricks: "Try not to feel discouraged, you'll get another chance."

You feel you should check up on Bronislav to get insight on what happened.

Jensen: "Thanks, I appreciate the sentiment." 

* ["Don't stress too much about grad school, there are more opportunities, and I'm here if you ever need any help."]->HJCRP_DontStress

*["Just keep looking you'll find something."]->HJCRP_JustKeepLooking

== HJCRP_ThanksForLookingOut ==
Hendricks: "Thank you for seeking me out, I appreciate you looking out for your friends and Praveen."

Jensen gives a small nod

Jensen: "Oh I need to get to class but thanks again."

Hendricks: "Of course, enjoy class."

// {HideCharacter("Jensen", "left", "")}
-> DONE

== HJCRP_SmileAndNod ==
You smile and nod

Hendricks: "Just remember there are multiple paths to grad school, but I'm glad you were able to grasp what you were after."

Jensen: "Mhm, oh I need to get to class but I'm glad I ran into you, Professor!"

You smile and wave as he walks off a bad feeling about what Bronislav is up too.

// {HideCharacter("Jensen", "left", "")}
-> DONE

== HJCRP_DontStress ==
Hendricks: "Try not to stress too much about grad school, you have many options towards that path."

Hendrick: "I'm also here if you need help."

Jensen: "Yeah, I know, thank you though."

Jensen: "In any case, I wanted to let you know about Praveen so I'm glad I ran into you."

* ["Thank you, I appreciate you looking out for your friends and Praveen."]->HJCRP_ThanksForLookingOut

== HJCRP_JustKeepLooking ==
Hendricks: "I would keep looking, there are lots of opportunities out there."

Jensen: "Yeah...I know, I'll keep looking."

You smile

Hendricks: "Don't worry too much about grad school there are many routes to get there." 

Jensen: "Alright...oh I need to get to class but I'm glad I got to run into you and chat."

Hendricks: "Me too, have a good class, Jensen." 

// {HideCharacter("Jensen", "left", "")}
-> DONE