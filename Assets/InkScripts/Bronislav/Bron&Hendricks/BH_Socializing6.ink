@ -1,309 +0,0 @@
=== BH_Socializing6_SceneStart ===
# ---
# choiceLabel: Speak with Hendricks.
# @query
# date.day!6
# @end
# repeatable: false
# tags: action, hendricks_office, auxiliary
# ===

//TODO: Create a variable to see if Bronislav took the quid pro quo deal

VAR appreciate_honesty = true
~temp r = GetOpinionState("Hendricks", "Bronislav")
{r == OpinionState.Terrible || r == OpinionState.Bad || r == OpinionState.Neutral:
    appreciate_honesty = false
}


{ShowCharacter("Hendricks", "left", "")}


~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 


Hendricks: "Thank you for coming, Bronislav."

Bronislav: "Of course, you wanted to see me."

Hendricks: "Yes, I had some things I wanted to discuss with you."

*[Take a seat.]

{IvyAcceptedOfficial: ->BH_Socializing6_QuidProQuo}

{IvyDeniedOfficial: ->BH_Socializing6_NO_QuidProQuo}

=== BH_Socializing6_NO_QuidProQuo ===
You take a seat in the chair in front of Hendricks' desk before she crosses her hands on her desk. 

Hendricks: "I spoke with Ivy yesterday."

*["Oh you did?"] 
->BH_Socializing6_OhYouDid

*["She deserved it."] 
->BH_Socializing6_DeservedIt

*["It wasn't cool what happened."]
->BH_Socializing6_WasntCool

=== BH_Socializing6_OhYouDid ===
Bronislav: "Oh, you did? What did you two talk about?"

Hendricks: "I had to have a rather unfortunate discussion about her leveraging your situation for her benefit. You did the right thing in standing strong, but I can't imagine it was easy being approached by someone of her position with an offer like that."

Hendricks: "As you well demonstrated, integrity is important. Academic integrity is essential to your life as a student, but out in the real world, maintaining your integrity is absolutely paramount to becoming respected and conducting valid research in your field."

Hendricks: "Ivy's manipulation cannot be tolerated, and she has been reported. Due to the situation, it sounds like serious measures will be taken to ensure something like this does not happen to another student."

*["Yes, I understand."]
->BH_Socializing6_Understood

*["I felt like I was being backed into a corner."] 
->BH_Socializing6_BackedIntoACorner

*[Nod your head.]
->BH_Socializing6_NodHead

=== BH_Socializing6_DeservedIt ===
Yeah, she deserved it, you think to yourself. But, you don't think saying that is a good idea...you don't want to be immature about things, and it's not like you hate Ivy after everything.

*["Oh you did?"] 
->BH_Socializing6_OhYouDid

*["It wasn't cool what happened"]
->BH_Socializing6_WasntCool

=== BH_Socializing6_WasntCool ===
Bronislav: "Yeah, it wasn't cool what happened...I felt a like I was being backed into a corner, especially with her dangling a solution to my visa sponsor in front of me." 

Hendricks: "I'm sorry for that. Considering that you did need that job, I can understand how hard it must have been to turn it down. I am proud of you for standing your ground."

Bronislav: "Thanks, Professor." 

*["What did you two discuss?"]
->BH_Socializing6_WhatDidYouDiscuss

=== BH_Socializing6_Understood ===
{appreciate_honesty == true:
Bronislav: "Yes, I understand. In the end, I'm glad I made the right call. Although losing that job was frustrating, there will be more opportunities. Real ones."

Hendricks: "Absolutely, I'm glad to see you're in a positive mindset. And, as I am sure you already know, your faculty advisors are here to help you, whether that's finding opportunities, resources, or just advice, that's our job."

You nod your head.

Hendricks: "I appreciate you being honest with me, and it's because of that honesty that you will get to continue all of your research uninterrupted by scrutiny from the department. I certainly can't say the same for Ivy, but I am very proud of how you handled yourself in this situation." 

-else:

Bronislav: "Yes, I understand. In the end, I'm glad I made the right call. Although losing that job was frustrating, there will be more opportunities. Real ones."

Hendricks: "Absolutely, I'm glad to see you're in a positive mindset. And, as I am sure you already know, your faculty advisors are here to help you, whether that's finding opportunities, resources, or just advice, thats our job."

You nod your head.

Hendricks: "Things are better if we are honest."
}

*["Thank you Professor."]
->BH_Socializing6_ThankYou

=== BH_Socializing6_BackedIntoACorner ===
Bronislav: "I felt a like I was being backed into a corner."

Hendricks frowns a bit.

Hendricks: "I'm sorry that happened to you. This is exactly why I wanted to chat with you about Ivy's blatant disregard for academic integrity."

*["I don't hate Ivy."] 
->BH_Socializing6_DontHateIvy

*["I understand what she did was out of line."]
->BH_Socializing6_OutofLine

=== BH_Socializing6_NodHead ===
You nod your head. 

Hendricks: "I'm glad that you agree."

Bronislav: "It was hard, I was very tempted for this job and didn't consider the full extent of what the consequences would be." 

Hendricks: "We all make mistakes, and given your immigration status, it's very understandable that it made saying no to Ivy all the more difficult." 

Hendricks: "In the end, however, you made the right decision, and I'm very proud of you for that. It not only speaks to your integrity, but how strongly you believe in protecting the validity of your work."

*["Thank you Professor."]
->BH_Socializing6_ThankYou

=== BH_Socializing6_WhatDidYouDiscuss ===
Bronislav: "What did you two discuss?"

Hendricks: "Well, for starters, she has been reported and it seems as though serious actions will be taken due to the manner of the situation. Her actions towards you will never be tolerated in an academic space. In simple terms, her attempt to dangle a job in front of you to get what she wanted was textbook quid pro quo."

Hendricks: "Academic integrity is important, especially when you all are so close to getting jobs. Everything you do here is reflected on your future in the industry. I know you've probably heard this quite a lot, but honesty is important."

*["Yes, I understand."]
->BH_Socializing6_Understood

*["I felt like I was being backed into a corner."] 
->BH_Socializing6_BackedIntoACorner

*[Nod your head.]
->BH_Socializing6_NodHead

=== BH_Socializing6_ThankYou ===
Bronislav: "Thank you Professor."

Hendricks: "Anytime, Bronislav. I have another student coming in shortly, but I really appreciate you taking the time to come and talk with me."

You nod your head, standing from your seat. 

Bronislav: "Of course." 

With that you wave goodbye and head out. 
{HideCharacter("Hendricks")}
{DbInsert("Seen_BH_Socializing6")}
->DONE

=== BH_Socializing6_DontHateIvy ===
Bronislav: "I don't hate Ivy..."

Hendricks smiles.

Hendricks: "Don't worry, Bronislav, I understand. Ivy will come around if she hasn't already."

*["Thank you Professor."]
->BH_Socializing6_ThankYou

=== BH_Socializing6_OutofLine ===
Bronislav: "I understand what she did was out of line."

Hendricks: "I can tell you were under a lot of stress, and I know it's hard being in a situation like that. But, because you made the right decision, you gained a lot of respect, and not just from me."

Hendricks: "In the meantime, we will be handling this situation on our end and make sure all students are aware of what qualifies as quid pro quo in academia, and how to spot signs of unfair power leverages."

Hendricks: "But that's not something you need to worry about, you are still able to continue forward on your research." 

*["Thank you Professor."]
->BH_Socializing6_ThankYou

=== BH_Socializing6_QuidProQuo ===
You take a seat in the chair in front of Hendricks' desk before she crosses her hands on her desk. 

Hendricks: "I spoke with Ivy yesterday."

*["Oh you did?"]
->BH_Socializing6_YouDid

=== BH_Socializing6_YouDid ===
Bronislav: "Oh you did..."

Hendricks: "Indeed, I had to have a rather unfortunate discussion about her leveraging your situation for her benefit. And it seems like you were coerced into playing along."

Hendricks: "You need to understand, Bronislav, integrity is important. Academic integrity is essential to your life as a student, but out in the real world, maintaining your integrity is absolutely paramount to becoming respected and conducting valid research in your field." 

Hendricks: "Ivy's manipulation cannot be tolerated, and she has been reported. It seems as though serious measures will be taken to ensure something like this does not happen to another student."

*["Isn't all of that a little unnecessary?"] 
->BH_Socializing6_Unnecessary

*["I needed that job..."]
->BH_Socializing6_NeededThatJob

*["I understand..."]
->BH_Socializing6_IUnderstand

=== BH_Socializing6_Unnecessary ===
Bronislav: "Is all of that really necessary? It seemed like she was trying to help me, even if it benefitted her too."

Hendricks: "Yes, Bronislav, it really is. Ivy has displayed a complete disregard for academic integrity for a person of her position, and took advantage of your immigration status being dependant on finding a work visa to create a quid pro quo that you would feel compelled to go along with." 

Hendricks: "A chat from me is only the beginning of the reprocussions for her actions."

Hendricks: "But in terms of your part in the situation, I don't think taking action against you is necessary. That being said, it is incredibly important you understand the severity of this situation."

*["I see."]
->BH_Socializing6_ISee

=== BH_Socializing6_NeededThatJob ===
Bronislav: "I just...really needed that job with everything."

Hendricks looks up at you as she sighs. 

Hendricks: "I understand, Bronislav, but how you get a job matters just as much as having one. I work with many students who have gone through something similar. However, there are plenty of other ways to find work, ones that don't require you to compromise yourself. It is incredibly important you understand the severity of this situation."

*[""I understand..."]
->BH_Socializing6_IUnderstand

===BH_Socializing6_IUnderstand ===
Bronislav: "I understand Professor... I just wanted everything to work out. With my visa, I feel like I have to jump at every job opportunity, because once my student visa is up, if I don't have work, I really am in trouble."

Hendricks nods.

Hendricks: "I understand that it may feel like you are stuck an impossible position, Bronislav, but it's important you learn from your mistakes here and now. If something like this were to happen in a professional setting, even if you aren't at fault like in this situation, you could still lose your job, and even worse, you could gain a reputation of being pliable which can be impossible to overcome. 

Hendricks: "I really see a lot of potential in you Bronislav, and I would hate to see it diminished by something like this."

*[Nod your head.]
->BH_Socializing6_NodHeadBad

=== BH_Socializing6_ISee ===
Bronislav: "I see."

Hendricks: "Look, I understand that this an akward situation and that you may feel embarrassed. I understand that it may feel like you are stuck an impossible position, Bronislav, but it's important you learn from your mistakes here and now."

Hendricks: "If something like this were to happen in a professional setting, even if you aren't at fault like in this situation, you could still lose your job, and even worse, you could gain a reputation of being pliable which can be impossible to overcome. 

Hendricks: "I really see a lot of potential in you Bronislav, and I would hate to see it diminished by something like this."

*[Nod your head.]
->BH_Socializing6_NodHeadBad

=== BH_Socializing6_NodHeadBad ===
{appreciate_honesty == true:
You nod your head in understanding to which Hendricks responds with a small smile.

Hendricks: "Everything will work out, even if it doesn't feel like it right now. This may not have been how you anticipated this going, but it is better that it happens now where you still have space to learn from it. I believe you will learn from this and grow from this experience Bronislav."

*["I appreciate it."]
->BH_Socializing6_IAppreciateIt

-else:
You nod your head in understanding. Hendricks nods in response.

Hendricks: "Everything will work out, even if it doesn't feel like it right now. This may not have been how you anticipated this going, but it is better that it happens now where you still have space to learn from it. I have another student coming in soon, but if you have any further questions, please feel free to reach out."

Bronislav: "Okay I will."

Hendricks gives a small nod as you stand from your seat and make your way out. 
{HideCharacter("Hendricks")}
{DbInsert("Seen_BH_Socializing6")}
->DONE

}

=== BH_Socializing6_IAppreciateIt ===
Bronislav: "I appreciate it, Professor, thank you."

Hendricks: "Anytime, Bronislav, and please remember, I am here to help you. I want nothing more than to see you succeed."

*["I'll try to keep that in mind more in the future."]
Bronislav: "I'll try to keep that more in mind in the future."

Hendricks: "Glad to hear it. I hate to rush you out, but I have another student coming in soon. Thank you for taking time out of your day to meet with me, Bronislav."

Bronislav: "No, thank you for all your help, Professor."

Hendricks: "Anytime."

Hendricks gives a small smile as you stand from your seat and make your way out of Hendricks' office. 
{HideCharacter("Hendricks")}
{DbInsert("Seen_BH_Socializing6")}
->DONE

//TODO: make a selector back in Socializing 5 to add this dialogue based on whether you confided in hendricks
=== BH_Socializing6_JobOffer ===
Bronislav: "Hendricks, I wanted to ask you if you had any updates on the visa situation. I know I confided in you about it the last time we talked, and you said you would let me know if you have any updates."

Hendricks: "I do actually, Bronislav, thank you for reminding me! I talked to one of my contacts about your research and as it turns out, they have a recently opened position at their company that needs someone of your skillset." 

Hendricks: "I talked with them, and they would love to have an interview with you, if you're open to it. And they told me to tell you, that without a doubt, they will sponsor your visa if that interview goes well."

Hendrick's words almost don't feel real. This is a job, a real job, that will make all of your visa worries disappear. And nobody is twisting your arm to do something in exchange for it. 

Bronislav: "I don't know what to say, thank you so much Professor."

Hendricks: "Of course! I am so happy that I could help you Bronislav. You deserve it, after everything you've been through."
{HideCharacter("Hendricks")}
{DbInsert("Seen_BH_Socializing6")}

->DONE
