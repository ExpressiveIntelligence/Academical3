=== BI_IRB_SceneStart ===
#---
# choiceLabel: Chat with Ivy.
# @query
# date.day!2
# @end
# repeatable: false
# tags: action, student_cubes, required
#===
# Summary: Ivy introduces the idea of her and her uncle's research firm, Bronislav's visa issues is mentioned, Ivy asks if Jensen can be on the paper



{ShowCharacter("Ivy", "left", "")}

Ivy:"Hey Bronislav, how are you doing?"

*["Pretty well."  #>> ChangeOpinion Ivy Bronislav +]
    ->PrettyWell

*["Alright."]
    ->Alright

*["Terrible." #>> ChangeOpinion Ivy Bronislav -]
    ->BI_IRB_Terrible

=== PrettyWell ===

Bronislav: "I'm doing pretty well. I feel like I should be more nervous but I'm actually feeling pretty confident about it at this point."

Ivy: "That's great to hear! I know the anticipation can definitely be overwhelming sometimes. Actually, that reminds me..."

*["What's up?"]
    ->WhatsUp

=== Alright ===

Bronislav: "I'm alright, I've just been a bit preoccupied while waiting on the IRB."

Ivy: "That's fair, I can understand why that would be daunting. Actually, that reminds me..."

*["What's up?"]
    ->WhatsUp

=== BI_IRB_Terrible ===

Bronislav: "I'm actually kind of a wreck right now. I know I shouldn't be, but I'm pretty nervous about getting IRB approval."

Ivy: "Oh man Bronislav, I'm sorry! If I know anything about you, I'm sure you did everything that was required, so don't stress too much. Actually, that reminds me, I have something that might cheer you up."

*["What's up?"]
    ->WhatsUp

=== WhatsUp ===

Ivy: "You remember the firm I work at with my uncle, right?"

-> TrapDoorResearchFirm

===TrapDoorResearchFirm===

*[Is she finally going to offer me a job?] -> offerAJobThought
*[This could help with my visa issues.] -> VisaIssues
*["Yeah!"] -> WaitReally

= offerAJobThought
I've been wanting a job at her uncle's firm for months, is she finally going to offer me a job? I'd do anything to work there. -> TrapDoorResearchFirm

= VisaIssues
Graduation is around the corner and I could really use this job. I've been talking to her about my issues for a while so I hope she remembers. If I don't land anything soon, I may not be able to stay. -> TrapDoorResearchFirm

=== WaitReally ===

Ivy: "It sounds like they just opened up a position. From what I've heard, they've been looking for a graduate student with your skill set."

Bronislav: "That sounds amazing Ivy! Is there anything I need to do to contact him?"

Ivy: "Yeah, I totally can send you the job listing."

*["That would be great!"]
    ->ThatWouldBeGreat

=== ThatWouldBeGreat ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{ivyOpinion >= OpinionState.Good: -> ThatWouldBeGreatGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> ThatWouldBeGreatNeutral} 
{ivyOpinion < OpinionState.Neutral: -> ThatWouldBeGreatBad} 

=ThatWouldBeGreatGood
Bronislav: "That would be great Ivy! I really appreciate it!" 

Ivy: "Of course, I am happy to help a student out!" 

->ThatWouldBeGreatChoices 

=ThatWouldBeGreatNeutral

Bronislav: "That would be great Ivy! I really appreciate it!"

Ivy: "Don't mention it. I figured it might be something to look into while you wait to hear about your paper."

Bronislav: "Yeah, definitely!" 
->ThatWouldBeGreatChoices 

=ThatWouldBeGreatBad
 Bronislav: "That would be great Ivy! I really appreciate it!"

Ivy:  "Yeah, sure. I figured you'd want to know about the job all the same."

Bronislav: "Yes, definitely, I appreciate it." 
->ThatWouldBeGreatChoices 

=ThatWouldBeGreatChoices 
You wonder if you should ask her if there's a way to get an edge on the application.

*[Ask]
    ->Ask

*[Don't Ask]
    ->DontAsk

=== Ask ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{ivyOpinion >= OpinionState.Good: -> AskGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> AskNeutral}
{ivyOpinion < OpinionState.Neutral: -> AskBad} 

=AskGood

    Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"

    Ivy: "Maybe...I suppose it would be possible for me to talk to my uncle about you a bit."

 *["Really? You would do that?"]->ReallyYouWould

=AskNeutral

Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"

Ivy: "Possibly..."

Ivy: "I could ask my Uncle about it more, and let you know what he says."

*["I would appreciate that."] ->IWouldAppreciate

=AskBad
Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"
Ivy: "What do you mean?" 

*["You could talk to your Uncle for me?" #>> ChangeOpinion Ivy Bronislav --]
->YouCouldTalkToHim

*["Do you know anything else about the position?" #>> ChangeOpinion Ivy Bronislav ++]
        ->DoYouKnowAnythingElse


=== ReallyYouWould ===

Bronislav: "Really? You would do that?"

Ivy: "I can definitely mention you if it comes up in conversation."

Bronislav: "Thank you so much Ivy! I really appreciate it."

Ivy: "Yeah, no problem." 

->ShiftToJensen

=== IWouldAppreciate ===

Bronislav: "I would appreciate that."

Ivy: "I didn't ask him for too many details, he just said to pass off the info to anyone who I knew that might be interested. I can maybe ask him next time for more details if I talk to him about it again."

Bronislav: "I would definitely appreciate that if you could."

Ivy: "I'll try to remember to ask for you." 

->ShiftToJensen

=== YouCouldTalkToHim ===

Bronislav: "You could talk to your Uncle for me."

Ivy: "I mean...I guess I could."

Bronislav: "Is something wrong?" 

Ivy: "Oh, don't play dumb Bronislav, I know you don't look too highly upon me other than my work."

Bronislav: "Oh..." 

Ivy sighs.

Ivy: "Look, I figured it would be of interest to you, but I am not super interested in leveraging my relationship with my uncle on your behalf."

Bronislav: "I suppose I can understand that. I appreciate you mentioning the job least."

Ivy: "Yeah, sure." 

->ShiftToJensen

=== DoYouKnowAnythingElse ===

Bronislav: "Do you know anything else about the position?"

Ivy: "I didn't ask him for too many details, he just said to pass off the info to anyone who I knew that might be interested. I can maybe ask him next time for more details if I talk to him about it again."

Bronislav: "I would definitely appreciate that if you could."

Ivy: "I'll try to remember to ask for you." 
->ShiftToJensen

=== DontAsk ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> DontAskGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> DontAskNeutral}
{ivyOpinion < OpinionState.Neutral: -> DontAskBad} 

=DontAskGood

    You decide not to push your luck, especially since you would hate for her to feel like you are overstepping when she is already being so generous.

    Ivy smiles, as though a lightbulb went off in her head.

    Ivy: "Actually, I might be able to mention you to my uncle to help you get the position."

    Bronislav: "You'd do that?"

    Ivy: "Yeah, of course, as long as I actually remember to."

    Bronislav: "Thank you so much Ivy! I really appreciate it."

    Ivy: "Mhm." 
->ShiftToJensen

=DontAskNeutral

You decide not to push you luck, especially since you don't want to come off as ungrateful.

Bronislav: "Now I have something to look into while I wait for this."
    
Ivy: "Actually, I could probably mention you to my uncle to help with your application."

Bronislav: "Wait, really?"

Ivy: "Yeah I could definitely do that. Well, as long as I remember to." 

Bronislav: "I mean...anything you feel comfortable doing I would definitely be grateful for." 

    Ivy: "Okay..." 

->ShiftToJensen

=DontAskBad

You decide not to push your luck, especially since you and Ivy are not the closest.

Bronislav: "I definitely now have something to look into while I wait for IRB approval." 

Ivy nods.

Bronislav: "But...anything that would help me get the position would be super helpful." 

    Ivy: "Ok..." 

    ->ShiftToJensen


=== ShiftToJensen ===

She starts to absent mindedly twist her hair, as she appears to be lost in thought. Her face shifts to a look of concern. It definitely looks like something else is bothering her.

*["Are you alright?"]
    ->AreYouAlright

=== AreYouAlright ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> AlrightGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> AlrightNeutral}
{ivyOpinion < OpinionState.Neutral: -> AlrightBad} 

=AlrightGood

    Ivy: "Sorry, yeah."

    Ivy shakes her head momentarily.

    Ivy: "I'm okay, I am worried about Jensen though."

    *["What's going on with him?"]
        ->WhatsUpWithHim

=AlrightNeutral

    Ivy: "Huh?" 

    Ivy: "Yeah, I guess I am a bit worried about Jensen."

    *["What's going on with him?"]
        ->WhatsUpWithHim

=AlrightBad

    Ivy stops and looks towards you, a bit surprised by your question.

    Ivy: "Yeah, I'm fine. I guess I am just a bit worried about Jensen."

    *["What's going on with him?"]
        ->WhatsUpWithHim


=== WhatsUpWithHim ===

Bronislav: "What's going on with him?"

Ivy: "He's been really stressed. He's such a hard worker, but he's always worried about not doing enough. It's certainly not helping his anxiousness about getting into the program."

*["I know the feeling." #>> ChangeOpinion Ivy Bronislav ++++]
    ->IKnowTheFeeling

*["I hope he can figure that out."]
    ->HopeHeFiguresItOut

*["That's rough." #>> ChangeOpinion Ivy Bronislav --]
    ->ThatsRough

*["Everyone experiences that." #>> ChangeOpinion Ivy Bronislav ++++]
    ->EveryoneExperiencesThat

=== IKnowTheFeeling ===

Bronislav: "I know the feeling." 

Ivy: "Yeah, I guess you do, huh."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav ++++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav ++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ----]
    ->HeShouldBeWorried

=== HopeHeFiguresItOut ===

Bronislav: "Yeah, that's a tough spot to be in. I hope he can figure it all out."

Ivy: "Me too, he definitely belongs here."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav ++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav +++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ----]
    ->HeShouldBeWorried

=== ThatsRough ===

Bronislav: "That's really rough." 

Ivy turns away at the nonchalant tone in your voice. 

Ivy: "Well of course it is. I'm just surprised you don't have more sympathy for the situation considering you also had a similar struggle."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav +++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav ++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ---]
    ->HeShouldBeWorried

=== EveryoneExperiencesThat ===

Bronislav: "I think just about everyone in grad school has experienced those feelings." 

Ivy: "Yeah, no kidding. It's always a grind."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav +++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav ++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ---]
    ->HeShouldBeWorried

=== AnyWayICanHelp ===

Bronislav: "Is there a way I can help him at all? I know I went through my own challenges getting into grad school, and I'd be willing to pass along some of my own knowledge."

Ivy: "Well, I know Jensen is looking to get on a research paper to help his chances. He thinks that having authorship on something, would really help make an impression."

*[Should you offer him authorship?] -> authorshipExpositionLoop 

*["Maybe I could put him on my paper?" #>> ChangeOpinion Ivy Bronislav +++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>> ChangeOpinion Ivy Bronislav --]
    ->HesInTrouble

=== JensensGotIt ===

Bronislav: "Jensen will figure it out, Ivy. If he's smart enough to get this far, he can figure out how to get in."

Ivy: "Maybe you're right." 

Ivy: "He just keeps talking about needing to get on a research paper to help his chances, and the last time we talked he seemed pretty desperate."

*[Should you offer him authorship?] -> authorshipExpositionLoop 

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== IWouldntWorry ===

Bronislav: "While it's nice of you to be concerned, I wouldn't worry about Jensen. If he's as hard of a worker as you say, and he's got the will to get in, he can make it. Just like I did."

Ivy: "Maybe you're right," 

Ivy: "The last time he talked he seemed pretty hellbent on getting on a research paper. I'm just not sure how he's going to do it going forward."

*[Should you offer him authorship?] -> authorshipExpositionLoop 

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== HeShouldBeWorried ===

Bronislav: "Jensen should be worried. If he isn't on top of his game, he simply won't get in."

Ivy shoots you a look of annoyance.

Ivy: "Yeah I think he's painfully aware of that, which is why he has been so stressed. He keeps bringing up that he needs to get on a research paper to solidify his chances, and I'm not sure how he's going to do it."

*[Should you offer him authorship?] -> authorshipExpositionLoop 

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble
    
==authorshipExpositionLoop==
The only thing Jensen did to participant on this paper was give that piece of feedback the other day. Is that enough to consider authorship? 

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== PutHimOn ===
{DbInsert("IvyDealConsidered")}

Bronislav: "Maybe I could put him on my paper?"

Ivy perks up.

Ivy: "You'd consider doing something like that?"

You can't remember any other work he contributed, but he did feedback he gave at your presentation. Maybe that's enough to consider him an author?

Bronislav: "Hey, I was in his shoes at one point, I do know how hard it is to get in."

->ContinueYES

=== ThatsAToughie ===

Bronislav: "That's a tough one. I'm not sure that there are a lot of research opportunities available right now."

Ivy: "Yeah, that's exactly what I told him. But he's very determined, and I would hate to seem him crushed by this,"

Ivy looks as though she is considering something, and resolves to ask you.

->GiveQuidProQuo

=== IsntMakeOrBreak ===

Bronislav: "A research paper isn't make or break. There's lot of other ways to stand out to get into the psych program, he just needs to look into them."

Ivy: "Yeah, maybe you're right. Still, he's certain it's the only path for him, no matter what I say to dissuade him."

Ivy looks as though she is considering asking you something, and resolves to ask.

->GiveQuidProQuo

=== HesInTrouble ===

Bronislav: "He's in trouble if that's what he's gunning for." 

Ivy: "Well, maybe, but I still want to try and help him, since that's what he wants to do."

Ivy looks as though she is considering asking you something, and decides to ask.

->GiveQuidProQuo

=== GiveQuidProQuo ===

Ivy: "Do you think you'd be willing to put Jensen on your paper? If you do, I promise to give you a recommendation to my uncle."

{DbInsert("givenQuidProQuo")}

*["Probably." #>> ChangeOpinion Ivy Bronislav ++]
    ->Probably

*["I'm not sure." #>> ChangeOpinion Ivy Bronislav -]
    ->NotSure

*["No." #>> ChangeOpinion Ivy Bronislav --]
    ->No

=== Probably ===

{DbInsert("IvyDealConsidered")}

Bronislav: "Hmm, maybe I could do something like that. It would certainly be helpful to him."

Ivy perks up.

Ivy: "Really? You'd be willing to do something like that?"

Bronislav: "Probably, yeah." 

->ContinueYES

=== NotSure ===

Bronislav: "I'm not sure that I could. I don't think I can just add him without causing some problems for the paper."

Ivy: "Oh, alright. Well, if you could, I would ask that you at least consider it, just because I know it would help Jensen a lot. And it would certainly make me feel a lot less worried."

Bronislav: "Sure, I can keep it mind."

->ContinueMAYBE

=== No ===

Bronislav: "No, I definitely can't. It would be very unethical for me to do something like that."

Ivy: "Well, I guess it was worth an ask." 

Ivy: "You're one of the main people I know who has an active research paper, so it would be a big help if you could get him on it."

Bronislav: "I understand where you're coming from, but I don't think I will be an option."

->ContinueNO

=== ContinueYES ===

{DbInsert("IvyDealAccepted")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> AcceptedGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> AcceptedNeutral} 
{ivyOpinion < OpinionState.Neutral: -> AcceptedBad} 

=AcceptedGood

        Ivy: "I'm really glad that you're willing to help Jensen." 

        Ivy: "I know this will definitely settle his nerves."

        Bronislav: "I'm happy to help."

        Ivy: "Thanks Bronislav, you really are a true friend."

        ->ContinueOutro

=AcceptedNeutral

        Ivy: "That's really nice of you to be willing to help Jensen. It certainly will not go unappreciated."

        Bronislav: "Don't mention it."

        Ivy: "I'll be sure to tell him that you're willing to help."

        ->ContinueOutro

=AcceptedBad

        Ivy: "I'm a little surprised you're so willing to help Jensen, but I'm very happy that you are."

        Bronislav: "I'm always willing to help someone who's going through some of the same struggles that I went through."

        Ivy: "Thank you, Bronislav, I know this is going to mean a lot to Jensen."

        ->ContinueOutro


=== ContinueMAYBE ===

{DbInsert("IvyDealConsidered")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")
{ivyOpinion >= OpinionState.Good: -> MaybeGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> MaybeNeutral} 
{ivyOpinion < OpinionState.Neutral: -> MaybeBad} 

=MaybeGood

        Ivy: "I appreciate it, Bronislav. I hope you'll come to see that this a great way to help out your friends."

        ->ContinueOutro

=MaybeNeutral

        Ivy: "I hope that you consider adding him, you and I both know it would really help a lot."

        ->ContinueOutro

=MaybeBad

        Ivy: "I know you have mixed feelings, but at least consider adding him. I know it would mean a lot to Jensen."

        ->ContinueOutro


=== ContinueNO ===

{DbInsert("IvyDealDenied")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{ivyOpinion >= OpinionState.Good: -> NoGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> NoNeutral} 
{ivyOpinion < OpinionState.Neutral: -> NoBad} 

=NoGood

        Ivy: "While I respect where you are coming from Bronislav, I really hope you reconsider."

        ->ContinueOutro

=NoNeutral

        Ivy: "I know you have concerns, but I hope you reconsider for Jensen's sake. It would do a lot to settle his nerves."

        ->ContinueOutro

=NoBad

        Ivy: "I know you're insistent on being stubborn, but I really hope you'll come around." 

        ->ContinueOutro


=== ContinueOutro ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{ivyOpinion >= OpinionState.Good: -> OutGood} 
{ivyOpinion >= OpinionState.Neutral && ivyOpinion < OpinionState.Good: -> OutNeutral}
{ivyOpinion < OpinionState.Neutral: -> OutBad} 

=OutGood

        Ivy looks down to her watch.

        Ivy: "Wow. I really got swept up in this conversation. I've gotta go for now Bronislav, but it was nice chatting."

        Bronislav: "Yeah, always a pleasure."
    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_IRB")}
    ->DONE 

=OutNeutral

    Ivy looks down to her watch.

    Ivy: "Wow. I really got swept up in the conversation. I've gotta go for now Bronislav, but we'll chat again soon."

    Bronislav: "Alright, bye Ivy."

    {HideCharacter("Ivy")}
    {DbInsert("Seen_BI_IRB")}
    ->DONE 

=OutBad

        Ivy looks down at her watch.

        Ivy: "Wow. I really got swept up in this conversation. I've gotta got Bronislav, but see you around, I guess?"

        Bronislav: "Yeah, I guess."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_IRB")}
-> DONE
