VAR basicsLie = false
VAR BradWithdrew = false

=== BN_Socializing5_SceneStart ===
# ---
# choiceLabel: Drop in to talk with Ned.
# @query
# date.day!5
# @end
# repeatable: false
# tags: action, neds_office, auxiliary
# ===
# Summary: Confronting Bronislav on what he knows about Brad's work

VAR honesty = false
VAR basics = false

~ basicsLie = DbAssert("Seen_BBS4")
~ BradWithdrew = DbAssert("BradWithdrawsData")


While you don't have a meeting scheduled with Ned, you decide to pop into his office to talk with him briefly. His door is open, and Ned is sitting at his desk as you walk in.
{ShowCharacter("Ned", "left", "")}

Bronislav: "Hello, Ned. How are things?"

Ned looks surprised to see you.

Ned: "Oh, hi Bronislav. I wasn't expecting you. You didn't happen to schedule an appointment that I am forgetting, did you?"

Bronislav: "No, nothing like that. Just wanted to chat."

Ned looks relieved.

Ned: "Well, that's good. I have my hands full at the moment with quite the situation, but I can always spare some time to talk."

*["What's going on?"]
->BN_Socializing5_WhatsGoingOn

=== BN_Socializing5_WhatsGoingOn ===
Bronislav: "What's going on?"

Ned: "I'm not sure I can discuss... actually, how much has Brad told you about his work with me?"

*["I don't really recall him mentioning anything." #>> ChangeOpinion Ned Bronislav -]
->BN_Socializing5_DontReallyRecall

*["Oh, just the basics."]
{basicsLie:
~ basics = true
}
->BN_Socializing5_JustTheBasics

*["He's mentioned some trouble with data." #>> ChangeOpinion Ned Bronislav +]
~ honesty = true
->BN_Socializing5_SomeTroubleWithData

=== BN_Socializing5_DontReallyRecall ===
Bronislav: "You know, I don't really recall him mentioning anything. Why?"

Ned's brow furrows slightly.

Ned: "I find that really interesting Bronislav, because he did mention talking to you about it breifly when we spoke yesterday."

Ned: "I understand you are trying to be a good friend to Brad and not say anything that might get him in trouble, but lying to me is not a good idea."

*["Sorry, Ned." #>> ChangeOpinion Ned Bronislav +]
->BN_Socializing5_SorryNed

*["I didn't realize Brad had said anything to you." #>> ChangeOpinion Ned Bronislav -]
->BN_Socializing5_IDidntRealize

=== BN_Socializing5_JustTheBasics ===
Bronislav: "Oh, you know, just the basics. Why, did something happen?"

Ned: "Hmm... okay. I could see Brad leaving out the specifics with you out of embarrasment."

Ned sighs.

Ned: "That at least is reassuring."

*["I'm not sure I follow."]
->BN_Socializing5_NotSureIFollow

*["Did something happen with Brad?"]
->BN_Socializing5_DidSomethingHappen

=== BN_Socializing5_SomeTroubleWithData ===
Bronislav: "He's mentioned some trouble with data."

Ned smiles sadly.

Ned: "Yeah, that's the problem. I am unfortunately in the process of dealing with the fallout."

*["What do you mean?"]
->BN_Socializing5_WhatDoYouMean

*["Did something happen with Brad?"]
->BN_Socializing5_DidSomethingHappen

=== BN_Socializing5_SorryNed ===
Bronislav: "I'm sorry Ned, I just didn't want to say anything if Brad hadn't."

Ned: "That's alright, I can understand that. But, we are long past the point of trying to hide our mistakes."

->BN_Socializing5_Explanation

=== BN_Socializing5_IDidntRealize ===
Bronislav: "I didn't realize Brad has said anything to you."

Ned: "I can understand the urge to try and help him cover up the situation, but we are long past that point now."

->BN_Socializing5_Explanation

=== BN_Socializing5_NotSureIFollow ===
Bronislav: "I'm not sure I follow."

Ned: "Well, I suppose this it might be a learning experience for you as well, so I am going to impart upon you the same knowledge that I have been telling Brad ever since these details about our data came to light."

->BN_Socializing5_Explanation

=== BN_Socializing5_DidSomethingHappen ===
Bronislav: "Did something happen with Brad?"

Ned: "Yes, and unfortunately it is very serious. While I am willing to bet Brad will tell you about it in his own time, I suppose this it might be a learning experience for you as well."

Ned: "I am going to impart upon you the same knowledge that I have been telling Brad ever since these details about our data came to light."

->BN_Socializing5_Explanation

=== BN_Socializing5_WhatDoYouMean ===
Bronislav: "What do you mean?"

Ned sighs.

->BN_Socializing5_Explanation

=== BN_Socializing5_Explanation ===


Ned: "You see, Brad did not wait for IRB approval before collecting data for our research. <>

{ honesty == true:
<> Ned: "As I am sure you are well aware, Brad was likely more worried about making sure things went smoothly, so he was willing to overlook the ethicality of preemptively collecting data without proper IRB approval." <>
}

{not BradWithdrew:
//if Brad did not withdraw data
<> Ned: "And because he attempted to cover that fact up, he is not only going to need to take ethics training before he is allowed to participate in any more research at this university, but this project in particular has to be supervised now and is being placed under ethics review."

Ned: "This entire process has turned into a headache, where it would have been much simpler if Brad had come clean and told me the situation so I could have withdrawn the paper."

Ned: "If Brad would have just been honest about the situation, I could have helped mitigate the damage done by his reckless actions, but much of this is out of my hands at this point."

Ned: "What's important for you to remember is that it's never worth violating ethics to get a paper published. Not only is it morally wrong, but it can land you in a heap of trouble."
}

{BradWithdrew:
//if Brad withdrew data
<> Ned: "Fortunately, Brad came clean to me about the situation, and I was able to withdraw the paper, and while it has been a slight headache for me trying to rework our timeline, it is far better than if he were to have withheld the fact that he had already conducted research from me.

Ned: I am very glad he came forward, because the reprocussions had he not would have been severe."

Ned: "While I know this is not something you were directly involved in, it's important to remember Brad's mistakes here, so that if you are ever in this situation, you come clean as soon as you realize you have made an ethics violation. Thankfully, Brad was honest and came forward about the situation early, and I was able to help mitigate the damage done by his oversight."

Ned: "What's important for you to remember is that it's never worth violating ethics just to get a paper published. Not only is it morally wrong, but it can land you in a heap of trouble. I am proud of Brad for realizing what was problematic about his actions and taking ownership of his mistakes."

}

Ned smiles sadly.

Ned: "Apologies. It's not like you came here to be lectured, but all the same, I think its important that we learn from more than just our own mistakes."

*["I appreciate the insight, Ned." #>>ChangeOpinion Ned Bronislav ++]
->BN_Socializing5_AppreciatetheInsight

*["Okay, I'll keep all of this in mind." #>>ChangeOpinion Ned Bronislav +]
->BN_Socializing5_IllKeepThisInMind

// if Brad withdrew the paper
{BradWithdrew:
*["I'm so glad Brad decided to withdraw."]
->BN_Socializing5_GladHeWithdrew
}

*["Right. Is it okay if I leave now?"]
->BN_Socializing5_OkayIfILeave

=== BN_Socializing5_AppreciatetheInsight ===
Bronislav: "I appreciate the insight, Ned."

Ned: "Anytime. You're a smart kid, and I know it can be tough to make the right decision sometimes, so I always find it can be helpful to learn from examples like these. But thank you for being willing to listen."

Ned:"Well, I have a phone call I need to make here, but I appreciate you stopping by. Do you mind closing that door on the way out?"

Bronislav: "Sure thing."

->BN_Socializing5_Outro

=== BN_Socializing5_IllKeepThisInMind ===
Bronislav: "Okay, I'll keep all of this in mind."

Ned: "I'm glad. You're a smart kid Bronislav, and I know it can be tough to make the right decision sometimes, so it can be helpful to learn from examples like these."

Ned:"Well, I have a phone call I need to make here, but I appreciate you stopping by. Do you mind closing that door on the way out?"

Bronislav: "Sure thing."

->BN_Socializing5_Outro

=== BN_Socializing5_GladHeWithdrew ===
Bronislav: "I'm so glad Brad decided to withdraw."

{ honesty == true && basicsLie:
Ned: "Oh, so Brad did talk to you in depth about his situation then?"

Bronislav: "Yes he did, he was really unsure about the whole situation, and I encouraged him to go with his gut and withdraw."

Ned nods approvingly.

Ned: "Well, he's lucky to have a supportive friend like you. I'm glad you supported him in his decision to come forward."
}

{ basics == true && basicsLie:
Ned raises an eyebrow.

Ned: "It seems you remember more than 'just the basics' then?"

Bronislav: "Uhm, yes?"

Ned shakes his head at you.

Ned: "It's never a good idea to lie to your advisor Bronislav. But, I can understand trying to protect Brad from any more trouble. Luckily for him, there won't be any major issues going forward because he came clean, just some internal delays."

- else:
Ned: "Yes, me too. Not only did it save me a lot of problems, it was simply the right thing to do."
}

Ned: "Well, I have a phone call I need to make here, but I appreciate you stopping by. Do you mind closing that door on the way out?"

Bronislav: "Sure thing."

->BN_Socializing5_Outro

=== BN_Socializing5_OkayIfILeave ===
Bronislav: "Right. Is it okay if I leave now?"

Ned: "Yes of course. Sorry for dronning on. I have a phone call I need to make here, but I appreciate you stopping by. Do you mind closing that door on the way out?"

Bronislav: "Sure thing."

->BN_Socializing5_Outro

=== BN_Socializing5_Outro ===
{HideCharacter("Ned")}

You gently close the door as you leave Ned's office.
{DbInsert("Seen_BN_Socializing5")}
->DONE
