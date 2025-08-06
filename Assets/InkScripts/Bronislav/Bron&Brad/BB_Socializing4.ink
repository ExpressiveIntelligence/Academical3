VAR confided = false

=== BB_Socializing4_SceneStart ===
# ---
# choiceLabel: Wait for Brad.
# @query
# date.day!4
# @end
# repeatable: false
# tags: action, library, auxiliary
# ===
# Summary: Brad is contemplating withdrawing paper

{DbInsert("Seen_BBS4")}

// Check if Conference Submission Deadline Happened
~ confided = DbAssert("Seen_BB_ConferenceSubmissionDeadline")

Brad called you a bit ago, sounding distressed and wanting to meet with you in the library. You wait for him, taking a much needed break in the meantime.

In the middle of your reading you hear Brad.

{ShowCharacter("Brad", "left", "")}

Brad: "You're already here! Hope I didn't keep you waiting too long Bronislav."

*["No problem."]
->BB_Socializing4_NoProblem

*["You took your time." #>>ChangeOpinion Brad Bronislav -]
->BB_Socializing4_TookYourTime

=== BB_Socializing4_NoProblem ===
{confided:
Bronislav: "No problem Brad. Any thoughts on what you're planning on doing with your paper?"

Brad sighs.

Brad: "I unfortunately have, ever since you said that I should tell someone about it I... It's just hard to. I was thinking I might just withdraw the paper. I'd hate to break the news to Ned."

- else:

Bronislav: "No problem Brad. How's the paper coming along?"

Brad sighs.

Brad: "It's coming along, but it doesn't feel right. I don't want to keep Ned in the dark on this, but I also don't want to waste both of our hard work."
}

*["You really should withdraw." #>>ChangeOpinion Brad Bronislav +]
->BB_Socializing4_ShouldWithdraw

*["Ned still doesn't know?"]
->BB_Socializing4_NedStillDoesntKnow

{confided:
*["You've got to do something soon."]
->BB_Socializing4_YouveGottaDoSomething

- else:

*["That seems unnecessary."]
->BB_Socializing4_SeemsUnnecessary

}

=== BB_Socializing4_TookYourTime ===
Bronislav: "You definitely took your time for something that sounded so urgent. What are your plans with the paper?"

Brad is taken aback before regathering himself.

Brad: "Oh, I was... going to tell someone, or at least withdraw the paper. It's just really, really hard to throw away all that work Ned and I did."

*["Just withdraw."]
->BB_Socializing4_JustWithdraw

*["That seems unecessary."]
->BB_Socializing4_SeemsUnnecessary

=== BB_Socializing4_ShouldWithdraw ===
// Brad will withdraw
{DbInsert("BradWithdrawsData")}
Brad: "I think you should just withdraw the paper Brad. A lot worse can happen if you submit unapproved data than just cutting your, and Ned's, losses."

Brad thinks for a bit then mumbles,

Brad: "Yeah you're right."

He puts his face into his hand and exhales sharply.

Brad: "I'll withdraw the paper Bronislav. Thanks for talking me out of that."

*["No worries."]
->BB_Socializing4_NoWorries

*["Make sure you do it."]
->BB_Socializing4_MakeSure

=== BB_Socializing4_NedStillDoesntKnow ===
Bronislav: "Wait, Ned still doesn't know?"

Brad: "Noooo?"

Brad says slowly.

Bronislav: "No wonder you haven't withdrawn then."

Brad: "So this can still be salvaged?"

*["You really should withdraw." #>>ChangeOpinion Brad Bronislav +]
->BB_Socializing4_ShouldWithdraw

*["You shouldn't withdraw." #>>ChangeOpinion Brad Bronislav ++]
->BB_Socializing4_ShouldntWithdraw

=== BB_Socializing4_YouveGottaDoSomething ===
Bronislav: "You've got to do something soon then Brad. You know what I think, but you should make your own choice."

Brad groans.

Brad: "I just want someone else's input on it Bronislav. Really, what do you think?"

*["You really should withdraw." #>>ChangeOpinion Brad Bronislav +]
->BB_Socializing4_ShouldWithdraw

*["You shouldn't withdraw." #>>ChangeOpinion Brad Bronislav ++]
->BB_Socializing4_ShouldntWithdraw

=== BB_Socializing4_SeemsUnnecessary ===
Bronislav: "That does seem unecessary. Would be a shame to see both of your work go to waste. Surely it can't be that big of an issue."

Brad looks relieved.

Brad: "So you agree? Wow, that's great to hear. You really think nothing bad is going to happen?"

*["I doubt it."]
->BB_Socializing4_DoubtIt

*["On second thought..."]
->BB_Socializing4_OnSecondThought

=== BB_Socializing4_JustWithdraw ===
Bronislav: "Just withdraw the paper Brad, don't do something you're going to regret."

Brad crosses his arms and leans his head back.

Brad: "I know, I know. You really think I should do it Bronislav?"

*["Make sure you do it."]
->BB_Socializing4_MakeSure

*["Do what seems right."]
->BB_Socializing4_DoWhatSeemsRight

===BB_Socializing4_ShouldntWithdraw ===
Bronislav: "I think you shouldn't withdraw the paper. Like you said, it can't be that big of a deal, and no one else knows."

Brad's eyes widen.

Brad: "Yeah, yeah! Thanks Bronislav, you're the best! I'm going to keep it submitted, and no one has to know."

*["No worries."]
->BB_Socializing4_NoWorries

*["Good luck."]
->BB_Socializing4_GoodLuck

=== BB_Socializing4_DoubtIt ===
Bronislav: "I doubt it. The IRB was lazy getting back to you to approve your data, I'd be surprised if they did care all of a sudden."

Brad smiles.

Brad: "That's exactly what I was thinking! If it weren't for the IRB being slow I wouldn't be in this situation to begin with anyway. Thanks Bronislav."

*["No worries."]
->BB_Socializing4_NoWorries

*["Good luck."]
->BB_Socializing4_GoodLuck

=== BB_Socializing4_OnSecondThought ===
Bronislav: "On second thought Brad..."

Brad sighs defeatedly.

Brad: "Do I or do I not Bronislav?"

Bronislav: "You really shouldn't, Brad. The IRB do really crackdown on stuff like this, and you'll really mess up both your own and Ned's credibility."

He looks stunned in confusion.

Brad: "I... guess... I'll... withdraw then?"

*["Make sure you do it."]
->BB_Socializing4_MakeSure

*["Do what seems right."]
->BB_Socializing4_DoWhatSeemsRight

=== BB_Socializing4_DoWhatSeemsRight ===
Bronislav: "Just do what seems right, Brad."

Brad gets up.

Brad: "You know what Bronislav, I will do what I think is right. Because you clearly don't want to help."

He leaves without another word.

{HideCharacter("Brad")}
->DONE

=== BB_Socializing4_NoWorries ===
Bronislav: "No worries. Glad I could help."

Brad smiles gleefully.

Brad: "You've helped a ton, more than you know Bronislav. Thanks."

He gets up and leaves with a friendly wave before he walks out.

{HideCharacter("Brad")}
->DONE

=== BB_Socializing4_GoodLuck ===
Bronislav: "Good luck to both you and Ned."

Brad gives a thumbs up.

Bronislav: "Good luck on your paper too Bronislav. Thanks for all the help."

He gets up and leaves with a friendly wave before he walks out.

{HideCharacter("Brad")}
->DONE

=== BB_Socializing4_MakeSure ===
// Brad will withdraw
{DbInsert("BradWithdrawsData")}
Bronislav: "Make sure you commit to it this time."

Brad nods.

Brad: "I'll make sure I will too then."

He gets up awkwardly.

Brad: "Th-thanks Bronislav."

{HideCharacter("Brad")}
->DONE
