@ -1,199 +1,223 @@
// Author: Ivy Dudzik
//VAR metHendricksDay1 = false 

=== BHS3_Hint ===

\*Buzz Buzz\* Your phone vibrates with a notification.

It's a reminder of your meeting with Hendricks today. 

* [Continue plans to meet with her #>> ChangeOpinion Hendricks Bronislav +]
    You will be meeting Hendricks in her office today. 
    {DbInsert("BHS3_unlocked")}
    -> DONE
    
* [Cancel meeting] 
 You think about cancelling, but remember that it's been a while since you've updated her on any of your progress. Evenmoreso maybe you should get a second opinion on Ivy's offer? 
 
**[Continue plans to meet with her #>> ChangeOpinion Hendricks Bronislav +] 
 You will be meeting Hendricks in her office today. 
    {DbInsert("BHS3_unlocked")}
    -> DONE

**[Still cancel meeting #>> ChangeOpinion Hendricks Bronislav --] 
You write a brief email saying that you can not make it to today's meeting. She gives a short response. 
{DbInsert("BHS3_ignored")}
-> DONE 


=== BHS3_sceneStart ===
//~metHendricksDay1 = DbAssert("Seen_BHS1") 
# ---
# choiceLabel: Meet with Hendricks
# @query
# BHS3_unlocked
# date.day!3
# @end
# tags: action, hendricks_office, required
# repeatable: false
# ===



{ShowCharacter("Hendricks", "left", "")}

~ignoredHendricks = DbAssert("BHS1_ignored")

You enter Hendricks' office, eyeing a meticulously organized stack of books next to her. The largest of the books lies open on the table in front of her, and she is lost in thought. 

//{not metHendricksDay1: 
//It's been a while since you've talked to her, and with everything going on it's hard to know what to say. 
//}
{ignoredHendricks: It's been a while since you've talked to her, and with everything going on it's hard to know what to say.}

*[Clear your throat.] -> clearThroat

=clearThroat
Bronislav: "Ahem."
-> continuedDialogue

*["Hello professor."] -> helloProfessor 

=helloProfessor
Bronislav: "Hello professor."

->continuedDialogue

=continuedDialogue

Hendricks: "Bronislav!"

She turns to you smiling.

{ignoredHendricks: Hendricks: "Long time no see!"} 

Hendricks: "I didn't see you there, take a seat!" 

//{not metHendricksDay1: 
//Hendricks: "It's been quite some time since we've talked." 
//}

Hendricks: "How are you doing?"

//{not metHendricksDay1: 
//Hendricks: "You seem like you have something on your mind." 
//}
{ignoredHendricks: Hendricks: "You seem like you have something on your mind."}

*["I'm fine, how are things with you?" # >> ChangeOpinion Hendricks Bronislav -]->BHS3_ImFine

*["Ivy offered to get me a job... if I add Jensen to my paper." # >> ChangeOpinion Hendricks Bronislav ++]->BHS3_IvyOfferedMeJob


== BHS3_IvyOfferedMeJob ==
    Bronislav: "Ivy offered to help me get a job... but her support is conditional upon Jensen being credited on my paper."
    
    Hendricks: "Oh, wow. How do you feel about that?"
    
    *["It seems like a fair deal."]
        Bronislav: "It seems like a fair deal. Jensen gets the credit he needs for grad school and I get a sponsor for my visa."
        
        Hendricks: "I don't know if you should be so comfortable with this arrangement, Bronislav. I don't think its ethical to trade favors like this in an academic context."
        
        **["Why not?"]->BHS3_WhyNot
    *["It feels wrong, right?"]
        Bronislav: "It feels wrong, right? Ivy has been really focused on the fact that I need someone to sponsor my visa, and it has really been stressing me out. I know I could really use what she's offering, but I am not sure that its the right thing to do."
        
        Hendricks: "I think you are right. It feels like a breach of ethics to me that Ivy even put you in such a position."
        
        **["How do you mean?"]
            Bronislav: "How do you mean?"
            
            ->BHS3_HowDoYouMeanISee
    *["I don't know..."]
        Bronislav: "I don't know... I really could use the help she's offering, since I am definitely in need of a sponsor for my visa, and she is offering something that could really help me."
    
        Hendricks: "This doesn't seem right to me. I don't think its ethical to trade favors like this in an academic context."
        **["Why not?"]->BHS3_WhyNot
== BHS3_WhyNot ==
Bronislav: "Why not?"

Hendricks: "It brings bias into your work that undermines its integrity. What Ivy is offering sounds like "quid pro quo", which is essentially trading one favor for another. Its a slippery slope of conflicting interests.

*["I see."]
Bronislav: I see...

->BHS3_HowDoYouMeanISee

== BHS3_HowDoYouMeanISee ==
Hendricks: "For instance, would you have ever considered putting Jensen on your paper if not for this offer?"

{not ignoredHendricks: Hendricks: "Last time we spoke, you were frustrated with his feedback."}

*["Of course I wouldn't have considered it."]
    Bronislav: "Of course I wouldn't have considered it."
*["He's not so bad..."]
    Bronislav: "He's not so bad..."

-She sighs.

Hendricks: "This really is a problematic situation. I am going to let you decide how you want to handle it, but please let me know if I can help."

Bronislav: "Thank you Hendricks, I always appreciate your insight."

~ temp hendricksOpinionSocial3 = GetOpinionState("Hendricks", "Bronislav")
{hendricksOpinionSocial3 >= OpinionState.Good: -> BradGossip} 
{hendricksOpinionSocial3 < OpinionState.Good: -> goodbyeHendricks} 

=BradGossip

Hendricks: "It's odd... this isn't the only strange thing I've seen happen around a paper lately. Something must be in the air..."

*["What do you mean?"]
    Bronislav: "What do you mean?"

-Hendricks: "To speak candidly, something is not quite... adding up with Brad and his research. At least, according to what I've heard from Ned. Neither of us can quite put our finger on the problem, though."

{DbInsert("HendricksKnowsBrad")}

She seems to consider asking your opinion, but holds her tongue.

*["Brad is a good guy."]
    Bronislav: "Brad is a good guy."

    She nods in appreciation. 
    
    Hendricks: "I'm sure he is. Hopefully Ned is overthinking things."
    
    Maybe you should check in on your friend to get some clarification. 
    **["Should I let you get back to your book?"]
*["Should I let you get back to your book?"]

-Bronislav: "Should I let you get back to your book?"

She laughs gently. 

Hendricks: "Sure. Thank you for sharing about your situation with Ivy, I hope you can navigate it without too much stress. Make sure you are honoring your principles."

Bronislav: "Of course. Thank you for the advice. I hope the situation with Brad works out well."

 Maybe you should check in on your friend to get some clarification. 

->BHS3_HideHenAndEnd

=goodbyeHendricks
Bronislav: "Should I let you get back to your book?"

She laughs gently. 

Hendricks: "Sure. Thank you for sharing about your situation with Ivy, I hope you can navigate it without too much stress. Make sure you are honoring your principles."

Bronislav: "Of course. Thank you for the advice. I hope the situation with Brad works out well."

 Maybe you should check in on your friend to get some clarification. 

->BHS3_HideHenAndEnd

== BHS3_ImFine ==
Bronislav: "I'm fine, how are things with you?"

Hendricks: "Ned and I have been collaborating on supervising Brad and his research. It's been...  uneventful."

She seems to be telling half the truth, put off by your curtness.

*["I hope things continue going well."]
    Bronislav: "I hope things continue going well."

    Her face softens slightly.
    
    Hendricks: "Me too. Thank you Bronislav. There's really nothing bothering you?"
    
  
    **["Ivy offered to get me a job... if I add Jensen to my paper." # >> ChangeOpinion Hendricks Bronislav ++]->BHS3_IvyOfferedMeJob
    **["No, I just wanted to say hello." # >> ChangeOpinion Hendricks Bronislav --]
    Bronislav: "No, I just wanted to say hello."
        Hendricks: "Well, it was good to see you! Please feel free to reach out if you are having any issues. I'm here to support you."
        Bronislav: "Of course." 

   She smiles and waves as you take your leave.
    
    ->BHS3_HideHenAndEnd
    
*["Sorry for interrupting you."]
    Hendricks: "It's no problem. It was good to see you! Have a good day."
    
    ->BHS3_HideHenAndEnd
== BHS3_HideHenAndEnd ==
{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS3")}
->DONE
