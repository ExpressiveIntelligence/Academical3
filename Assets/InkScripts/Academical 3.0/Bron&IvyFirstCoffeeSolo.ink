->cafe
=== cafe ===
#---
# choiceLabel: Go to the Cafe.
# hidden: true
# tags: location
#===
-> FirstCoffee

=== FirstCoffee ===
// # SetBackground *Coffee Shop Background*
After a successful first pitch at the introductory lab meeting, you decide to catch up with one of your peers, Ivy. She sits down across the table from you, setting down her coffee and smiling. 

Ivy: "Hey Bronislav. Happy to see you again."

*["Nice to see you too, Ivy. How've you been?"]
->IvyCatchesUp

=== IvyCatchesUp ===
Ivy: "I've been pretty busy, but keeping up with all of it pretty well. How'd the lab meeting go? Did you meet anyone who could help you on your paper?"

*["Yes! I talked with someone."]
->InterestInPaper

*["No, not yet."]
->IvyRecommendsJensen

=== InterestInPaper ===
Bronislav: "Yes! After my talk I was approached by someone who had interest in my presentation." 

Hearing this she smiles brightly. 

Ivy: "That's great to hear. Did you happen to catch his name?"

*["Jensen."]
->JensenByName

== JensenByName ===
Bronislav: "His name was Jensen."

Ivy: "That's great to hear! I know Jensen and he's been having some problems getting into grad school. Being on this paper would be great for him."

*["I see a bit of myself in him."]
// +50 of something here?
->BronislavSympathizes

*["I wish I could help."]
->MoreTime

*["He needs an opportunity more at his level."]
// -50 of something here?
->TooSoon

=== BronislavSympathizes ===
Bronislav: "Getting into grad school wasn't easy for me either, so I see a bit of myself in him. I'll keep him in mind." 

Ivy still very cheerful about the good news is also a bit confused. 

Ivy: "Do you have some reservations about Jensen?"

*["I talked with Brad about Jensen."]
// Ivy becomes spiteful
->IvySpite

*["It is just too soon."]
->TooSoon

=== IvySpite ===
Bronislav: "I did also talk with Brad after my presentation, and he felt a bit put off by Jensen." 

Ivy's cheerfulness turns to annoyance. 

Ivy: "Well Bronislav, I can assure you that there is nothing 'off' about Jensen. He's a good kid, so at least keep him in mind." 

She leaves the table quickly after saying this.

*[Leave.]
->Exit

=== TooSoon ===
Bronislav:"It just is way too soon to make a call like that. I'd like to talk with a few more people before I start adding people to the paper." 

She takes a long sip of her drink. 

Ivy: "Well ok then, that is fair. At least consider him, ok?" 

-> Continue

=== MoreTime ===
Bronislav: ""As much as I wish I could help right now I just want to keep my options open." 

She takes a long sip of her drink. 

Ivy: "Well ok then, that is fair. Keep him in mind at least?" 

-> Continue

=== IvyRecommendsJensen ==
Bronislav: "No, not yet." 

Ivy stirs her coffee. 

Ivy: "Well I have a friend who is struggling to get into grad school right now named Jensen. Getting on such a big paper would certainly help him."

*["I talked with Brad about Jensen."]
// Ivy becomes spiteful
->IvySpite

*["It is just too soon."]
-> TooSoon

=== Continue ===
She looks down at her watch. 

Ivy: "Oh! I actually need to go to a meeting. Thanks for organizing this Bronislav, hope to hear from you again soon." 

She waves goodbye and leaves.

*[Leave.]
->Exit

=== Exit ===

-> DONE
