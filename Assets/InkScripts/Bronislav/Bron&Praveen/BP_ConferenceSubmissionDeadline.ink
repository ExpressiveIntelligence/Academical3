=== BP_ConferenceSubmissionDeadline_SceneStart ===
#---
# choiceLabel: Talk with Praveen.
# hidden: true
# @query
# metPraveen
# metHendricks
# @end
# tags: action, library, auxiliary
# repeatable: false

#===

//TODO: QUERY FOR HENDRICKS CONVO

{DbInsert("Seen_BP_ConferenceSubmissionDeadline")}
{ShowCharacter("Praveen", "left", "")} 

You approach Praveen, who is currently skimming what appears to be a textbook.

Bronislav: "How's it going Praveen?"

{DbAssert("metPraveen"):

// TODO: Related to Hendricks Query, basically dependent on whether or not you talked to Praveen, then recommended him to Hendricks, defaulting to putting a good word with Hendricks

// TODO: if you talked to Praveen initally, and decided to tell Hendricks about Praveen wanting to work at the conference
Praveen: "Hey Bronislav! It's actually been amazing, and I have you to thank for it."

Bronislav: "Really? How so?"

Praveen: "Well, since you mentioned my name to Hendricks, she reached out to me and asked if I would be interested in working on reviewing papers for the conference, and you and I both know I immediately said yes."

Bronislav: "So your plan worked?"

Praveen: "Absolutely and exactly as anticipated. I can't thank you enough, Bronislav."

*["Glad I could help."]
->BP_ConferenceSubmissionDeadline_GladICouldHelp

*["Well, I expect I can call on you know if I need a favor."]
->BP_ConferenceSubmissionDeadline_IExpectFavor

// TODO: if you talked to Praveen initally and decided not to tell Hendricks about Praveen wanting to work at the conference

//Praveen: "It really could be going better."

//*["What's wrong?"]
//->BP_ConferenceSubmissionDeadline_WhatsWrong

//*["Did you end up getting asked by Hendricks?"]
//->BP_EndUpAsked

- else:

Praveen: "Oh, hey Bronislav, long time no see."

Bronislav: "Yeah, seriously. I've seen you around the lab, but I haven't actually had the chance to talk to you in a while."

Praveen: "Same here honestly. Research has been keeping me very busy, but truth be told, I wish I was a lot busier."

Bronislav: "Oh? Why is that?"

Praveen: "Well, I was hoping that Hendricks would invite me to help with the conference coming up and reviewing papers, but she didn't end up asking me."

*["Sorry to hear that."]
->BP_ConferenceSubmissionDeadline_OhSorry

*["She's missing out." #>> IncrementRelationshipStat Praveen Bronislav 5]
->BP_ConferenceSubmissionDeadline_ThatsTough

*["You can't expect too much." #>> DecrRelationshipStat Praveen Bronislav 10]
->BP_ConferenceSubmissionDeadline_CantExpectTooMuch
}

=== BP_ConferenceSubmissionDeadline_GladICouldHelp ===
Bronislav: "I'm so glad I could help with this."

Praveen closes his textbook as he smiles brightly.

Praveen: "Well, I gotta head out, but I will be chatting more with you soon."

Bronislav: "Alright sounds good, see you!"

Praveen: "Buh-bye."

{HideCharacter("Praveen")}

->DONE

=== BP_ConferenceSubmissionDeadline_IExpectFavor ===

Bronislav: "Well, since I helped you with this, I definitely expect that if I ever need help with something similar you'd be willing to help me."

Praveen: "Oh yes, of course, whatever you need. Doing this was really important to me, so I'm happy to return the favor."

Praveen closes his textbook as he smiles brightly.

Praveen: "Well, I gotta head out, but I will be chatting more with you soon."

Bronislav: "Alright sounds good, see you!"

Praveen: "Buh-bye."

{HideCharacter("Praveen")}

->DONE

=== BP_ConferenceSubmissionDeadline_WhatsWrong ===
Bronislav: "What's wrong?"

Praveen: "It seems even you putting in a good word for me wasn't enough to get Hendricks to ask me to help. I don't know how to feel about all this, but saying I feel really inadequate doesn't even begin to cover it."

*["I can't believe she didn't consider you." #>> IncrementRelationshipStat Praveen Bronislav 5]
->BP_ConferenceSubmissionDeadline_CantBelieve

*["I didn't actually talk to her about you." #>> DecrRelationshipStat Praveen Bronislav 15]
->BP_ConferenceSubmissionDeadline_IDidntTalkToHer

=== BP_ConferenceSubmissionDeadline_IDidntTalkToHer ===
Bronislav: "Yeah, so the thing is, I didn't actually talk to her about you."

Praveen slams the book he's holding closed, utterly stunned.

Praveen: "You... what? Bronislav, I... why wouldn't you talk to her? You knew it would help me if you did."

*["It just didn't come up."  #>> IncrementRelationshipStat Praveen Bronislav 5]
Bronislav: "I'm sorry, it didn't come up."

Praveen sighs, and rolls his eyes.

Praveen: "Or you just simply forgot... well... I appreciate the honesty. That makes me feel a little better that she didn't just outright reject me at least."

Praveen: "Well, I need to head out for now, but I'll see you around Bronislav."

Bronislav: "See you."

{HideCharacter("Praveen")}

->DONE

*["You wouldn't do the same for me." #>> DecrRelationshipStat Praveen Bronislav 5]
Bronislav: "You wouldn't exactly do the same for me Praveen."

Praveen: "Well, you're right, now I definitely wouldn't. Whatever, Bronislav, be like that."

Praveen: "I gotta go."

{HideCharacter("Praveen")}

Praveen walks past you with a hurt look on his face as he leaves. 

->DONE

*["I didn't think you were worth praising to Hendricks." #>> DecrRelationshipStat Praveen Bronislav 20]
Bronislav: "I didn't think you were actually worth praising to Hendricks. Unlike you, I actually care what she thinks about me."

Praveen looks disgusted and hurt.

Praveen: "I don't even know what to say to you. Goodbye, Bronislav."

{HideCharacter("Praveen")}

Praveen walks by you without another word. Perhaps you were too harsh...

->DONE

=== BP_ConferenceSubmissionDeadline_CantBelieve ===
Bronislav: "Wow, I can't believe she didn't consider you."

Praveen sighs halfheartedly.

Praveen: "Well, at least you tried. I appreciate that at least."

He sighs as he closes the cover of the book in his hands.

Praveen: "Well, I gotta head out, but I'll see you around Bronislav."

Bronislav: "Yeah, see you."

{HideCharacter("Praveen")}

->DONE

=== BP_ConferenceSubmissionDeadline_OhSorry ===
Bronislav: "Oh, I'm sorry to hear that. You definitely would have been good at that."

Praveen: "Yeah, well thanks, but still, I just wish she would've picked me to help is all."

Bronislav: "But everything else has been okay at least?"

Praveen: "Yeah, aside from wanting to help with the conference and actually getting some experience reviewing, I've been able to do most of what I've been planning on this year, so hopefully that makes up for not being able to do conference stuff."

Praveen looks a bit disappointed, but still seems optimistic overall.

Praveen: "Well, I gotta head out, but it was nice talking with you Bronislav. We should definitely chat more when we can."

Bronislav: "Yeah, nice talking with you."

{HideCharacter("Praveen")}

->DONE

=== BP_ConferenceSubmissionDeadline_ThatsTough ===
Bronislav: "That's a real tough one, Hendricks is missing out."

Praveen smiles a bit.

Praveen: "Thanks, Bronislav. I'm glad my qualifications have impressed you enough to command some respect. I wish that had worked on Hendricks though."

He sighs as he closes the cover of the book in his hands.

Praveen: "At least there's the fact that aside from wanting to help with the conference and actually getting some experience reviewing, I've been able to do most of what I've been planning on this year, so hopefully that makes up for not being able to do conference stuff."

Praveen looks a bit disappointed, but still seems optimistic overall.

Praveen: "Well, I gotta head out, but it was nice talking with you Bronislav. We should definitely chat more when we can."

Bronislav: "Yeah, nice talking with you."

{HideCharacter("Praveen")}

->DONE

=== BP_ConferenceSubmissionDeadline_CantExpectTooMuch ===
Bronislav: "Yeah, you can't expect too much, especially considering your lack of experience with conference review."

Praveen shoots you a cold look, and his expression sours.

Praveen: "Figures you would take advantage of even the smallest opportunity to gloat. After all, you and Hendricks just get along swimmingly."

He slams the book in his hands closed.

Praveen: "Well, since you just want to patronize me, I'll leave you and your superiority to gloat in peace."

Praveen leaves before you can say anything else to him.

{HideCharacter("Praveen")}

->DONE