=== BP_ConferenceSubmissionDeadline_SceneStart ===
#---
# choiceLabel: Talk with Praveen.
# hidden: true
# @query
# Seen_BI_CONF
# date.day!3
# @end
# tags: action, library, required 
# repeatable: false

#===
# Summary: Praveen says if he is or is not going to be doing reviews for Hendricks 

//TODO: QUERY FOR HENDRICKS CONVO

{DbInsert("Seen_BP_ConferenceSubmissionDeadline")}
{ShowCharacter("Praveen", "left", "")} 
{DbAssert("metPraveen")}

You approach Praveen, who is currently skimming what appears to be a textbook.

Bronislav: "How's it going Praveen?"

Praveen: "Hey Bronislav! It's actually been amazing, and I have you to thank for it."

Bronislav: "Really? How so?"

Praveen: "Well, Hendricks reached out to me and asked if I would be interested in working on reviewing papers for the conference, and you and I both know I immediately said yes."

Bronislav: "Oh! For the upcoming conference?"

Praveen: "No, it's not for the same one you and Brad are submitting to. It's a couple of months away. But I'm still quite glad!"

*["I'm so happy for you!"]
->BP_ConferenceSubmissionDeadline_GladICouldHelp

*["Well, I expect I can call on you know if I need a favor."]
->BP_ConferenceSubmissionDeadline_IExpectFavor

=== BP_ConferenceSubmissionDeadline_GladICouldHelp ===
Bronislav: "I'm so happy for you! I know you'll do great."

Praveen: "Thank you Bronislav!" 

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



