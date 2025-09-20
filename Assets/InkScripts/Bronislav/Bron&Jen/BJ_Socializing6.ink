@ -1,211 +0,0 @@
=== BJ_S6_SceneStart ===
# ---
# choiceLabel: Meet with Jensen
# @query
# Seen_BJS5
# date.day!6
# @end
# hidden: true
# tags: action, library, auxiliary
# ===

# Summary: You give a quick chat to Jensen about what he's currently doing. 


{ShowCharacter("Jensen", "left", "")}

// TODO: WRITE SELECTORS BASED OFF OF JENSEN WORKING ON THE PAPER OR NOT
//if Jensen worked on the paper
// TODO: WRITE SELECTORS BASED OFF OF POSTIVE/NEUTRAL/NEGATIVE IVY RELATIONSHIP
//if positive relationship

{IvyAcceptedOfficial: -> JensenDealAcceptedSocial6} 
{IvyDeniedOfficial: -> JensenDealDeniedSocial6} 

===JensenDealAcceptedSocial6===

~ temp jensenOpinion = GetOpinionState("Jensen", "Bronislav")
{jensenOpinion >= OpinionState.Good: -> goodJensenAcceptedSocial6} 
{jensenOpinion >= OpinionState.Neutral && jensenOpinion < OpinionState.Good: -> neutralJensenAcceptedSocial6} 
{jensenOpinion < OpinionState.Neutral: -> badJensenAcceptedSocial6}

===goodJensenAcceptedSocial6===

You run into Jensen grabbing a coffee. He sees you and gives you a quick wave, but looks down at the floor.

*["Are you doing okay?"]
->AreYouDoingOkay

*["We should have expected this." #>> ChangeOpinion Jensen Bronislav --]
->WeShouldHaveExpected

===neutralJensenAcceptedSocial6===
You run into Jensen grabbing a coffee. He sees you and looks back down at the floor quickly.
*["How are you doing?"]
->HowAreYou

*["We should have expected this."]
->WeShouldHaveExpected

===badJensenAcceptedSocial6===
You run into Jensen grabbing a coffee. He sees you, grimaces, and then looks down at the floor.

*[Can we talk?]
->CanWeTalk

*["We should have expected this."]
->WeShouldHaveExpected

=== AreYouDoingOkay ===

Bronislav: "Hey Jensen, are you doing ok?"

He sighs.

Jensen: "Not really no. Ever since Ned removed me from the lab meetings, all of my applications have gone about how I suspected them to. I appreciate your effort to help me though Bronislav, I really do."

*["I hope things get better." #>> ChangeOpinion Jensen Bronislav ++]
->HopeThingsGetBetter

*["See you later."]
->SeeYouLater

*["I can't blame them." #>> ChangeOpinion Jensen Bronislav --]
->CantBlameThem

=== HopeThingsGetBetter ===
Bronislav: "Sorry with how everything turned out Jensen. I hope things get better for you, and you keep putting in work."

You reach out your hand, and he shakes it firmly.

Jensen: "I hope the same for you, Bronislav, I'll see you when I see you."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

=== SeeYouLater ===
Bronislav: "I'll see you later Jensen, whenever that is."

Jensen chuckles a bit.

Jensen: "Yeah, whenever that is."

You walk out of the cafe, waving goodbye and Jensen waves back.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

=== CantBlameThem ===
Bronislav: "I can't say I blame them Jensen. Sorry, but, that's life. Hopefully you learn from this."

Jensen looks confused.

Jensen: "I- what? Hopefully I..."

He looks heartbroken.

Jensen: "Yeah, thanks Bronislav..." 

He takes his coffee and leaves begrudgingly.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

=== HowAreYou ===
Bronislav: "How are you doing Jensen?"

Jensen: "I'm not doing the best Bronislav. My application is getting denied everywhere even with the paper. It really, really sucks."

*["I hope things get better." #>> ChangeOpinion Jensen Bronislav ++]
->HopeThingsGetBetter

*["See you later."]
->SeeYouLater

*["I can't blame them." #>> ChangeOpinion Jensen Bronislav --]
->CantBlameThem

=== CanWeTalk ===
Bronislav: "Hey Jensen, can we talk?"

Jensen scoffs.

Jensen: "There isn't much to talk about Bronislav. My application is getting me nowhere ever since Ned removed me from the lab meetings, and I'm just really frustrated."

*["I'll leave you alone."]
->LeaveYouAlone

*["I can't blame them." #>> ChangeOpinion Jensen Bronislav --]
->CantBlameThem

=== LeaveYouAlone ===
Bronislav: "I'll just leave you alone then. Hope you have a good rest of your day."

Jensen: "Right. Thanks, you too Bronislav..."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

=== WeShouldHaveExpected ===
Bronislav: "We really should have expected this Jensen. I should've trusted my intuition to stay away from this."

Jensen: "Maybe we both should have Bronislav."

He takes his coffee.

Jensen: "Not like we can change it now, my application is getting declined everywhere anyway. I just need to take a break I think."

He walks out of the cafe without another word, or wave.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

// if Jensen was not on the paper
// TODO: WRITE SELECTORS BASED OFF OF POSTIVE/NEUTRAL/NEGATIVE IVY RELATIONSHIP

===JensenDealDeniedSocial6===

You walk around and see Jensen typing away at his laptop.

He looks up and notices you as well, waving at you.

*["What are you up to?"]
->WhatAreYouUpTo

*["Now you want to put in the work." #>> ChangeOpinion Jensen Bronislav --]
->NowYouPutInTheWork

=== WhatAreYouUpTo ===
Bronislav: "Hey Jensen, what are you up to?"

Jensen: "Well I've been doing some coursework and I've been talking some more with Ivy. Nothing bad, just about getting more experience so I could actually get on a paper on my own merit."

*["That's great to hear!"]
->ThatsGreat

*["Now you want to put in the work." #>> ChangeOpinion Jensen Bronislav --]
->NowYouPutInTheWork

=== ThatsGreat ===
Bronislav: "Wow! That's great to hear Jensen, determination is a good quality to have. I'm sure you'll find something, if not work on your own paper."

He seems surprised, and happy to hear you say this.

Jensen: "Really Bronislav? You think so? Well, I'd have to thank you for giving me the determination to work harder."

He takes a sip of some coffee.

Jennsen: "Alright, while I'd love to talk more I do need to finish this work for class, so I'll see you later Bronislav."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE

=== NowYouPutInTheWork ===
You laugh a bit at him saying this.

Bronislav: "Oh, so now you want to put in the work Jensen?"

He shuffles in his seat, and is upset to hear you say this.

Jensen: "I mean I've got to at some point right Bronislav? How else can I impress someone as prestigious as yourself."

He says prestigious in a mocking way.

Jensen: "Well I've got to do my work now, I'll see you later Bronislav."

He waves you goodbye before you can get another word out.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS6")}
->DONE
