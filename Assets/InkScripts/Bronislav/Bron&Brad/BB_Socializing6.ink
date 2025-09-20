VAR withdrewPaperr = false

=== BB_Socializing6_SceneStart ===
# ---
# choiceLabel: Wait for Brad.
# @query
# date.day!6
# @end
# repeatable: false
# tags: action, cafe, auxiliary
# ===
# Summary: Ned and Brad overlook the outcome of the options

// show seen if Brad withdrew paper
~ withdrewPaperr = DbAssert("BradWithdrawsData")
VAR BreakFromWriting = false
VAR CouldNotAgreeMore = false
VAR countBB6 = 0



You walk into the cafe and see Brad sitting down.
{ShowCharacter("Brad", "left", "")}

Bronislav: "I'm going to just leave this here for a moment, I'm going to grab a drink."
{HideCharacter("Brad")}

Brad: "Sounds good, I'll keep an eye on your stuff."

You go up, order your coffee, and come back with it.

{ShowCharacter("Brad", "left", "")}

Brad: "Welp, time for a break huh?"

*["A break from writing maybe."]
->BB_Socializing6_BreakfromWriting

*["Could not agree more."]
->BB_Socializing6_CouldNotAgreeMore

=== BB_Socializing6_BreakfromWriting ===
{BreakFromWriting == false:
~ BreakFromWriting = true
Bronislav: "A break from writing at least, definitely still have some extracurricular stuff to catch up on? How about you?"

Brad chuckles.
}
{not withdrewPaperr:
Brad: "Yeah, pretty much in the same boat. Those darn trainings certainly don't leave a completely open schedule though."

- else:
Brad: "I'll probably be doing much of the same. My schedule is kind of open over the break though so that's nice."
}

~ countBB6 += 1
// TODO: ask a writer about this and lab meeting because Ned is asked about in that interaction as well possibly
*["How's Ned?"]
->BB_Socializing6_HowsNed

{not withdrewPaperr:
*["I'd imagine trainings are keeping you busy."]
->BB_Socializing6_IdImagine
}
{withdrewPaperr:
// if withdrew
*["Great to hear you'll have more time."]
->BB_Socializing6_MoreTime
}

{countBB6 == 2:
*["What's next for you?]
->BB_Socializing6_WhatsNext
}

=== BB_Socializing6_CouldNotAgreeMore ===
{CouldNotAgreeMore == false:
~ CouldNotAgreeMore = true
Bronislav: "Could not agree more, are you available much to have some more coffee hangouts?"

{not withdrewPaperr:
// if didn't withdraw
Brad seems unsure.

Brad: "I'm sure I could fit in a few, but I've got trainings for a bit still so I'll be keeping busy with that."
- else:
// if withdrew
Brad nods.

Brad: "Yeah, besides maybe submitting some applications for jobs, I'll be pretty free."
}

}
~ countBB6 += 1
*["Any other updates on Ned?"]
->BB_Socializing6_HowsNed

{not withdrewPaperr:
*["I'd imagine trainings are keeping you busy."]
->BB_Socializing6_IdImagine
}

{withdrewPaperr:
// if withdrew
*["Great to hear you'll have more time."]
->BB_Socializing6_MoreTime
}

{ countBB6 == 2:
*["What's next for you?]
->BB_Socializing6_WhatsNext
}

=== BB_Socializing6_HowsNed ===
Bronislav: "How's Ned doing?"

Brad shrugs.

{not withdrewPaperr:
Brad: "Seems fine, if anyone needs a break it's definitely him so I think he's taking that break."
}

{withdrewPaperr:
Brad: "Seems fine, still relived that we withdrew the paper. Definitely seems like if anyone needs a break, though, it's him."
}

{BreakFromWriting == true:
->BB_Socializing6_BreakfromWriting
}
{CouldNotAgreeMore == true:
->BB_Socializing6_CouldNotAgreeMore
}

=== BB_Socializing6_IdImagine ===
Bronislav: "I'd imagine that those trainings are keeping you pretty busy."

Brad: "Definitely looking that way."

{BreakFromWriting == true:
->BB_Socializing6_BreakfromWriting
}
{CouldNotAgreeMore == true:
->BB_Socializing6_CouldNotAgreeMore
}

=== BB_Socializing6_MoreTime ===
Bronislav: "Well, it's great to hear you'll have more time for coffee breaks. We've been long overdue to make these a regular occurance"

Brad smiles. "I'd have to agree. These are nice."

He takes a sip from his drink.

{BreakFromWriting == true:
->BB_Socializing6_BreakfromWriting
}
{CouldNotAgreeMore == true:
->BB_Socializing6_CouldNotAgreeMore
}

=== BB_Socializing6_WhatsNext ===
Bronislav: "What's next for you Brad?"

Brad sighs.

Brad: "Honestly, not much. Rest? Planning for next year maybe. Nothing I want to worry about now."

*["Sounds nice."]
->BB_Socializing6_SoundsNice

=== BB_Socializing6_SoundsNice ===
Bronislav: "Definitely feel you there. Sounds nice to not think about that kind of stuff."

Brad laughs.

Brad: "Yeah I look forward to it. Thanks again for setting this up, and I'm sure I'll see you again soon Bronislav. Have a nice break."

*["You too Brad."]
->BB_Socializing6_YouToo

=== BB_Socializing6_YouToo ===
Bronislav: "You too Brad, see you later."
{HideCharacter("Brad")}
{DbInsert("Seen_BBS6")}
->DONE
