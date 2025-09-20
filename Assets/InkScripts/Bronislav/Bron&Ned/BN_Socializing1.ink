=== BN_S1_SceneStart ===
# ---
# choiceLabel: Meet with Ned.
# @query
# Seen_BJ_INTRO
# Seen_BBS1
# date.day!1
# @end
# hidden: true
# repeatable: false
# tags: action, library, required
# ===



{ShowCharacter("Ned", "left", "")}

While walking through the library searching for a quiet place to work, you notice a department adviser, Ned, looking through the shelves.

Bronislav: "Good afternoon Professor!"

Ned: "Oh hello there Bronislav, good to see you! How have you been?""

*["I've been pretty good"]
    Bronislav: "I've been doing pretty good, just been working on classes and my research paper."
    
    Ned: "Thats good to hear, glad things are going well."
    
    Bronislav: "How about you how is everything going?"
    
    Ned: "Busy, but well, Brad is currently waiting on IRB approval."
    
    **["That's exciting."]->BNS1_ThatsExciting
    **["Has it been long?"]->BNS1_HasItBeenLong

*["Research paper has been going okay"]
    Bronislav: "I've been working on my research paper and it's been going pretty well."
    
    Ned: "I'm glad."
    
    Bronislav: "How about you?"
    
    Ned: "It's been pretty busy, but going relatively well, currently Brad is waiting on IRB approval."
    **["That's exciting."]->BNS1_ThatsExciting
    **["Has it been long?"]->BNS1_HasItBeenLong
*["Could be better"]
    Bronislav: "Eh, it could be going better, just a bit of work is all."

    Ned: "I'm sorry to hear that."
    
    Bronislav: "It's no biggy, just focused on work and my research paper."
    
    Bronislav: "How are you doing Professor?"
    
    Ned: "It's been pretty busy, but overall pretty well."
    
    Bronislav: "That's good to hear"
    
    Ned: "Currently on the lookout for Brad's IRB approval."
    
    **["That's exciting."]->BNS1_ThatsExciting
    **["Has it been long?"]->BNS1_HasItBeenLong
    
    
== BNS1_ThatsExciting ==
Bronislav: "That's exciting news, my study is almost ready for review!"

Ned: "That's nice! Seems like you're keeping busy too. I know Brad can be a little impatient, but it usually takes a while for IRB approval to go through."

Bronislav: "Yeah that makes sense."

Ned: "But it should come through pretty soon, he just needs to hold out a little longer."
*["That's good to hear."]->BNS1_ThatsGoodToHear
*["I bet you're excited for him."]->BNS1_IBetYoureExcitedForHim 

== BNS1_HasItBeenLong ==
Bronislav: "Has it been long since he submitted it?"

Ned: "In theory not too long, it usually takes a while for them to approve."

Bronislav: "Yeah, you know Brad, he can get a little impatient."

Ned: "Indeed, but the approval should arrive shortly." 

*["That's good to hear."]->BNS1_ThatsGoodToHear
*["I bet you're excited for him."]->BNS1_IBetYoureExcitedForHim 

== BNS1_ThatsGoodToHear ==
Bronislav: "That's good to hear, I'm glad things are going well."

Ned: "Yes, I'm excited for Brad, this is a big step and I want him to succeed."

Bronislav: "Just one more hurdle."

Ned: "Yes, I'm sure it will get approved I looked it over and all looked good to go."
*["I'm guessing he has his survey questions?"]->BNS1_DoesHeHavePreparations
*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_IBetYoureExcitedForHim ==

Bronislav: "I can see you're excited for him."

Ned: "Yes, this is a big step and I look forward to his success."
*["I'm guessing he has his survey questions?"]->BNS1_DoesHeHavePreparations
*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_DoesHeHavePreparations ==
Bronislav: "I'm guessing he has his survey questions?"

Ned: "Yes, he's told me he has them ready and is good to go once approval arrives."

*["I bet he's anxious to get them done."]->BNS1_IBetHesAnxious
*["As prepared as ever."]->BNS1_AsPreparedAsEver
*["I'm sure he'll do well."]->BNS1_ImSureHellDoWell

== BNS1_IBetHesAnxious ==
Bronislav: "I bet he's a bit anxious to get it all done."

Ned: "It seems that way."

You shrug your shoulders.

Bronislav: "I'm sure he's got it all under control."

Ned: "Yes it seems that way."

*["I'm sure he'll do well."]->BNS1_ImSureHellDoWell

== BNS1_AsPreparedAsEver ==
Bronislav: "He's as prepared as ever."

Ned: "Yes he seems to get a little impatient and jumps ahead sometimes when he should be taking a few steps back."

Bronislav: "Sometimes it seems to work in his favor."

Ned: "Yes, but not a good habit of his."
*["I agree"]->BNS1_IAgree
*["You never know"]->BNS1_YouNeverKnow
*["Understandable."]->BNS1_Understandable 

== BNS1_ImSureHellDoWell == 
Bronislav: "I'm sure he will do well."

Ned: "I agree wholeheartedly." 

*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_IAgree ==
Bronislav: "I agree, sometimes we need to backtrack."

Ned: "Yes indeed."
*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_YouNeverKnow ==
Bronislav: "Well you never know until it comes back around."

Ned: "Yes I suppose it could be seen that way. Although I think it's important to double-check before we dive forward."

Bronislav: "Yes I suppose." 
*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_Understandable ==
Bronislav: "Yes, that's understandable."

Ned: "It's like crossing a street, we need to look both ways before crossing."

Bronislav: "That analogy actually works very well."

Ned: "It's one of my favorites."

Ned gives a small smile. 

*["It was nice running into you."]->BNS1_ItWasNiceRunningIntoYou

== BNS1_ItWasNiceRunningIntoYou ==
Bronislav: "Well it was nice running into you, Professor."

Ned: "You too Bronislav."

Bronislav: "I gotta go get some work done, have a good rest of your day."

You give Ned a wave as you take your leave.

->HideNedAndEnd

== HideNedAndEnd ==
{HideCharacter("Ned")}
{DbInsert("Seen_BNS1")}
->DONE
