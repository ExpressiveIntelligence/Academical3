@ -1,297 +0,0 @@
VAR ignoredHendricks = false 

=== BHS1_Hint ===

\*Buzz Buzz\* Your phone vibrates with a notification.

It's an email from your advisor, Hendricks.

She wants to talk about your research progress.

* [Agree to meet her later today #>> ChangeOpinion Hendricks Bronislav +]
    You reply to her email. The two of you agree to meet at her office later today.
    {DbInsert("BHS1_unlocked")}
* [Ignore the email #>> ChangeOpinion Hendricks Bronislav -]
    You put your phone back in your pocket.
     {DbInsert("BHS1_ignored")}
-

->DONE

=== BHS1_sceneStart ===
# ---
# choiceLabel: Wait for Hendricks to arrive.
# @query
# BHS1_unlocked
# date.day!1
# @end
# tags: action, hendricks_office, required 
# repeatable: false
# ===

// Summary: You meet with Hendricks and talk about Jensen not giving helpful feedback. Also first mentioning of Praveen.



You enter her office, sitting down on the table and setting your bag aside. She greets you with a warm smile. 

{ShowCharacter("Hendricks", "left", "")}

*["How are you doing?"]
->BHS1_HowAreYou

=== BHS1_HowAreYou ===
Bronislav: "Hey Hendricks. How are you doing?"

She shrugs.

Hendricks: "Quite alright. Rather busy, but I was just interested in seeing how your progress is going."

*["It's going good."]
    ->BHS1_GoingGood

*["It could be going better."]
    ->BHS1_CouldBeBetter

*["It's complicated."]
    ->BHS1_ItsComplicated

=== BHS1_GoingGood ===

Bronislav: "The paper's going well! I also got some feedback on it at the lab meeting, so I'm taking that into account while I continue to work on it."

Hendricks: "Well, has anyone of interest crossed your path? Perhaps another author?"

*["I was debating adding Jensen..."]
    ->BHS1_ThinkingAboutIt

*["Not really."]
    ->BHS1_ForRightNow

=== BHS1_CouldBeBetter ===
Bronislav: "Could be going better, but it could also be going worse. Just a lot of work for one-"

She interrupts you.

Hendricks: "You're doing this all by yourself Bronislav?"

*["Just for now."]
    ->BHS1_JustForNow

*["That was the idea."]
    ->BHS1_ThatsTheIdea

=== BHS1_ItsComplicated ===
Bronislav: "It's pretty complicated. I've been thinking of adding a person who gave me feedback to the paper, but I still feel a bit conflicted about it due to the quality of their feedback."

Hendricks: "Oh? Do share."

*["His name is Jensen."]
    ->BHS1_HisNameIsJensen

*["It's not really worth talking about."]
    ->BHS1_ItsNotWorthIt

=== BHS1_ThinkingAboutIt ===
Bronislav: "I was debating adding the person who gave the feedback to the paper. Still a bit unsure about it at the moment."

Hendricks: "Do tell."

Bronislav: "His name was Jensen. While his feedback was a bit lacking-"

She raises an eyebrow and tries to hide laugh.

*["Everything okay?"]
    ->BHS1_EverythingOkay

=== BHS1_EverythingOkay ===
Bronislav: "Is everything ok?"

Hendricks: "Yes I'm fine thank you."

She says through a small laugh.

Hendricks: "I know Jensen pretty well. I can say I'm not too surprised to hear that his feedback was... lacking. If you want to add him to your paper though I won't judge."

*["I feel like you are judging."]
    ->BHS1_IFeelLikeYouAre

*["I said I was unsure."]
    ->BHS1_ISaidIWasUnsure

=== BHS1_IFeelLikeYouAre ===
Bronislav: "I feel like I am being judged. It could be a good advising opportunity for myself, and I'm always trying to sharpen my skills."

Bronislav: "Besides, but I think I have a pretty good judge of character. Like Praveen."

Hendricks silently looks at you with her "non-judgemental" stare.
-> BHS1_TrapDoorPraveen

=== BHS1_ISaidIWasUnsure ===
Bronislav: "Exactly why I said I was unsure about it. Jensen's got promise, but maybe needs something more his speed."

Hendricks: "You could say that again. Glad to hear everything's going well Bronislav, I do have another meeting, but I hope we can meet again soon."

Bronislav: "I hope so too! Thanks for meeting with me." 

Hendricks: "Of course, anytime! Feel free to reach out if you need any help, I'm here to support you." 

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
-> DONE

=== BHS1_ForRightNow ===
Bronislav: "Not really. I've gotten some feedback but it was... less than helpful."

She chuckles.

Hendricks: "Isn't that the truth. If you do find yourself needing some help you can always let me know."

*["I'll keep that in mind."]
    ->BHS1_IllKeepItInMind

*["I don't think that will be necessary."]
    ->BHS1_DontThinkItsNecessary

=== BHS1_IllKeepItInMind ===
Bronislav: "Thanks professor, I'll make sure to keep that in mind."

Hendricks: "Any time Bronislav. Glad to hear everything's going well. I do have another meeting, but I hope we can meet again soon."

Bronislav: "I hope so too! Thanks for meeting with me." 

Hendricks: "Of course, anytime! Feel free to reach out if you need any help, I'm here to support you." 

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
-> DONE

=== BHS1_DontThinkItsNecessary ===
Bronislav: "Thanks for the offer professor, but I don't think that will be necessary. I know you're busy and I can handle myself."

Hendricks: "I see you haven't changed much Bronislav. Glad to hear everything's going well. I do have another meeting, but I hope we can meet again soon."

Bronislav: "I hope so too! Thanks for meeting with me." 

Hendricks: "Of course, anytime! Feel free to reach out if you need any help, I'm here to support you." 

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
->DONE

=== BHS1_JustForNow ===
Bronislav: "Probably not for too much longer. I got some feedback at the meeting and I've been debating on adding him."

Hendricks: "Do tell."

Bronislav: "His name was Jensen. While his feedback was a bit lacking-"

She raises an eyebrow and tries to hide laugh.

*["Everything ok?"]
->BHS1_EverythingOkay

=== BHS1_ThatsTheIdea ===
Bronislav: "That was the idea. You of all people should know that Professor."

Hendricks: She laughs.

Hendricks: "You've got me there Bronislav. Overall, I'm glad to hear everything's going well. I do have another meeting, but I hope we can meet again soon."

Bronislav: "I hope so too! Thanks for meeting with me." 

Hendricks: "Of course, anytime! Feel free to reach out if you need any help, I'm here to support you." 

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
-> DONE

=== BHS1_HisNameIsJensen ===
Bronislav: "I was approached by a student named Jensen and-"

She interrupts you.

Hendricks: "Jensen huh?"

She tries to hide laugh.

Hendricks: "I can't say it's surprising to hear Jensen's feedback was less than helpful.
*["He has promise."]
    ->BHS1_HeHasPromise
*["It was only a consideration."]
    ->BHS1_OnlyAConsideration

=== BHS1_HeHasPromise ===
Bronislav: "Jensen's got some promise, I feel like a nudge in the right direction and he could be a great person to work with."

She shrugs.

Hendricks: "I understand, sometimes you want to help out other people."

Bronislav: "Yeah, like Praveen."

Hendricks silently looks at you with her "non-judgemental" stare.
-> BHS1_TrapDoorPraveen

===BHS1_TrapDoorPraveen===
*["I told you he was a good student."] -> BHS1_TrapDoorPraveenGoodStudent
*["He's been doing great."] -> BHS1_TrapDoorPraveenGreat
*["He's struggling."] -> BHS1_PraveenRecommendation

=BHS1_TrapDoorPraveenGreat
You prepare to say this but hold back. Hendricks knows Praveen's been struggling since he's arrived. Even though you have hopes for him, you probably should be truthful about what's actually happening. ->BHS1_TrapDoorPraveen

=BHS1_TrapDoorPraveenGoodStudent
You want to say this but hold back. Sure, he may have the grades, but that hasn't been his struggle. Even though you have hopes for him, you probably should be truthful about what's actually happening. -> BHS1_TrapDoorPraveen

==BHS1_PraveenRecommendation==

Bronislav: "Sure, he may be struggling a bit, but that's just kind of how the first year goes."

Hendricks: "You're right. Well I'd have to wish you the best of luck on your endeavour Bronislav. If you need some more helpful advice on your paper you can always reach out."

*["Actually, one more thing"] -> BHS1_PraveenContemplate 
*["Bye Hendricks"] -> BHS1_PraveenConvoEnding

= BHS1_PraveenContemplate  

Even though he is struggling, Praveen could succeed if given an opportunity. Recommending him would be greatly appreciated. 

*["Have you considered putting Praveen as a reviewer?"] -> BHS1_PraveenReviewer 
*["Nevermind."] -> BHS1_BeginningOfGoodbye 

= BHS1_PraveenReviewer  
Bronislav: "It would be a great opportunity for him, and I think he's going to do a good job." 

Hendricks: "Hm, I haven't. I'll consider it, but for now I need to go. See you later!" 

Bronislav: "Thanks, Hendricks! Bye!" 

-> BHS1_PraveenConvoEnding

= BHS1_BeginningOfGoodbye 
Hendricks: "Alright then, if you have anything you'd like to talk about, I'm here to help. Doesn't only need to be about your paper." 

Bronislav: "Thank you, Hendricks" 

-> BHS1_PraveenConvoEnding

===BHS1_PraveenConvoEnding===

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
->DONE

=== BHS1_OnlyAConsideration ===
Bronislav: "Trust me, it was only a consideration. It was never something set in stone."

Hendricks: "I suppose that's what makes it complicated. I know you want to help others but also take other things into consideration."

Bronislav: "I know, but I think I have a pretty good judge of character. Like Praveen."

Hendricks silently looks at you with her "non-judgemental" stare.
-> BHS1_TrapDoorPraveen

=== BHS1_ItsNotWorthIt ===
Bronislav: "It wasn't all that important in all honesty."

Hendricks: "Alright. Well overall, I'm glad to hear everything's going ok Bronislav. I do have another meeting, but I hope we can meet again soon."

Bronislav: "I hope so too! Thanks for meeting with me." 

Hendricks: "Of course, anytime! Feel free to reach out if you need any help, I'm here to support you." 

You grab your bag and head out. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS1")}
->DONE
