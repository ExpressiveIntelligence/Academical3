=== Seen_BNLM_SceneStart ===
# ---
# choiceLabel: Get advice from Ned 
# @query
# date.day!6
# @end
# hidden: true
# repeatable: false
# tags: action, neds_office, required
# ===

~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

{ShowCharacter("Ned", "left", "")}



You decide to check Ned's office, maybe getting a second opinion on your situation would be a good idea. 

Ned: "Come in."

Creaking open the door you step into the office as Ned motions for you to have a seat.

Ned: "Hello Bronislav, have a seat. How are you today?" 

*["I'm doing okay."]
    You give a small sigh. 

    Bronislav: "I'm doing okay."

    Ned: "Why is that?"
    
*[Shrug your shoulders]
    You shrug your shoulders hanging your head slightly.

    Ned: "I see, is something the matter?"

*["Could be better"]
    Bronislav: "It could be better. I'm going through a lot right now."

    Ned: "I know it hasn't been long since we last talked, but...I'll be honest I have heard that you've been in a hard situation lately. Do you want to talk about it?"
    
-->BNLM_SECONDPOOLOFQUESTIONS
    
== BNLM_SECONDPOOLOFQUESTIONS ==
*["I feel as if I ruined my relationship with Ivy."]->BNLM_RuinedRelationship
*["I can't tell if I did the right thing."]->BNLM_CantTellIfIDidRightThing
*["I'm lacking a job opportunity now."]->BNLM_LackingJobOpportunity

*->
    **["Thank you"]
        Bronislav: "Thank you for your help Professor Ned"
        
        Ned: "Of course Bronislav anytime." 
        
        Ned: "I think it's important for us to know the consequences of bribery or unethical quid pro quo practices."
        
        Bronislav: "Yeah, I have come to realize what the consequences of my actions, or what they would have been." 
        
        Ned: "I'm glad you thought things through." 
        ***["Me too."]
                Bronislav: "Me too."
            
            Ned: "I did have something else I wanted to discuss with you, I think it's important to know."
            
            Bronislav: "Sure what is it?"
            
            Ned: "I spoke with Jensen, he has been removed from lab meetings."
            
            Bronislav: "I see."
        ***["I do have some regrets."]
            Bronislav: "I do have some regrets, I just wish things could've gone better with Ivy and Jensen."
            
            Ned: "I understand..."
            
            {IvyDeniedOfficial: Ned: "...but I'm proud of you for making the right choice, so thank you."}
            
            {IvyAcceptedOfficial: Ned: "...but know that people understand why you made that choice." }
            
            You give a small nod.
            
            Ned: "I did have something else I wanted to discuss with you, I think it's important to know."
            
            Bronislav: "Sure what is it?"
            
            Ned: "I spoke with Jensen, he has been removed from lab meetings."
        
            Bronislav: "I see."
        ***["I hope everything else works out okay."]
            Bronislav: "I just hope everything else works out okay."
        
            Ned: "I'm sure it will, speaking of I did have something else I wanted to discuss with you, I think it's important to know."
            
            Bronislav: "Sure what is it?"
            
            Ned: "I spoke with Jensen, he has been removed from lab meetings."
            
            Bronislav: "I see."
    
-
*["Is that a little too harsh?"]
    Bronislav: "Is that a little too harsh of a punishment?"
    
    Ned: "Think of it this way, since Jensen tried to get on a paper without participating in any of the work why should he be in lab meetings to discuss research he didn't do."
*["I think that's reasonable."]
    Bronislav: "I think that's reasonable."

    Ned nods his head
    
    Ned: "That is all I had to discuss, do you have anything else you wanted to discuss with me?"
    
    Bronislav: "Thank you for all your help Professor Ned, I think I'm all set."
    
    Ned: "Alright then, thank you for coming today, I'm sure your paper will do wonderfully."
    
    Bronislav: "Thank you."
    
    You stand from your seat giving a small wave before you exit out the door."

-->BNLM_HideNedAndEnd



        
== BNLM_RuinedRelationship ==
Bronislav: "I feel as if I ruined my relationship with Ivy after everything."

Ned: "I understand that. But I want you to understand we are all adults here, and boundaries are important especially when they involve your work and future. Relationships involve these boundaries and the respect of them."
*["Yeah, you're right."]
    Bronislav: "Yeah, you're right..." 
    
    You let out a small sigh.
    
    Ned: "Everything will work out in the long run. Give Ivy some time to think things through, if she respects your boundaries she'll come around."
    
    Bronislav: "Alright, thank you, Professor Ned, I really appreciate it."
    ->BNLM_SECONDPOOLOFQUESTIONS
*["I just hope she comes around."]
Bronislav: "I just hope she's able to come around."

Ned: "Give her some time, if she respects you and your boundaries I'm sure she will come around." 

Bronislav: "Yeah I hope so..."

Ned gives you a soft smile. 

Ned: "It'll all work out." 
->BNLM_SECONDPOOLOFQUESTIONS


== BNLM_CantTellIfIDidRightThing ==
Bronislav: "I'm not sure if I ended up making the right choice." 

{IvyDeniedOfficial: Ned: "Take a look at it this way, because of your decision you can submit your project without fault. Also, you have successfully dodged a bad mark on your track record."}

{IvyAcceptedOfficial: Ned: "Take a look at it this way, you are in a hard stance because someone took advantage of your visa situation to get what they wanted. But, you can recover from this, it will just take time."}

Bronislav: "I guess you're right. It wouldn't help me get a job. Besides, this would've hindered my application."  

Ned: "Indeed." 
->BNLM_SECONDPOOLOFQUESTIONS

== BNLM_LackingJobOpportunity ==
Bronislav: "Now because of the lack of Ivy's recommendation I won't be able to work with her Uncle. I'm starting to worry if I'll be able to get a job..."

Ned: "The process of getting a job is hard and not a simple and easy process. You're still in the process of getting your PHD, be patient and continue what you're doing."

Bronislav: "Yeah in a way you're right, I was just hopeful at the opportunity."

{IvyDeniedOfficial: Ned: "Anyone could have been tempted by that opportunity, but the fact that you turned it down shows your confidence in yourself, just keep at it."}

{IvyAcceptedOfficial: Ned: "Anyone could have been tempted by that opportunity, expecially someone in your shoes. Don't beat yourself up over this mistake, just keep at it."}

Bronislav: "Understood." ->BNLM_SECONDPOOLOFQUESTIONS

== BNLM_HideNedAndEnd ==
{HideCharacter("Ned")}
{DbInsert("Seen_BNLM")}
->DONE