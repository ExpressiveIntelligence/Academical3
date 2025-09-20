/*

This file contains dialogue for the socializing 5 conversation
between Bronislav and Jensen. This scene takes place in the
library after ... <TODO:: WHEN DOES THIS HAPPEN??>.

*/


=== BJS5_Start ===
# ---
# choiceLabel: Talk to Jensen
# @query
# IvyDealAccepted
# Seen_BJS3
# date.day!5
# @end
# hidden: true
# tags: action, library, required
# ===
# Summary: Jensen asks to meet at the conference to talk about his feelings of the outcome. 



{ShowCharacter("Jensen", "left", "")}

{DbInsert("Seen_BJ_CONF")}

~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

~SwitchingOpinionsReject = DbAssert("BI_SwitchingOpinions_Reject")

~SwitchingOpinionsAccept = DbAssert("BI_SwitchingOpinions_Accept")

~BlowUp = DbAssert ("BI_Blowup")

{IvyAcceptedOfficial: -> JensenNormalRoute} 
{IvyDeniedOfficial: -> BJS5_Start_Alt_1} 
{BlowUp: -> JensenIgnore_Social5}

===JensenIgnore_Social5===
You wave at Jensen from across the room, but he doesn't even acknowledge you. 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
->DONE

===JensenNormalRoute===

Jensen texted you earlier today saying he wanted to talk to you about something.

You walk up you see him on his phone. He quickly puts it away once he sees you, waving briefly.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey, Bronislav! Glad you you could come here on pretty short notice. How's your day been?"

* {IvyAcceptedOfficial}["It's been good"]
    -> BJS5_ItsBeenGood
* ["Could be better"]

    Bronislav: "I could be better."

    -> BJS5_NeedHelpWithAnything
* ["What did you want me here for, Jensen?"]

    Bronislav: "What do you want?"

    -> BJS5_NeedHelpWithAnything

=== BJS5_ItsBeenGood ===

Bronislav: "It's been pretty good. Got off a call with Ivy earlier today, and it sounds like she'll recommend me for the job position!"

Jensen gives you a little round of applause.

Jensen: "Well, congratulations, Bronislav!"

Jensen: "I'm really glad things have worked our for all of us."

Jensen: "I'm just happy to finally have something to put on my CV. You're a lifesaver!"

* ["Need help with anything?"]
    -> BJS5_NeedHelpWithAnything
* ["Anything else you want to talk about?"]
    -> BJS5_AnythingElseYouWantToTalkAbout

=== BJS5_NeedHelpWithAnything ===

Jensen: "Oh, right!"

Jensen: "I do need some help if you've got a moment."

* [Help Jensen]
    -> BJS5_HelpJensen

=== BJS5_AnythingElseYouWantToTalkAbout ===

Bronislav: "No worries. Was there something else you wanted to talk about?"

Jensen thinks for a minute.

Jensen: "Oh yeah! I saw you talking to that one guy at the conference. What was his name...?"

* ["Brad?"]
    -> BJS5_TalkAboutBrad

=== BJS5_HelpJensen ===

He begins to ask you questions about networking in a conference as an undergrad, and you help him with some advice. 

Jensen: "Thanks Bronislav! Well, I don't want to keep you too long!"

* ["Need help with anything else?"]

    // Note: I added the line below (Shi)

    Jensen pauses for a moment, slightly hesitant.

    Jensen: "I mean ..."

    // Note: This part of the story doesn't make sense. Why would Jensen
    //       be at a conference? Do we leave campus?

    Jensen: "What's the name of the guy you were talking with at the conference today? The one I see you hang out with alot?"

    ** ["Brad?"]
        -> BJS5_TalkAboutBrad
    -

* ["No problem."]

    Jensen: "Catch you later"

    {HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> DONE


=== BJS5_TalkAboutBrad ===

Bronislav: "You mean Brad?"

Jensen: "Yeah! Brad!"

Jensen: "What is his deal? It feels like ever since week one, he's not liked me."

Jensen: "Bet he hates seeing me come this far, huh?"

* ["I doubt it."]
    -> BJS5_IDoubtIt
* ["He's not someone you should worry about"]
    -> BJS5_NotSomethingYouShouldWorryAbout
* ["I bet you're right."]
    -> BJS5_IBetYouAreRight
{DbInsert("Seen_BJS5")}
-> DONE


=== BJS5_WhatIsItNow ===

Bronislav: "Jensen, let's make it quick, please. What now?"

Jensen scoffs at this.

Jensen: "Well... I was ..."

Jensen then looks down, and back up at you, letting out a deep breath.

Jensen: "I wanted to make sure there was no bad blood Bronislav. Clearly there still is"

Jensen: "Talk to me again when you feel up to it"

* [Call out to Jensen.]
    -> BJS5_CallOutToJensen
* [Let him leave.]
    -> BJS5_LetJensenLeave


=== BJS5_IDoubtIt ===

Bronislav: "I know Brad, he's not someone you should worry about."

Bronislav: "He's pretty professional. He just seems concerned about the nature of you on this paper. Which is fair"

Jensen: "Yeah, whatever you say, Bronislav. I know it really does get on his nerves."

Jensen: "Anyway, that's not important. Do you think you have time to spare to help me? This is my first conference and could use some help."

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_NotSomethingYouShouldWorryAbout ===

Bronislav: "That's not something you should worry about, Jensen."

Bronislav: "Besides, who cares what people think?"

Jensen: "That's a smart wat to think about it. Yeah ... You're right. I'll just ignore him."

Jensen: "While I've got you here, do you think you have time to spare to help me? This is my first conference and could use some help."

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_IBetYouAreRight ===

Bronislav: "Yeah, that sounds like Brad. I bet you're right."

Jensen laughs with you.

Jensen: "Seriously. Glad to hear I'm not crazy"

Jensen: "Well, anyways, do you think you have time to spare to help me? This is my first conference and could use some help."

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_IveGotSomeTime ===

Bronislav: "Sure, I can help for a bit. What do you need help with?"

He begins to ask you questions about networking in a conference as an undergrad and you help him with some advice. 

Jensen: "Thanks! I really appreciate your help! I'll see you around!" 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> DONE


=== BJS5_MaybeAnotherTime ===

You look at the time and see you might miss a talk you wanted to go to.

Bronislav: "Maybe another time, Jensen, I have to go."

Jensen: "No worries, Bronislav. I'm sure we'll talk again soon."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> END

=== BJS5_Start_Alt_1 ===
# ---
# choiceLabel: Meet with Jensen
# @query
# IvyDealRejected
# @end
# hidden: true
# tags: action, library, auxiliary
# ===

Jensen texted you earlier to day saying he wanted to talk with you.

You approach where he told you to meet and see him on his phone.

He puts it away once he see you, waving briefly.

Jensen: "Hey, Bronislav. Sorry if I was interrupting anything. I just wanted to talk with you."

* ["What's up?"]
    -> BJS5_WhatsUp
* [Sit down and listen.]
    -> BJS5_SitDownAndListen
* ["What is is now, Jensen?"]
    -> BJS5_WhatIsItNow


=== BJS5_WhatsUp ===

Bronislav: "What's up, Jensen?"

He let's out a deep sigh.

Jensen: "You were right, Bronislav. I was just ... hopeful to finally get something on my CV."

Jensen: "Now I see that you were always thinking about what was best for me."

* ["I'm glad to hear it."]
    -> BJS5_GladToHear
* ["As long as you learned something."]
    -> BJS5_AsLongAsYouLearnedSomething
* ["Took you long enough."]
    -> BJS5_TookYouLongEnough


=== BJS5_SitDownAndListen ===

You stand across from Jensen, silently.

He lets out a deep sigh.

Jensen: "You were right, Bronislav. I was just ... hopeful to finally get something on my CV."

Jensen: "Now I see that you were always thinking about what was best for me."

* ["I'm glad to hear it."]
    -> BJS5_GladToHear
* [Smile and Nod]
    -> BJS5_SmileAndNod
* ["As long as you learned something."]
    -> BJS5_AsLongAsYouLearnedSomething
* ["Took you long enough."]
    -> BJS5_TookYouLongEnough

=== BJS5_AsLongAsYouLearnedSomething ===

Bronislav: "As long as you got something out of this, even if it wasn't something for your CV, thats good."

Jensen: "Huh." 

He scratches his chin

Jensen: "Yeah, I guess I did... I guess I did."

Jensen awkwardly smiles at you.

Jensen: "Thanks Bronislav. Hope I can talk to you again after your paper is done."

* ["Sounds like a plan."]
    -> BJS5_SoundsLikeAPlan
* ["We'll see."]
    -> BJS5_WeWillSee

=== BJS5_TookYouLongEnough

Bronislav: "It really took you that long, Jensen?"

Jensen looks disheartened hearing you say this.

Jensen: "I was really hoping we could've smoothed over any problems we still had."

Jensen: "Guess not ..."

He weakly begins to walk away.

Jensen: "Hope we can try again sometime."

* [Call out Jensen]
    -> BJS5_CallOutToJensen
* [Let him leave]
    -> BJS5_LetJensenLeave


=== BJS5_SmileAndNod ===

You silently node and smile at him.

Jensen seems a bit put off by it, but happy.

Jensen: "So ... we are all good? No grievances at all?"

* ["We're all good"]
    -> BJS5_WeAreAllGood
* ["Sure, Jensen"]
    -> BJS5_SureJensen


=== BJS5_WeAreAllGood ===

You extend your hand to shake.

Bronislav: "We're all good, Jensen"

Excitedly, Jensen shakes your hand.

Jensen: "That's such a relief. I'm glad to hear that, Bronislav."

Jensen: "Ive got to head out now, but I hope we can talk again once your paper is all done."

* ["Sounds like a plan."]
    -> BJS5_SoundsLikeAPlan
* ["We'll see."]
    -> BJS5_WeWillSee


=== BJS5_SureJensen ===

Bronislav: "Sure, Jensen. We're fine."

Jensen seems a bit unsettled by your answer, but awkwardly laughs it off.

Jensen: "Well, I've got to go now ... See you, Bronislav."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> DONE

=== BJS5_GladToHear ===

You give Jensen a pat on the back.

Bronislav: "I'm glad to hear that, Jensen. It takes a lot of guts to admit when you were wrong."

Jensen seems a little less nervous now.

He awkwardly pats your back, too.

Jensen: "Glad that it seems we're all good then?"

* ["We're all good."]
    -> BJS5_WeAreAllGood
* ["Sure Jensen."]
    -> BJS5_SureJensen

=== BJS5_SoundsLikeAPlan ===

Bronislav: "That sounds great!"

Bronislav: "I'll be pretty available after the paper is done. Just message me whenever."

Jensen walks away with a thumbs up and a look of relief.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> DONE

=== BJS5_WeWillSee ===

Bronislav: "I'll still be pretty busy afterward, but I'm sure we'll see if something comes up."

Jensen: "That's completely understandable. I guess we'll see!"

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS5")}
-> DONE

=== BJS5_CallOutToJensen ===

{HideCharacter("Jensen")}

You attempt to call out to Jensen.

He doesn't hear you and continues to walk off.

Maybe you'll get the chance to talk to him one more time.

{DbInsert("Seen_BJS5")}
-> DONE

=== BJS5_LetJensenLeave ===

{HideCharacter("Jensen")}

Jensen walks away.
{DbInsert("Seen_BJS5")}
-> DONE
