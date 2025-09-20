VAR confided = false

=== BB_Socializing4_SceneStart ===
# ---
# choiceLabel: Wait for Brad.
# hidden: true
# @query
# date.day!4
# @end
# repeatable: false
# tags: action, library, required
# ===
#Summary: Brad is contemplating withdrawing paper

VAR HendricksKnows = false



~HendricksKnows = DbAssert("HendricksKnowsBrad")

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

Brad: "It's coming along, but it doesn't feel right. I don't want to keep Ned in the dark on this, but I also don't want to waste my hard work."

Brad: "I just dont know if you're in the mood to hear this..."
}

*{confided}["You really should withdraw." #>>ChangeOpinion Brad Bronislav +]
->BB_Socializing4_ShouldWithdraw

*{confided}["Ned still doesn't know?"  # >> ChangeOpinion Brad Bronislav --]
->BB_Socializing4_NedStillDoesntKnow

*{confided}["You've got to do something soon."]
->BB_Socializing4_YouveGottaDoSomething

*{confided}["That seems unnecessary." # >> ChangeOpinion Brad Bronislav +]
->BB_Socializing4_SeemsUnnecessary

*{not confided}["What's going on?"] -> BB_Socializing4_Explination 

*{not confided}["Well now I'm worried"  # >> ChangeOpinion Brad Bronislav -] -> BB_Socializing4_Worried 

===BB_Socializing4_Explination=== 
Brad: "OKSOYOUWEREINABADMOODANDIDIDNTWANTTOMAKEYOUMADBUTBUTBUT-"

Bronislav: "Brad! Slow down! I don't know what you're saying!"

Brad: "I used unapproved IRB Data!" 

Bronislav: "What?!" 

Brad: "I was so worried I wasn't going to get the approval in time and ran the survey, and the approval DID come in but after I ran the survey!" 

Bronislav: "Does Ned know?" 

Brad: "No but I don't know if I did something bad or not. Should I withdraw?" 
-> BB_Socializing4_TookYourTime.choices

===BB_Socializing4_Worried==
Brad: "...I knew you would say something like that." 

Bronislav: "Well spill already, what's going on?!" 

->BB_Socializing4_Explination

=== BB_Socializing4_TookYourTime ===
Bronislav: "You definitely took your time for something that sounded so urgent. What are your plans with the paper?"

Brad is taken aback before regathering himself.

Brad: "Oh, I was... going to tell someone, or at least withdraw the paper. It's just really, really hard to throw away all that work Ned and I did."

->choices

=choices

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

{not HendricksKnows: Bronislav: "No wonder you haven't withdrawn then."} 
{HendricksKnows: Bronislav: "I'm going to be blunt, the other day Hendricks told me, according to Brad, something shady was going on in your research. He's already onto you."}

{HendricksKnows: Brad: "...shoot."} 

Brad: "So...do this can still be salvaged?"

*["You really should withdraw." # >> ChangeOpinion Brad Bronislav +]
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
-> BP_EvilPlan 

=== BB_Socializing4_NoWorries ===
Bronislav: "No worries. Glad I could help."

Brad smiles gleefully.

Brad: "You've helped a ton, more than you know Bronislav. Thanks."

He gets up and leaves with a friendly wave before he walks out.

{HideCharacter("Brad")}
-> BP_EvilPlan 

=== BB_Socializing4_GoodLuck ===
Bronislav: "Good luck to both you and Ned."

Brad gives a thumbs up.

Bronislav: "Good luck on your paper too Bronislav. Thanks for all the help."

He gets up and leaves with a friendly wave before he walks out.

{HideCharacter("Brad")}
-> BP_EvilPlan 

=== BB_Socializing4_MakeSure ===
// Brad will withdraw
{DbInsert("BradWithdrawsData")}
Bronislav: "Make sure you commit to it this time."

Brad nods.

Brad: "I'll make sure I will too then."

He gets up awkwardly.

Brad: "Th-thanks Bronislav."

{HideCharacter("Brad")}
-> BP_EvilPlan

===BP_EvilPlan===
{DbInsert("Seen_BP_EvilPlan")}

As you begin to head out, you overhear Praveen talking with another student.

{ShowCharacter("Praveen", "left", "")}

Praveen: "...and you know, now I'm reviewing her work."

Praveen: "It's honestly pretty garbage. She starts at one point and then jumps between twenty different topics before hardly returning to his original point. Such a long paper to say nothing at all."

Praveen: "But she did make a couple good points in some sections. I wasn't planning on giving a good review, so maybe I could take those points and write my own paper."

Praveen: "But yeah it's overall going well. How about you? How's your work going?..."

You walk away before listening to the rest of the conversation

{HideCharacter("Praveen")}
{DbInsert("Seen_BBS4")}
->DONE
