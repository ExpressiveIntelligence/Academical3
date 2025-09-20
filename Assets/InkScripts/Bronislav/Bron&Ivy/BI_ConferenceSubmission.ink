@ -1,301 +0,0 @@
VAR IvyDealAccepted = false 
VAR IvyDealConsidered = false
VAR IvyDealDenied = false
=== BI_CONFERENCE_SceneStart ===
# ---
# choiceLabel: Talk with Ivy about the deal
# hidden: true
# @query
# Seen_BI_IRB
# date.day!3
# @end
# repeatable: false
# tags: action, student_cubes, required
# ===
# Summary: Ivy officially gives the deal to Bronislav 

{ShowCharacter("Ivy", "left", "")}

{DbInsert("Seen_BI_CONF")}

-> BI_Conference_Intro

=BI_Conference_Intro
~IvyDealAccepted = DbAssert("IvyDealAccepted")

~IvyDealConsidered = DbAssert("IvyDealConsidered")

~IvyDealDenied = DbAssert ("IvyDealDenied") 

~ temp ivyOpinionCSD = GetOpinionState("Ivy", "Bronislav")
{ivyOpinionCSD >= OpinionState.Neutral: -> IvyCSDGoodBegining} 
{ivyOpinionCSD < OpinionState.Neutral: -> IvyCSDBadBeginning} 

=IvyCSDGoodBegining
    {IvyDealAccepted: Ivy: "Hey Bronislav, last time we talked you were really helpful with Jensen. I want to make sure you follow through on that, so I've got an offer for you."}
        
    {IvyDealConsidered: Ivy: "Hey Bronislav, last time we talked you seemed on the fence with Jensen's authorship, so I've got an offer for you."}

    {IvyDealConsidered: Ivy: "If you put Jensen on the paper, I'll recommend you to the firm and see about getting my uncle to meet you."}
        
    {IvyDealAccepted: Ivy: "If you put Jensen as first author on the paper, I'll recommend you to the firm and see about getting my uncle to meet you."}
        
    {IvyDealDenied: Ivy: "Hey Bronislav, I know you weren't too keen on putting Jensen on the paper, but I've got an offer for you. If you put Jensen as first author on the paper, I'll recommend you to the firm and see about getting my uncle to meet you."}
    -> BI_InternalReflectionChoices

  =IvyCSDBadBeginning

    Ivy: "Hey, Bronislav. I know you were not having it last time when we discussed about Jensen."

    She looks dejected.

    Ivy: "So, this time around, I've got a deal for you. You put Jensen on the paper, and I'll see about getting you that job. Any thoughts?"

    -> BI_InternalReflectionChoices

= BI_InternalReflectionChoices

*[This could really help me...] -> BI_InternalReflection.internalReflection1
*[What has Jensen done for authorship...?] -> BI_InternalReflection. internalReflection2

==BI_InternalReflection==

=internalReflection1
If you take this offer, it could basically guarentee your job and help with your visa issues. 
->ChoiceOptionsForDeal

=internalReflection2
All he gave was that one piece of feedback, is that enough to be put as first author?
->ChoiceOptionsForDeal
        
==ChoiceOptionsForDeal==

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> DealGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> DealNeutral} 
{ivyOpinion < OpinionState.Neutral: -> DealBad} 



=DealGood
    *{IvyDealAccepted} ["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ----] -> ChangedMyMindReject
    
     *{IvyDealAccepted}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++] ->YouSure
    
    *{IvyDealConsidered}["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ----] -> ChangedMyMindReject 
    
    *{IvyDealConsidered}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++] ->YouSure
    
    *{IvyDealDenied} ["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ++++] -> ChangedMyMindAccept
    
    *{IvyDealDenied}["That's really helpful."  #>> ChangeOpinion Ivy Bronislav ++++]
        ->ThatsReallyHelpful

    *{IvyDealDenied}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++]
        ->YouSure

    *[I'm not sure about this #>> ChangeOpinion Ivy Bronislav -]
        ->ImNotSure
  

=DealNeutral
    *{IvyDealAccepted} ["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ----] -> ChangedMyMindReject 
     
     *{IvyDealAccepted}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++] ->YouSure
    
    *{IvyDealConsidered}["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ----] -> ChangedMyMindReject 
    
    *{IvyDealConsidered}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++] ->YouSure
    
    *{IvyDealDenied} ["I changed my mind."  #>> ChangeOpinion Ivy Bronislav ++++] -> ChangedMyMindAccept
    
    *{IvyDealDenied}["That's really helpful...maybe"  #>> ChangeOpinion Ivy Bronislav ++++] ->ThatsReallyHelpful

    *{IvyDealConsidered}["Thanks, but are you sure?" #>> ChangeOpinion Ivy Bronislav ++] ->YouSure

    *{IvyDealDenied}[I'm not sure about this] ->ImNotSure
        
=DealBad

    *["Maybe I will...also I'm sorry." #>> ChangeOpinion Ivy Bronislav ++] ->SorryAbtThat

    *["That won't help."]->ThatWontHelp

    *["No way." #>> ChangeOpinion Ivy Bronislav --] ->NoWay
 
 ===ChangedMyMindReject===
 {DbInsert("BI_SwitchingOpinions")}
Bronislav: "I'm actually not comfortable with this. I don't feel as though Jensen's feedback is enough, and with a generous offer from you on the table like this, I think it would be too risky for the both of us."

Ivy: "Aw, c'mon Bronislav, you seemed interested. Plus, you know how hard it is to get into grad school."

Ivy sighs.

Ivy: "Jensen needs all the help he can get, wouldn't you have liked help like this back then?"

*["You're right." #>> ChangeOpinion Ivy Bronislav ++]
->YouAreRight

*["It's hard, but..." #>> ChangeOpinion Ivy Bronislav -]
->ItsHardBut

*["This is Jensen, not me." #>> ChangeOpinion Ivy Bronislav --]
->JensenNotMe

=YouAreRight
Bronislav: "You're right, I would have liked this help back then. I'll think about it some more, Ivy. You had a rough time getting into grad school back when you were a student too, right? That's why you're sympathizing with Jensen?"

Ivy starts to smile, relieved by this turn of events.

Ivy: "Yeah, back then it was a struggle getting onto papers, and I feel like Jensen needs the help. Thank you for thinking it over, Bronislav, I've got to go."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_CONF")}

->BHS3_Hint -> DONE



=ItsHardBut
Bronislav: "It is hard, but I feel like Jensen really just isn't going to hold up to review. His feedback was basic, we'd get caught..."

Ivy interrupts you, clearly you hit a nerve.

Ivy: "Look, if you pull this off, I'll give you that recommendation. You and I know both of you need this. Don't disappoint him." 

She walks off with a huff.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_CONF")}

->BHS3_Hint-> DONE

=JensenNotMe
Bronislav: "This is Jensen, not me, Ivy. I worked so hard to get in and he's nowhere near my level that I was when I was his age. The feedback I got from him was the most basic possible, I don't feel like it would hold up."

 Ivy frowns, looking peeved.

 Ivy: "Yeah, but what if it does? Jensen would have his credit, and you would have not only a recommendation, but a sponsor for your visa which by our conversations, I can tell you desperately need."

Ivy sighs, shaking her head.

 Ivy: "Look, just think it over, okay? He's in the same place you were years ago, and while he may not be 'on your level', but he's trying his hardest."

Ivy turns away, heading out.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_CONF")}

->BHS3_Hint-> DONE

===ChangedMyMindAccept===
 {DbInsert("BI_SwitchingOpinions")}
Bronislav: "I actually wanted to change my mind. I'm heavily considering taking this deal, cause it would be a great opportunity for both of us!"

Ivy: "Glad to hear that! I'll keep you updated, talk to you soon!" 

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_CONF")}

->BHS3_Hint-> DONE

=== ThatsReallyHelpful ===
    Bronislav: "That's really helpful, Ivy, I'll need to see how the paper turns out first but if I keep it together, I'm leaning towards putting Jensen on the paper."

    Ivy smiles, pleased by this.

    Ivy: "Thank you Bronislav, Jensen really needs the help getting into grad school, it's nice to see you being so supportive."

    Ivy: "I'll keep in touch, hope to see you again soon!"

    Ivy walks off with a pleased pep in her step.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    ->BHS3_Hint-> DONE

=== YouSure ===
    Bronislav: "Thank you, Ivy, but are you sure? That's really generous of you but you're kind of sticking your neck out for me on this one."

    Ivy cracks a smile at that.

    Ivy: "I wouldn't be too worried, you're doing great. If you hold up your end of the bargain, it'll be worth it."

    Ivy: "I'll keep in touch, hope to see you again soon!"

    Ivy walks off with a pleased pep in her step.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    ->BHS3_Hint-> DONE

    === ImNotSure ===

    Bronislav: "I'm not sure about this, Ivy. Now that there's an explicit deal on the table, it feels..."

    You try to come up with the words, your altruistic intentions to help Jensen feeling conflicted with your need for a job.

    Ivy: "Hey, no big deal. But I would like to remind you that you are running on tight deadline to get those visa issues of yours solved, and I just offered you a lifeline."

    Ivy drops her tone.

    Ivy: "Just think it over while you're working here, Bronislav."

    Ivy waves goodbye, taking her leave briskly.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    ->BHS3_Hint-> DONE
        

    === SorryAbtThat ===
    Bronislav: "I'm sorry about what I said regarding Jensen. I'm sure he's a fine guy, he just rubbed me wrong when we first met. I think I'll be putting him on the paper."

    Ivy looks slightly relieved.

    Ivy: "That actually means a lot, Bronislav. Jensen really needs it, as you've clearly noticed."

    With the slight bit of sass, she continues.

    Ivy: "For now, maybe try being a bit nicer to poor Jensen from now on."

    Ivy walks away, not even waving goodbye.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    ->BHS3_Hint-> DONE

    === ThatWontHelp ===
    Bronislav: "Look, it won't really help with the feedback he gave."

    You smile a little.

    Bronislav: "As enticing as a job recommendation is, Jensen's feedback is iffy."

    Ivy frowns.

    Ivy: "Bronislav, you know how much help he needs. Please. Think about it."

    Ivy: "I know it might be hard, but you're struggling with getting a job. And we both know what could happen if you don't find anything. Think it over."

    Ivy waves goodbye and leaves without another word.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    -> BHS3_Hint-> DONE

    === NoWay ===
    Bronislav: "No way. Jensen would need to step it up a notch if he wants my help. We would get caught instantly."

    Ivy: "C'mon Bronislav, this is a big opportunity for you, to secure something you really need, if you just add him to the paper. Think about what you're missing out on by saying no."

    Ivy frowns and turns away.

    Ivy: "Think it over, okay?"

    Ivy leaves wordlessly.

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_CONF")}

    ->BHS3_Hint-> DONE

 



