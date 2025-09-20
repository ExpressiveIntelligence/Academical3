=== BP_Socializing3_SceneStart ===
# ---
# choiceLabel: Chat with Praveen.
# @query
# date.day!3
# Seen_BP_ConferenceSubmissionDeadline
# @end
# repeatable: false
# tags: action, student_cubes, auxiliary
# ===




{ShowCharacter("Praveen", "left", "")}
As you approach Praveen, he seems to be chuckling to himself at his desk.

Praveen: "Oh boy Bronislav, you're never going to believe this."

*["What's up?"]
->BP_Socializing3_WhatsUp

=== BP_Socializing3_WhatsUp ===
Bronislav: "What's up?"

Praveen gestures to his monitor where you can see some type of document plastered on the screen.

Praveen: "Get a load of this: 'We shall be addressing further applications through a broader lense, attempting to reach more ambitious conclusions. This shall be achieved by newly developed methods that we will be outlining presently.'"

*["What are you reading?"]
->BP_Socializing3_WhatAreYouReading

*["And let me guess... they don't come close to those ambitions." #>>ChangeOpinion Praveen Bronislav +]
->BP_Socializing3_LetMeGuess

*["Oh no. Don't tell me you're tearing into a freshman's work." #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_DontTellMe

=== BP_Socializing3_WhatAreYouReading ===
Bronislav: "What are you reading?"

Praveen: "Oh, you know, the latest and greatest submitted for peer review. I swear they let anyone into grad school these days."

*["Well, everyone except for Jensen." #>>ChangeOpinion Praveen Bronislav --]
->BP_Socializing3_ExceptforJensen

*["Sure, maybe their wording is clunky, but is the content actually any good?"]
->BP_Socializing3_ContentActually

*["Are you supposed to be sharing other people's stuff with me?" #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_SharingPeerReview

=== BP_Socializing3_LetMeGuess ===
Bronislav: "And let me guess... they don't come close to those ambitions."

Praveen smiles at you.

Praveen: "See, I knew we had the same sense of humor. Despite this absolute vague trainwreck of wording, this paper does actually make some good points. But, oh man, does this guy need to lay off the thesaurus."

*["So what is this paper for then?"]
->BP_Socializing3_WhatIsThisFor

*["Hey, take it easy, it's probably a freshman."  #>>ChangeOpinion Praveen Bronislav +]
->BP_Socializing3_ProbsAFreshman

=== BP_Socializing3_DontTellMe ===
Bronislav: "Oh no. Don't tell me you're tearing into a freshman's work."

Praveen gives you a half hearted sneer.

"Of course you'd think I'd pick on a freshman. No Bronislav. This is the paper I was assigned to review by Hendricks."

*["Are you seriously complaining about the thing you so desperately wanted?"  #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_AreYouSerious

*["Okay sure, maybe their wording is clunky, but is the content actually any good?"]
->BP_Socializing3_ContentActually

*["Are you supposed to be sharing peer review stuff with me?" #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_SharingPeerReview

=== BP_Socializing3_ExceptforJensen ===
Bronislav: "Well, everyone except for Jensen."

Praveen gives you a sideways glare.

Praveen: "Really, Bronislav? Who am I kidding, of course you would say something like that. You know he's my friend right?"

*["Interesting choice in friends." #>>ChangeOpinion Praveen Bronislav ---]
->BP_Socializing3_InterestingChoice

*["Sorry, I didn't know." #>>ChangeOpinion Praveen Bronislav +]
->BP_Socializing3_IDidntKnow

=== BP_Socializing3_ContentActually ===
Bronislav: "Okay sure, maybe their wording is clunky, but is the content actually any good?"

Praveen: "Yes, I'll admit that at least. Surprisingly, admidst all of this superfluous jargon, their content and findings are actually pretty interesting."

Praveen turns around in his chair to face you.

Praveen: "Actually, since you're here, I want to run something by you."

*["Okay, what's up?"]
->BP_Socializing3_OkayWhatsUp

=== BP_Socializing3_SharingPeerReview ===
Bronislav: "Are you supposed to be sharing other people's work with me?"

Praveen rolls his eyes.

Praveen: "Oh great, so now you're the moral police. I was trying to share something funny with you, Bronislav."

*["Well, you shouldn't be sharing it."]
->BP_Socializing3_YouShouldntBe

*["Okay, but you should definitely keep it quiet." #>> ChangeOpinion Praveen Bronislav +]
->BP_Socializing3_KeepItQuiet

=== BP_Socializing3_WhatIsThisFor ===
Bronislav: "So what is this paper for then?"

Praveen: "This steaming pile of garbage is the lovely paper Hendricks assigned me to peer review. You know, when she gave me this job, I figured I'd be looking at something a little more important and intersting honestly."

*["Are you seriously complaining about the thing you so desperately wanted?"  #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_AreYouSerious

*["Okay sure, maybe their wording is clunky, but is the content actually any good?"]
->BP_Socializing3_ContentActually

*["Are you supposed to be sharing peer review stuff with me?" #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_SharingPeerReview

=== BP_Socializing3_ProbsAFreshman ===
Bronislav: "Hey, take it easy, it's probably a freshman."

Praveen: "It's definitely not a freshman, but why I am not surprised you just want me to judge me for making fun of it."

*["So what is this paper for then?"]
->BP_Socializing3_WhatIsThisFor

=== BP_Socializing3_AreYouSerious ===
Bronislav: "Are you seriously complaining about the thing you so desperately wanted?"

Praveen shoots you an annoyed look.

Praveen: "Just because I wanted to do this job doesn't mean I need to be happy about the paper I get, especially if it is as unreadable as this one. Making fun of it is about the only thing that is keeping me sane at the moment."

*["Okay sure, maybe their wording is clunky, but is the content actually any good?"]
->BP_Socializing3_ContentActually

*["Are you supposed to be sharing peer review stuff with me?" #>>ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_SharingPeerReview

=== BP_Socializing3_InterestingChoice ===
Bronislav: "Interesting choice in friends."

Praveen: "Do you just enjoy being rude? Like... just... wow."

Bronislav: "No, but I'm allowed to have my own opinion of Jensen."

Praveen: "And I'm allowed to have my own opinion of you. Now if you don't mind, I'd rather do my work now rather than waste time talking to you."

Praveen turns back to his computer without another word. Perhaps it's better to leave him alone.

// TODO: cement Praveen yapping to the rest of the department
{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing3")}
->DONE

=== BP_Socializing3_IDidntKnow ===
Bronislav: "Sorry, I didn't know."

Praveen sighs.

Praveen: "Okay, whatever. You know you should probably consider who you are talking to before you bash somebody like that. I mean, everyone in this department talks."

Praveen: "I'm just going to forget that just happened... but what was I talking to you about?"

Praveen: "Oh, right yeah, I was actually going to ask you something about this paper actually."

*["Okay, what's up?"]
->BP_Socializing3_OkayWhatsUp

=== BP_Socializing3_OkayWhatsUp ===
Bronislav: "Okay, what's up?"

Praveen: "So the wording of this paper is a mess, we've established that. But in between that mess, it really does have some good information, information I think could be really beneficial to share with the rest of the department. What do you think of the idea of me doing it?"

*["I think that's a great idea!" #>> ChangeOpinion Praveen Bronislav ++]
->BP_Socializing3_GreatIdea

*["I'm not sure, I think there are rules against it."]
->BP_Socializing3_IThinkTheresRules

*["You really shouldn't be sharing it." #>>ChangeOpinion Praveen Bronislav +] 
->BP_Socializing3_YouShouldntBe

=== BP_Socializing3_YouShouldntBe ===
Bronislav: "Well, you really shouldn't be sharing it. That's a great way to get banned from being a peer reviewer."

Praveen's eyes grow wide with surprise.

Praveen: "Wait, actually? I just thought you were maybe just being hypercritical."

Bronislav: "No, I'm not. Talking about papers like that is absolutely not allowed."

Praveen: "Well... shoot. Wait, so if I can't talk about the paper, I'm assuming that means I probably can't talk about the good stuff in this paper either then, huh?"

*["No, you can't." #>> ChangeOpinion Praveen Bronislav +]
->BP_Socializing3_NoYouCant

*["What do you think?" #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_WhatDoYouThink

=== BP_Socializing3_KeepItQuiet ===
Bronislav: "Okay, I understand that it may be tedious to read and review, but you should definitely keep it quiet."

Praveen nods.

Praveen: "Well, its a good thing I told you in confidence then, right? But... wait. If I am not supposed to talk about this paper, does that mean I can't talk about the good stuff either?"

*["No, you can't."]
->BP_Socializing3_NoYouCant

*["What do you think?" #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_WhatDoYouThink

=== BP_Socializing3_GreatIdea ===
Bronislav: "I think that's a great idea! I think there's some taboo around sharing stuff from paper's like that, but it's kinda old school honestly."

Praveen: "Sweet. I've heard something like that too, but since I've the goody-two-shoes seal of approval, I definitely can't go wrong. Thanks Bronislav."

Bronislav: "Yeah, no problem."

Praveen: "Well I guess that's all the more reason to pay as much attention to this paper. Since I need to give this my full attention now, I'll chat with you more later."

Praveen turns back to his computer as you leave his cubicle.

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing3")}
->DONE

=== BP_Socializing3_IThinkTheresRules ===
Bronislav: "I'm not sure that you can Praveen. I think there are rules against it."

Praveen: "Hmm... I could definitely see that for the horrible wording, but what about the good stuff? Surely that wouldn't be a problem to talk about, right?"

*["No, you can't."]
->BP_Socializing3_NoYouCant

*["What do you think?" #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing3_WhatDoYouThink


=== BP_Socializing3_NoYouCant ===
// TODO: cement Praveen does not yap to the rest of the department
Bronislav: "No, you can't."

Praveen: "Alright, I won't then. Hendricks definitely should have explained that better from the start. But at least you told me and saved me from an future headache. Thanks, Bronislav."

Bronislav: "Yeah, no problem."

Praveen: "Well, I guess I better get back to my silent slog through this paper. I'll chat with you more later."

Praveen turns back to his computer as you leave his cubicle.

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing3")}
->DONE

=== BP_Socializing3_WhatDoYouThink ===
// TODO: cement Praveen does not yap to the rest of the department
Bronislav: "What do you think?"

Praveen: "Sheesh... alright I get it. No talking about the paper. A bit harsh if you ask me, but I guess that's the airing on the side of caution for you. I better get back to my silent slog through this paper, if you don't mind."

Praveen turns back to his computer as you leave his cubicle.

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing3")}
->DONE


