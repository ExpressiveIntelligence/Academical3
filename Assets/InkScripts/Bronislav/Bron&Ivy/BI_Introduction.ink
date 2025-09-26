=== have_coffee_with_ivy ===
#---
# choiceLabel: Have coffee with Ivy.
# @query
# date.day!1
# @end
# repeatable: false
# tags: action, cafe, required 
#===
VAR BI_FirstCoffee_InternationalMentioned = false
VAR talkedWithBradAboutJensen = false

# Summary: You meet with Ivy at a cafe to catch up. She mentions knowing Jensen and you can bring the relationship down by mentioning Brad's bad talk.



-> FirstCoffee

=== FirstCoffee ===

~talkedWithBradAboutJensen = DbAssert("BronBradJensenDiscussion")

{ShowCharacter("Ivy", "left", "")}

You decide to catch up with one of your department's professors, Ivy. She sits down across the table from you, setting down her coffee and smiling.

Ivy: "Hey Bronislav. Good to see you again." {ShowCharacter("Ivy", "left", "")}

*["Nice to see you too, Ivy. How have you been?"]
    ->IvyCatchesUp

=== IvyCatchesUp ===
Ivy: "I've been pretty busy, but keeping up with all of it pretty well. How'd you feel about the presentation?" 

Bronislav: "It went pretty well, all things considered!" 

Ivy: "That's great! Did you meet anyone who could help you on your paper?"

*["Yes! I talked with someone." #>> ChangeOpinion Ivy Bronislav +]
    ->InterestInPaper

*["No, not yet." #>> ChangeOpinion Ivy Bronislav -]
    ->IvyRecommendsJensen

=== InterestInPaper ===
Bronislav: "Yes! After my talk I was approached by someone who had interest in my presentation."

Hearing this she smiles brightly.

Ivy: "That's great to hear. Did you happen to catch his name?"

*["Jensen."]
    ->JensenByName

== JensenByName ===
Bronislav: "His name was Jensen."

Ivy: "Oh how funny! That's my nephew! He's been having some problems transfering from his masters to a Ph.D program. Being on this paper would be great for him."

*["I see a bit of myself in him."  #>> ChangeOpinion Ivy Bronislav ++]
    ->BronislavSympathizes

*["I wish I could help."]
    ->MoreTime

*["He needs an opportunity more at his level."  #>> ChangeOpinion Ivy Bronislav -]
    ->TooSoon

=== BronislavSympathizes ===

Bronislav: "Getting into this program wasn't easy for me either, especially being an international student and all, so I see a bit of myself in him. I'll keep him in mind."

Ivy, while very cheerful about the good news, is also confused.

Ivy: "Do you have some reservations about Jensen?"

-> BronislavSympathizesChoices

==BronislavSympathizesChoices==

*{talkedWithBradAboutJensen}["I talked with Brad about Jensen." #>> ChangeOpinion Ivy Bronislav ---]
    ->IvySpite
    
*{not talkedWithBradAboutJensen}[It's not me who has reservations...] -> BradExpositionLoop

*["It's just too soon." #>> ChangeOpinion Ivy Bronislav -]
    ->Continue
    
==BradExpositionLoop==
You recall hearing a common rumor in the lab of him being "shady" and "off". 
{talkedWithBradAboutJensen: You recall Brad being one of those people adding to the rumor, but who's to say this is really a "rumor"} 
{not talkedWithBradAboutJensen: You're not sure why, or who is spreading this information.}
-> BronislavSympathizesChoices

=== IvySpite ===
Bronislav: "I did also talk with Brad after my presentation, and he felt a bit put off by Jensen."

Ivy's cheerfulness turns to annoyance.

Ivy: "Well Bronislav, I can assure you that there is nothing 'off' about Jensen. He's a good kid, so at least keep him in mind." 

Bronislav: "You seem upset, is everything ok?" 

Ivy: "Everything's fine. I just feel bad for Jensen, it's not right that people are talking bad about him behind his back." 

Bronislav: "No I get it." 

Ivy: "Well I should go for my meeting. Bye." 

Bronislav: "Oh, ok. Bye." 

She leaves the table quickly after saying this.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Intro")}
    ->DONE

=== TooSoon ===
{BI_FirstCoffee_InternationalMentioned == true: 
Bronislav:"It just is way too soon to make a call like that. I'd like to talk with a few more people before I start adding people to the paper."

She takes a long sip of her drink.

Ivy: "Do you have some reservations about Jensen?"

-> BronislavSympathizesChoices

} 
{BI_FirstCoffee_InternationalMentioned == false:
Bronislav:"It just is way too soon to make a call like that. This paper is very important to me, as it really helps the possibility of me getting a job and renewing my visa."

Bronislav: "I'd really like to talk with a few more people before I start adding people to the paper."

She takes a long sip of her drink.

Ivy: "Do you have some reservations about Jensen?"

-> BronislavSympathizesChoices
}

=== MoreTime ===
Bronislav: "As much as I wish I could help right now, I'm really excited about being able to do this research and I really want to keep my options open. I am really hoping writing this will help me with my job prospects and my visa, especially since I am an international student."

She takes a long sip of her drink.

Ivy: "Do you have some reservations about Jensen?"

-> BronislavSympathizesChoices


=== IvyRecommendsJensen ==
Bronislav: "No, not yet."

Ivy stirs her coffee.

Ivy: "Well, I thought I saw you talking to my nephew Jensen. He is having alot of trouble transferring from his masters into a Ph.D program. Getting on such a big paper would certainly help him."

~ temp JensenOpinion = GetOpinionState("Jensen", "Bronislav")
{JensenOpinion <= OpinionState.Neutral: Ivy: "But it looked like you seemed to have shrugged him off pretty quickly, he was a bit upset."} 

Ivy: "Do you have some reservations about Jensen?"

*{talkedWithBradAboutJensen} ["I talked with Brad about Jensen." #>> ChangeOpinion Ivy Bronislav ---]
    ->IvySpite
    
*[It's not me who has reservations...] -> BradExpositionLoop

*["It's just too soon." #>> ChangeOpinion Ivy Bronislav +]
    ->Continue

=== Continue ===
Bronislav:"It just is way too soon to make a call like that. This paper is very important to me, as it really helps the possibility of me getting a job and renewing my visa."

Ivy: "I can respect that." 

She looks down at her watch.

Ivy: "Oh! I actually need to go to a meeting. Thanks for organizing this Bronislav, hope to hear from you again soon."

Bronislav: "Ok! See you later!" 

She waves goodbye and leaves. 
{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Intro")}
    ->DONE

