/*

This file contains dialogue for the socializing 5 conversation
between Bronislav and Jensen. This scene takes place in the
library after ... <TODO:: WHEN DOES THIS HAPPEN??>.

*/


=== BJS5_Start ===
# ---
# choiceLabel: Meet with Jensen
# @query
# IvyDealAccepted
# Seen_BJS3
# @end
# hidden: true
# tags: action, library, auxiliary
# ===

{DbInsert("Seen_BJS5")}

Jensen texted you earlier today saying he wanted to talk about the project at the library.

You walk up to the door of the sty room he booked, and you see him on his phone.

He puts it away once he sees you, waving briefly and getting up to open the door.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey, Bronislav! Glad you you could come here on pretty short notice. How's your day been?"

* {DbAssert("HasIvyRec")}["It's been good"]
    -> BJS5_ItsBeenGood
* ["Could be better"]

    Bronislav: "I could be better."

    -> BJS5_NeedHelpWithAnything
* ["What did you want me here for, Jensen?"]

    Bronislav: "What do you want?"

    -> BJS5_NeedHelpWithAnything

=== BJS5_ItsBeenGood ===

Bronislav: "It's been pretty good. Got off a call with Ivy earlier today, and it sounds like she'll recommend me to her Uncle!"

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

Jensen takes out his laptop.

Jensen: "I do need some help if you've got a moment."

* [Help Jensen]
    -> BJS5_HelpJensen

=== BJS5_AnythingElseYouWantToTalkAbout ===

Bronislav: "No worries. Was there something else you wanted to talk about?"

Jensen thinks for a minute.

Jensen: "Oh yeah! I saw you talking to that one guy at the conference. What was his name...?"

* ["Brad?"]
    -> BJS5_TalkAboutBrad
* ["What did you do, Jensen?"]
    -> BJS5_WhatDidYouDo

=== BJS5_HelpJensen ===

You pull up a chair next to jensen and help solve the problem he was having.

You see him glance outside

Jensen: "Woof! Looks like its might be getting a bit late, I don't want to keep you too long, Bronislav"

* ["Need help with anything else?"]

    Bronislav: "I mean, this is about your work on the paper. Are you sure you don't need help with anything else?"

    // Note: I added the line below (Shi)

    Jensen pauses for a moment, slightly hesitant.

    Jensen: "I mean ..."

    // Note: This part of the story doesn't make sense. Why would Jensen
    //       be at a conference? Do we leave campus?

    Jensen: "It's not really related to the paper, but what's the name of the guy you were talking with at the conference today?"

    ** ["Brad?"]
        -> BJS5_TalkAboutBrad

    // Note: This choice takes an odd accusatory tone
    ** ["What did you do, Jensen?"]
        -> BJS5_WhatDidYouDo
    -

* ["That sounds reasonable."]

    You glance out the door.

    Bronislav: "I think you might be right, Jensen."

    Bronislav: "I think my bus should be here soon, as a matter of fact."

    You pack your stuff up to leave.

    Jensen: "Thanks again for showing up on short notice and helping me with that, Bronislav."

    Jensen: "Catch you later"

    {HideCharacter("Jensen")}
-
-> DONE


=== BJS5_TalkAboutBrad ===

Bronislav: "You mean Brad?"

Jensen: "Yeah! Brad!"

Jensen: "What is his deal? It feels like ever since week one, he's not liked me."

Jensen: "Bet he hates seeing me come this far, huh?"

* ["I doubt it."]
    -> BJS5_IDoubtIt
* ["That's not something you should worry about"]
    -> BJS5_NotSomethingYouShouldWorryAbout
* ["I bet you're right."]
    -> BJS5_IBetYouAreRight

-> DONE

=== BJS5_WhatDidYouDo ===

Bronislav: "Jensen, ... what did you do?"

Jensen: "I didn't do anything!"

Jensen: "Nothing ... like .. super serious anyway."

Jensen: "Just had to let him know I was on the paper."

* [Roll your eyes.]
    -> BJS5_RollYourEyes
* ["That's not something you should worry about"]
    -> BJS5_NotSomethingYouShouldWorryAbout


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


=== BJS5_RollYourEyes ===

You visibly roll your eyes.

Jensen: "I'm telling you, Bronislav. He's not as nice a guy that you seem to think he is."

Jensen: "I just know I get on his nerves."

Jensen: "That's not really important anyway..."

Jensen: "While I've got you here, do you think you could help me with something on the paper?"

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_IDoubtIt ===

Bronislav: "I know Brad, and I really doubt it."

Bronislav: "He's pretty professional. He just seems concerned about the nature of you on this paper. Which is fair"

Jensen: "Yeah, whatever you say, Bronislav. I know it really does get on his nerves."

Jensen: "Anyway, that's not important. Do you think you have time to spare to help on the paper?"

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_NotSomethingYouShouldWorryAbout ===

Bronislav: "That;s not something you should worry about, Jensen."

Bronislav: "As long as you're working on the paper, who cares what people think?"

Jensen: "That's a smart wat to think about it. Yeah ... You're right. I'll just ignore him."

Jensen: "While I've got you here, do you thing you can help me with something on the paper?"

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_IBetYouAreRight ===

Bronislav: "Yeah, that sounds like Brad. I bet you're right."

Jensen laughs with you.

Jensen: "Seriously. Glad to hear I'm not crazy"

Jensen: "Well, anyways, I was wondering if you've got some time to help me with something on the paper?"

* ["Yeah I've got some time."]
    -> BJS5_IveGotSomeTime
* ["Maybe another time."]
    -> BJS5_MaybeAnotherTime

=== BJS5_IveGotSomeTime ===

Bronislav: "Sure, I can help for a bit. What do you need help with?"

You work on the paper with Jensen for a while.

You head home once you noticed it has gotten dark outside.

{HideCharacter("Jensen")}

-> DONE


=== BJS5_MaybeAnotherTime ===

You look at the time, seeing that your bus should be arriving soon.

Bronislav: Maybe another time, Jensen. I've got to get home soon."

Jensen: "No worries, Bronislav. I'm sure we'll talk again soon."

{HideCharacter("Jensen")}

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

Jensen texted you earlier to day saying he wanted to talk with you at the library.

You approach the study room he booked, and you see him on his phone.

He puts it away once he see you, waving briefly, and getting up to open the door.

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

You sit down across from Jensen, silently.

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

Jensen: "Huh." He scratches his chin

Jensen: "Yeah, I guess I did... I guess I did"

Jensen awkwardly smiles at you.

Jensen: "Thanks Bronislav. Hope I can talk to you again after your paper is done."

* ["Sounds like a plan."]
    -> BJS5_SoundsLikeAPlan
* ["We'll see.]
    -> BJS5_WeWillSee

=== BJS5_TookYouLongEnough

Bronislav: "It really took you that long, Jensen?"

Jensen looks disheartened hearing you say this.

Jensen: "I was really hoping we could've smoothed over any problems we still had."

Jensen: "Guess not ..."

He packs his stuff up and weakly waves you goodbye.

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
* ["We'll see.]
    -> BJS5_WeWillSee


=== BJS5_SureJensen ===

Bronislav: "Sure, Jensen. We're fine."

Jensen seems a bit unsettled by your answer, but awkwardly laughs it off.

Jensen: "Well, I've got to go now ... See you, Bronislav."

{HideCharacter("Jensen")}

-> DONE

=== BJS5_GladToHear ===

You give Jensen a pat on the back.

Bronislav: "I'm glad to hear that, Jensen. It takes a lot of guts to admit when you were wrong."

Jensen seems a little less nervous now.

He awkwardly pats your back, too.

Jensen: "Glad tht it seems we're all good then?"

* ["We're all good."]
    -> BJS5_WeAreAllGood
* ["Sure Jensen"]
    -> BJS5_SureJensen

=== BJS5_SoundsLikeAPlan ===

Bronislav: "That sounds great!

Bronislav: "I'll be pretty available after the paper is done. Just message me whenever."

Jensen walks out with a thumbs up and a look of relief.

{HideCharacter("Jensen")}

-> DONE

=== BJS5_WeWillSee ===

Bronislav: "I'll still be pretty busy afterward, but I'm sure we'll see if something comes up."

Jensen: "That's completely understandable. I guess we'll see!"

{HideCharacter("Jensen")}

-> DONE

=== BJS5_CallOutToJensen ===

{HideCharacter("Jensen")}

You attempt to call out to Jensen.

He shuts the door behind him quickly.

You sit in the study room for a bit before leaving as well.

Maybe you'll get the chance to talk to him one more time.

-> DONE

=== BJS5_LetJensenLeave ===

{HideCharacter("Jensen")}

Jensen shuts the door behind him.

You start to pack up and leave the room as well.

Will you ever see him again?

-> DONE
