=== Seen_BPS6_SceneStart ===
# ---
# choiceLabel: Approach Praveen 
# @query
# Seen_BPS3
# date.day!6
# @end
# hidden: true
# tags: action, cafe, required
# ===



{ShowCharacter("Praveen", "left", "")}

You spot Praveen, who seems more gloomy than confident. 

Bronislav: "Hey Praveen, why the long face?"

He gives an almost forced smile. 

Praveen: "I got, got..."

*["You got...got?"]->BPS6_YouGotGot
*["What....?"]->BPS6_What
*["You're odd."]->BPS6_YoureOdd
== BPS6_YouGotGot ==
Bronislav: "You got...got...what...?"

Praveen: "Haha, yeah..."

You pull up a chair raising an eyebrow.

Praveen: "Alright alright, I'll stop kidding around. Long story short I'm no longer an editor."

~ temp PraveenOpinion = GetOpinionState("Praveen", "Bronislav")

{
    - PraveenOpinion >= OpinionState.Good: -> PositiveChoices
    - PraveenOpinion >= OpinionState.Neutral: -> NeutralChoices
    - PraveenOpinion <= OpinionState.Bad: -> BadChoices
} 

=PositiveChoices
*["What happened?"]->BPS6_WhatHappened
*["Oh wow..."] ->BPS6_OhWowPos

=NeutralChoices
*["What happened?"]->BPS6_WhatHappened
*["Oh wow..."] ->BPS6_OhWowNeut

=BadChoices
*["What happened?"]->BPS6_WhatHappened
*["Oh wow..."] ->BPS6_OhWowNeg

== BPS6_What ==
Bronislav: "What...?"

Praveen: "You know, I got taken off as an editor."

You pull up a chair nodding your head for him to continue. 

Praveen: "Alright, I got you...in a more serious tone, the power got to my head a little."



~ temp PraveenOpinion = GetOpinionState("Praveen", "Bronislav")

{
    - PraveenOpinion >= OpinionState.Good: -> PositiveChoices
    - PraveenOpinion >= OpinionState.Neutral: -> NeutralChoices
    - PraveenOpinion <= OpinionState.Bad: -> BadChoices
} 

=PositiveChoices
*["So you let your ego take over again..." #>> ChangeOpinion Praveen Bronislav ---]->BPS6_SoYouLetEgo
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav +]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowPos

=NeutralChoices
*["So you let your ego take over again..." #>> ChangeOpinion Praveen Bronislav ---]->BPS6_SoYouLetEgo
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav + ]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowNeut

=BadChoices
*["So you let your ego take over again..." #>> ChangeOpinion Praveen Bronislav ---]->BPS6_SoYouLetEgo
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav +]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowNeg

== BPS6_SoYouLetEgo ==
Bronislav: "So you let your ego take over again..."

Praveen: "Not funny Bronislav, that's quite childish."

Bronislav: "You're right sorry."

Praveen sighs

Praveen: "Look, I know we've both had our struggles this year, but we must learn our lessons now. Writing papers takes a lot of work, and I overlooked that fact. I was trusted with confidentiality and respect, and I violated both of them."

*["It takes a lot to admit to that."]->BPS6_ItTakesALot

== BPS6_SorryToHearThat ==
Bronislav: "I'm sorry to hear that..."

Praveen: "It's nothing to fuss over, it is my own wrong doing that resulted in this."

*["It takes a lot to admit to that."]->BPS6_ItTakesALot
*["I think we've all learned some lessons this year..."]->BPS6_LearnedLessons

== BPS6_WhatHappened ==
Bronislav: "What happened?"

Praveen: "Well...I messed up, and Hendricks took me off the editing job."

~ temp PraveenOpinion = GetOpinionState("Praveen", "Bronislav")

{
    - PraveenOpinion >= OpinionState.Good: -> PositiveChoices
    - PraveenOpinion >= OpinionState.Neutral: -> NeutralChoices
    - PraveenOpinion <= OpinionState.Bad: -> BadChoices
} 

=PositiveChoices
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav +]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowPos

=NeutralChoices
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav + ]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowNeut

=BadChoices
*["I'm sorry to hear that..." #>> ChangeOpinion Praveen Bronislav +]->BPS6_SorryToHearThat
*["Oh wow..."] ->BPS6_OhWowNeg



== BPS6_OhWowPos ==

Bronislav: "Oh wow, I see."

Praveen: "I may have underestimated the responsibility I had in my hands."

Praveen: "Writing papers takes time and effort and I took that for granted.I harshly criticised others' work and stole ideas for my own."" 

*["It takes a lot to admit to that."]->BPS6_ItTakesALot
*["I think we've all learned some lessons this year..."]->BPS6_LearnedLessons


== BPS6_OhWowNeut ==

Bronislav: "Oh wow, I see."

Praveen: 'Writing papers takes a lot of work, I just need to be more self conscious of that."

*["It takes a lot to admit to that."]->BPS6_ItTakesALot
*["I think we've all learned some lessons this year..."]->BPS6_LearnedLessons

== BPS6_OhWowNeg ==

Bronislav: "Oh wow, I see."

Praveen: "Yeah...well, anyways I have some stuff to work on, so I'll catch you later."

Bronislav: "Oh alright, bye."

Praveen grabs his drink and gets up, striding off.->BPS6_HidePravAndEnd


== BPS6_ItTakesALot ==
Bronislav: "It takes a lot to admit to that Praveen."

Praveen: "Thank you, but I don't think either of us needs praise for something like that."

Bronislav: "Yeah."

Praveen: "Well, the only way forward is to get back up. We must all learn our lesson, and respect those around us."
*[Nod your head]->BPS6_Nod

== BPS6_Nod ==
You give a nod of your head. 

Bronislav: "It's time I paid more attention to the rules so I don't end up in a mix-up again."

Praveen: "Same here."

Praveen: "Well I gotta head out now, see ya Bronislav."

Praveen gathers his things bidding you a farewell as he takes his leave. ->BPS6_HidePravAndEnd

== BPS6_LearnedLessons ==
Bronislav: "I think we've all learned some lessons this year..."

Praveen: "Yes indeed. But we can only move forward, one hiccup is not the end."

Praveen shuffles his things.

Praveen: "Well it's time for me to take my leave. I got some work to do."

Praveen swings his backpack over his shoulder and picks up his coffee. 

Praveen: "See ya."

Bronislav: "See ya Praveen."->BPS6_HidePravAndEnd

== BPS6_YoureOdd ==
Bronislav: "Well you're as odd as ever."

Praveen: "Ouch I'm wounded..."

He looks down a little.

Praveen: "I messed up."

*["What do you mean?"]->BPS6_WhatDoYouMean

*["This just occurred to you?"]->BPS6_ThisJustOccuredToYou// TODO RELATIONSHIP -20

== BPS6_WhatDoYouMean ==
Bronislav: "What do you mean, you messed up..."

Praveen: "I may have underestimated the responsibility I had in my hands."

Praveen: "Writing papers takes time and effort, and I took that for granted. I was trusted with confidentiality and respect, and I violated both of them." 

*["It takes a lot to admit to that."]->BPS6_ItTakesALot
*["I think we've all learned some lessons this year..."]->BPS6_LearnedLessons

== BPS6_ThisJustOccuredToYou ==
Bronislav: "And this just occurred to you...?"

Praveen: "Bronislav..."

Bronislav: "Sorry...nows not the time."

Praveen gives you a side-eye.

Praveen: "Look both you and me have struggled this year, but I take we've both learned our lessons."

*["Yes, indeed."]->BPS6_YesIndeed

== BPS6_YesIndeed ==
Bronislav: 'Yes indeed, I didn't pay much mind to ethics till now."

Praveen chuckles a bit

Praveen: "Looks like you also got some ego in you too."

Bronislav: "Yeah yeah..."

Praveen: "Oh shoot, I gotta head out."

Praveen packs up his things, swings his backpack over his back, and grabs his coffee.

Praveen: "Well I'll see ya."

Bronislav: "Bye Praveen, see ya."->BPS6_HidePravAndEnd

== BPS6_HidePravAndEnd ==
{HideCharacter("Praveen")}
{DbInsert("Seen_BPS6")}
->DONE