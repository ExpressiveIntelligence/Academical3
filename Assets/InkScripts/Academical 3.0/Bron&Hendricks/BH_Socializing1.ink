=== start ===
#---
#===
-> library

=== library ===
#---
# choiceLabel: Go to the library.
# hidden: true
# tags: location
#===
->sceneStart

=== sceneStart ===

After your presentation, one of your professors, Hendricks, reached out to you to talk about your progress. 

She sits down at your table, setting down her bag next to her.

*["How are you doing?"]
->HowAreYou

=== HowAreYou ===
Bronislav: "Hey Hendricks. How are you doing?"

She shrugs. 

Hendricks: "Quite alright. Rather busy, but I was just interested in seeing how you're progress is going."

*["It's going good."]
->GoingGood

*["It could be going better."] 
->CouldBeBetter

*["It's complicated."]
->ItsComplicated

=== GoingGood ===

Bronislav: "The paper's going well! I also got some feedback on it at the lab meeting, so I'm taking that into account while I continue to work on it."

Hendricks: "Oh really? You're not working on all of this by yourself are you?"

*["I'm thinking about it."] 
->ThinkingAboutIt

*["I am for right now."]
->ForRightNow

=== CouldBeBetter ===
Bronislav: "Could be going better, but it could also be going worse. Just a lot of work for one-"

She interrupts you. 

Hendricks: "You're doing this all by yourself Bronislav?"

*["Just for now."] 
->JustForNow

*["That was the idea."]
// Bronislav: +Student-ALigned
// Hendricks: +Hands-off
->ThatsTheIdea

=== ItsComplicated ===
Bronislav: "It's pretty complicated. I've been thinking of adding a person who gave me feedback to the paper, but I still feel a bit conflicted about it due to the quality of their feedback."

Hendricks: "Oh? Do share."

*["His name is Jensen."] 
->HisNameIsJensen

*["It's not really worth talking about."]
->ItsNotWorthIt

=== ThinkingAboutIt ===
Bronislav: "I was debating adding the person who gave the feedback to the paper. Still a bit unsure about it at the moment."

Hendricks: "Do tell."

Bronislav: "His name was Jensen. While his feedback was a bit lacking-"

She raises an eyebrow and shows a bit of a smirk.

*["Everything okay?"]
->EverythingOkay

=== EverythingOkay ===
Bronislav: "Is everything ok?"

Hendricks: "Yes I'm fine thank you."

She says through a small laugh. 

Hendricks: "I know Jensen pretty well. I can say I'm not too surprised to hear that his feedback was... lacking. If you want to add him to your paper though I won't judge."

*["I feel like you are judging."]
// Bronislav: +Supportive
// Hendricks: +Demeaning
->IFeelLikeYouAre

*["I said I was unsure."]
// Bronislav: +Petty
// Hendricks: +Engaged
->ISaidIWasUnsure

=== IFeelLikeYouAre ===
Bronislav: "I feel like I am being judged. It feels like it could be a good advising opportunity for myself, and I'm always trying to sharpen my skills."

Hendricks: "Well, I'll have to wish you the best of luck with that then. Glad to hear the paper is going well though. Hope it stays that way."

She gets up from the table and leaves, waving at one of her students on the way out.

->DONE

=== ISaidIWasUnsure ===
Bronislav: "Exactly why I said I was unsure about it. Jensen's got promise, but maybe needs something more his speed."

Hendricks: "You could say that again. Glad to hear everything's going well Bronislav, I've got to head out but I hope we can meet again soon."

She gets up from the table and leaves, waving at one of her students on the way out.

-> DONE

=== ForRightNow ===
Bronislav: "I am for right now. I've gotten some feedback but it was... less than helpful." 

She chuckles. 

Hendricks: "Isn't that the truth. If you do find yourself needing some help you can always let me know."

*["I'll keep that in mind."]
// Bronislav: +Faculty-ALigned
// Hendricks: +Engaged
->IllKeepItInMind

*["I don't think that will be necessary."]
// Bronislav: +Student-ALigned
// Hendricks: +Hands-off
->DontThinkItsNecessary

=== IllKeepItInMind ===
Bronislav: "Thanks professor, I'll make sure to keep that in mind."

Hendricks: "Any time Bronislav. I've got to head out now, but I'm sure we'll be in touch."

She gets up from the table and leaves, waving at one of her students on the way out.
-> DONE

=== DontThinkItsNecessary ===
Bronislav: "Thanks for the offer professor, but I don't think that will be necessary. I know you're busy and I can handle myself."

Hendricks: "I see you haven't changed much Bronislav. Hope to talk to you later."

She laughs kindly and leaves, waving at one of her students on the way out.

->DONE

=== JustForNow ===
Bronislav: "Probably not for too much longer. I got some feedback at the introductory meeting and I've been debating on adding them."

Hendricks: "Do tell."

Bronislav: "His name was Jensen. While his feedback was a bit lacking-"

She raises an eyebrow and shows a bit of a smirk.

*["Everything ok?"]
->EverythingOkay

=== ThatsTheIdea ===
Bronislav: "That was the idea. You of all people should know that Professor."

She laughs.

Hendricks: "You've got me there Bronislav. Then I suppose I shouldn't bother you anymore, I'll keep in touch though. In case you do end up needing something."

She gets up from the table and leaves, waving at one of her students on the way out.
-> DONE

=== HisNameIsJensen ===
Bronislav: "I was approached by a student named Jensen and-"

She interrupts you.

Hendricks: "Jensen huh?"

She smirks a bit. 

Hendricks: "I can't say it's surprising to hear Jensen's feedback was less than helpful.
*["He has promise."] 
// Bronislav: +Supportive
// Hendricks: +Demeaning
->HeHasPromise
*["It was only a consideration."]
// Bronislav: +Petty
// Hendricks: +Engaged
->OnlyAConsideration

=== HeHasPromise ===
Bronislav: "Jensen's got some promise, I feel like a nudge in the right direction and he could be a great person to work with."

She shrugs. 

Hendricks: "Well I'd have to wish you the best of luck on that endeavour Bronislav. If you need some more helpful advice on your paper you can always reach out."

She gets up from the table and leaves, waving at one of her students on the way out.
->DONE

=== OnlyAConsideration ===
Bronislav: "Trust me, it was only a consideration. It was never something set in stone."

Hendricks: "I suppose that's what makes it complicated. I've got to head out now, but I'll stay in touch. Hope to see you again soon."

She gets up from the table and leaves, waving at one of her students on the way out.
->DONE

=== ItsNotWorthIt ===
Bronislav: "It wasn't all that important in all honesty."

Hendricks: "Alright, well if you need anything from me, feel free to reach out to me."

She gets up from the table and leaves, waving at one of her students on the way out.
->DONE





