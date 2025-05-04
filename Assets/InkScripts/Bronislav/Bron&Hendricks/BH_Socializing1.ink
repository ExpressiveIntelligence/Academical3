=== BHS1_Hint ===

\*Buzz Buzz\* Your phone vibrates with a notification.

It's an email from you advisor, Hendricks.

She wants to talk about your research progress.

* [Agree to meet her later today #>> ChangeOpinion Hendricks Bronislav +]
    You reply to her email. The two of you agree to meet at the library later
    today.
    {DbInsert("BHS1_unlocked")}
* [Ignore the email #>> ChangeOpinion Hendricks Bronislav -]
    You put your phone back in your pocket.
-

->DONE

=== BHS1_sceneStart ===
# ---
# choiceLabel: Wait for Hendricks to arrive.
# @query
# BHS1_unlocked
# date.day!1
# @end
# tags: action, library, auxiliary
# repeatable: false
# ===
# Summary: You meet with Hendricks and talk about Jensen not giving helpful feedback. 
She sits down at your table, setting down her bag next to her.

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

Hendricks: "Oh really? You're not working on all of this by yourself are you?"

*["I'm thinking about it."]
    ->BHS1_ThinkingAboutIt

*["I am for right now."]
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

She raises an eyebrow and shows a bit of a smirk.

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
Bronislav: "I feel like I am being judged. It feels like it could be a good advising opportunity for myself, and I'm always trying to sharpen my skills."

Hendricks: "Well, I'll have to wish you the best of luck with that then. Glad to hear the paper is going well though. Hope it stays that way."

You stay for a bit longer to catch her up on your progress; and eventually she gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

->DONE

=== BHS1_ISaidIWasUnsure ===
Bronislav: "Exactly why I said I was unsure about it. Jensen's got promise, but maybe needs something more his speed."

Hendricks: "You could say that again. Glad to hear everything's going well Bronislav, I've got to head out but I hope we can meet again soon."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

-> DONE

=== BHS1_ForRightNow ===
Bronislav: "I am for right now. I've gotten some feedback but it was... less than helpful."

She chuckles.

Hendricks: "Isn't that the truth. If you do find yourself needing some help you can always let me know."

*["I'll keep that in mind."]
    ->BHS1_IllKeepItInMind

*["I don't think that will be necessary."]
    ->BHS1_DontThinkItsNecessary

=== BHS1_IllKeepItInMind ===
Bronislav: "Thanks professor, I'll make sure to keep that in mind."

Hendricks: "Any time Bronislav. I've got to head out now, but I'm sure we'll be in touch."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

-> DONE

=== BHS1_DontThinkItsNecessary ===
Bronislav: "Thanks for the offer professor, but I don't think that will be necessary. I know you're busy and I can handle myself."

Hendricks: "I see you haven't changed much Bronislav. Hope to talk to you later."

She laughs kindly and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

->DONE

=== BHS1_JustForNow ===
Bronislav: "Probably not for too much longer. I got some feedback at the introductory meeting and I've been debating on adding them."

Hendricks: "Do tell."

Bronislav: "His name was Jensen. While his feedback was a bit lacking-"

She raises an eyebrow and shows a bit of a smirk.

*["Everything ok?"]
->BHS1_EverythingOkay

=== BHS1_ThatsTheIdea ===
Bronislav: "That was the idea. You of all people should know that Professor."

Hendricks: She laughs.

Hendricks: "You've got me there Bronislav. Then I suppose I shouldn't bother you anymore, I'll keep in touch though. In case you do end up needing something."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

-> DONE

=== BHS1_HisNameIsJensen ===
Bronislav: "I was approached by a student named Jensen and-"

She interrupts you.

Hendricks: "Jensen huh?"

She smirks a bit.

Hendricks: "I can't say it's surprising to hear Jensen's feedback was less than helpful.
*["He has promise."]
    ->BHS1_HeHasPromise
*["It was only a consideration."]
    ->BHS1_OnlyAConsideration

=== BHS1_HeHasPromise ===
Bronislav: "Jensen's got some promise, I feel like a nudge in the right direction and he could be a great person to work with."

She shrugs.

Hendricks: "Well I'd have to wish you the best of luck on that endeavour Bronislav. If you need some more helpful advice on your paper you can always reach out."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

->DONE

=== BHS1_OnlyAConsideration ===
Bronislav: "Trust me, it was only a consideration. It was never something set in stone."

Hendricks: "I suppose that's what makes it complicated. I've got to head out now, but I'll stay in touch. Hope to see you again soon."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

->DONE

=== BHS1_ItsNotWorthIt ===
Bronislav: "It wasn't all that important in all honesty."

Hendricks: "Alright, well if you need anything from me, feel free to reach out to me."

She gets up from the table and leaves, waving at one of her students on the way out.

{HideCharacter("Hendricks")}

->DONE
