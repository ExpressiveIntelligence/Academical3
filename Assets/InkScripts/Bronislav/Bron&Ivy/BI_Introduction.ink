=== have_coffee_with_ivy ===
#---
# choiceLabel: Have coffee with Ivy.
# @query
# not givenQuidProQuo
# metJensen
# date.day!1
# Seen_BJ_INTRO
# @end
# repeatable: false
# tags: action, cafe, auxiliary
#===
VAR BI_FirstCoffee_InternationalMentioned = false

# Summary: You meet with Ivy at a cafe to catch up. She mentions knowing Jensen and you can bring the relationship down by mentioning Brad's bad talk.

{DbInsert("Seen_BI_Intro")}

-> FirstCoffee

=== FirstCoffee ===

{ShowCharacter("Ivy", "left", "")}

You decide to catch up with one of your peers, Ivy. She sits down across the table from you, setting down her coffee and smiling.

Ivy: "Hey Bronislav. Good to see you again." {ShowCharacter("Ivy", "left", "")}

*["Nice to see you too, Ivy. How have you been?"]
    ->IvyCatchesUp

=== IvyCatchesUp ===
Ivy: "I've been pretty busy, but keeping up with all of it pretty well. How'd the presentation go? Did you meet anyone who could help you on your paper?"

*["Yes! I talked with someone."]
    ->InterestInPaper

*["No, not yet."]
    ->IvyRecommendsJensen

=== InterestInPaper ===
Bronislav: "Yes! After my talk I was approached by someone who had interest in my presentation."

Hearing this she smiles brightly. # >> ChangeOpinion Ivy Bronislav 5

Ivy: "That's great to hear. Did you happen to catch his name?"

*["Jensen."]
    ->JensenByName

== JensenByName ===
Bronislav: "His name was Jensen."

Ivy: "Oh sweet! I know Jensen and he's been having some problems getting into grad school. Being on this paper would be great for him."

*["I see a bit of myself in him."  #>> IncrementRelationshipStat Ivy Bronislav Opinion 5 ]
    ->BronislavSympathizes

*["I wish I could help."]
    ->MoreTime

*["He needs an opportunity more at his level."  #>> DecrRelationshipStat Ivy Bronislav Opinion -10 ]
    ->TooSoon

=== BronislavSympathizes ===

~ temp talkedWithBradAboutJensen = DbAssert("talkedWithBradAboutJensen")
~ BI_FirstCoffee_InternationalMentioned = true 

Bronislav: "Getting into grad school wasn't easy for me either, especially being an international student and all, so I see a bit of myself in him. I'll keep him in mind."

Ivy still very cheerful about the good news is also a bit confused.

Ivy: "Do you have some reservations about Jensen?"

*{talkedWithBradAboutJensen} ["I talked with Brad about Jensen."]
    ->IvySpite

*["It's just too soon."]
    ->TooSoon

=== IvySpite ===
# Should bring down the relationship
Bronislav: "I did also talk with Brad after my presentation, and he felt a bit put off by Jensen."

Ivy's cheerfulness turns to annoyance.

Ivy: "Well Bronislav, I can assure you that there is nothing 'off' about Jensen. He's a good kid, so at least keep him in mind." 

Bronislav: "You seem upset, is everything ok?" 

Ivy: "Everything's fine. I just feel bad for Jensen, it's not right that people are talking bad about him behind his back." 

Bronislav: "No I get it." 

Ivy: "Well I should go for my meeting. Bye." 

Bronislav: "Oh, ok. Bye." 

She leaves the table quickly after saying this.

*[Leave.]
    ->Exit

=== TooSoon ===
{BI_FirstCoffee_InternationalMentioned == true: 
Bronislav:"It just is way too soon to make a call like that. I'd like to talk with a few more people before I start adding people to the paper."

She takes a long sip of her drink.

Ivy: "Well okay then, that is fair. At least consider him, ok?"

-> Continue

} 
{BI_FirstCoffee_InternationalMentioned == false:
Bronislav:"It just is way too soon to make a call like that. This paper is very important to me, as it really helps the possibility of me getting a job and renewing my visa, since I am an international student as you well know."

Bronislav: "I'd really like to talk with a few more people before I start adding people to the paper."

She takes a long sip of her drink.

Ivy: "Well okay then, that is fair. At least consider him, ok?"

-> Continue
}

=== MoreTime ===
Bronislav: "As much as I wish I could help right now, I'm really excited about being able to do this research and I really want to keep my options open. I am really hoping writing this will help me with my job prospects and my visa, especially since I am an international student."

She takes a long sip of her drink.

Ivy: "Well okay then, that is fair. Keep him in mind at least?"

-> Continue

=== IvyRecommendsJensen ==
Bronislav: "No, not yet."

Ivy stirs her coffee.

Ivy: "Well I have a student who is struggling to get into grad school right now named Jensen. Getting on such a big paper would certainly help him."

*["It is just too soon."]
    -> TooSoon

=== Continue ===
She looks down at her watch.

Ivy: "Oh! I actually need to go to a meeting. Thanks for organizing this Bronislav, hope to hear from you again soon."

She waves goodbye and leaves. {HideCharacter("Ivy")}

*[Leave.]
    ->Exit

=== Exit ===

{HideCharacter("Ivy")}

Its getting late, but there's enough time chat a bit more with someone else. 

-> DONE
