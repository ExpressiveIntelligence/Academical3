=== BI_IRB_SceneStart ===
#---
# choiceLabel: Talk with Ivy about the IRB review.
# @query
# date.day!2
# @end
# repeatable: false
# tags: action, student_cubes, required
#===

{DbInsert("Seen_BI_IRB")}

{ShowCharacter("Ivy", "left", "")}

Ivy:"Hey Bronislav, how are you doing?"

*["Pretty well."  #>> ChangeOpinion Ivy Bronislav +++]
    ->PrettyWell

*["Alright."]
    ->Alright

*["Terrible." #>> ChangeOpinion Ivy Bronislav --]
    ->BI_IRB_Terrible

=== PrettyWell ===

Bronislav: "I'm doing pretty well. I feel like I should be more nervous about the IRB review but I'm actually feeling pretty confident about it at this point."

Ivy: "That's great to hear! I know the anticipation can definitely be overwhelming sometimes. Actually, that reminds me..."

*[What's up?]
    ->WhatsUp

=== Alright ===

Bronislav: "I'm alright, I've just been a bit preoccupied while waiting on the results of the IRB review."

Ivy: "That's fair, I can understand why that would be daunting. Actually, that reminds me..."

*[What's up?]
    ->WhatsUp

=== BI_IRB_Terrible ===

Bronislav: "I'm actually kind of wreck right now. I know I shouldn't be, but I'm pretty nervous about the IRB review."

Ivy: "Oh man Bronislav, I'm sorry! If I know anything about you, I'm sure you did everything that was required, so don't stress too much. Actually, that reminds me, I have something that might cheer you up."

*[What's up?]
    ->WhatsUp

=== WhatsUp ===

Ivy: "My uncle works at a prestigious research firm, and they just opened up a position. From what I've heard from him, they've been looking for a graduate student with your skill set."

*["Wait, really?"]
    ->WaitReally

=== WaitReally ===
Bronislav: "That sounds amazing Ivy! Is there anything I need to do to contact him?"

Ivy: "Yeah, I totally can send you the job listing."

*["That would be great!"]
    ->ThatWouldBeGreat

=== ThatWouldBeGreat ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

    Bronislav: "That would be great Ivy! I really appreciate it!" # >> ChangeOpinion Ivy Bronislav ++

    Ivy: "Of course, I am happy to help a friend out!" She says with a big smile.

    - ivyOpinion == OpinionState.Neutral:

    Bronislav: "That would be great Ivy! I really appreciate it!"

    Ivy: "Don't mention it. I figured it might be something to look into while you wait to hear about your paper."

    Bronislav: "Yeah, definitely," You say with a nod.

    - else:

    Bronislav: "That would be great Ivy! I really appreciate it!"

    Ivy: "Yeah, sure. I know we aren't exactly close, but I figured you'd want to know about the job all the same."

    Bronislav: "Yes, definitely, I appreciate it." You say, with a smile.
}

You wonder if you should ask her if there's a way to get an edge on the application.

*[Ask]
    ->Ask

*[Don't Ask]
    ->DontAsk

=== Ask ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

    Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"

    Ivy: "Maybe," Ivy says as she thinks, "I suppose it would be possible for me to talk to my uncle about you a bit."

    ["Really? You would do that?"]
        ->ReallyYouWould

    - ivyOpinion == OpinionState.Neutral:

    Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"

    Ivy: "Possibly."

    Ivy says with a shrug.

    Ivy: "I could ask my Uncle about it more, and let you know what he says."

    *["I would appreciate that."]
        ->IWouldAppreciate

    - else:

    Bronislav: "Actually, do you know if there's a way to get a leg up on the application?"

    Ivy: "How do you mean?" Ivy asks, uncertain.

    *["You could talk to your Uncle for me." #>> DecrRelationshipStat Ivy Bronislav Opinion 20]
        ->YouCouldTalkToHim

    *["Do you know anything else about the position?" #>> IncrementRelationshipStat Ivy Bronislav Opinion 20]
        ->DoYouKnowAnythingElse
}

=== ReallyYouWould ===

Bronislav: "Really? You would do that?"

Ivy: "I can definitely mention you if it comes up in conversation. I don't talk to him too much about his work stuff, but if it does come up, I'll keep you in mind."

Bronislav: "Thank you so much Ivy! I really appreciate it."

Ivy: "Yeah, no problem." Ivy says softly.

->ShiftToJensen

=== IWouldAppreciate ===

Bronislav: "I would appreciate that."

Ivy: "I didn't ask him for too many details, he just said to pass off the info to anyone who I knew that might be interested. I can maybe ask him next time for more details if I talk to him about it again."

"I would definitely appreciate that if you could."

"I'll try to remember to ask for you." Ivy says with a small smile.

->ShiftToJensen

=== YouCouldTalkToHim ===

Bronislav: "You could talk to your Uncle for me."

Ivy: "I mean, yeah I could, but it's not like you'd do something like that for me."

Bronislav: "What's that supposed to mean?" You ask, a bit surprised.

Ivy: "Oh, don't play dumb Bronislav. You haven't exactly been shy about your dislike for me."

Bronislav: "Oh..." You say, embarrassed.

Ivy sighs.

Ivy: "Look, I brought up the job as a way to make amends. I figured it would be of interest to you, but I am not super interested in leveraging my relationship with my uncle on your behalf."

Bronislav: "I suppose I can understand that. I appreciate you mentioning the job least."

"Yeah, sure." Ivy says quietly

->ShiftToJensen

=== DoYouKnowAnythingElse ===

Bronislav: "Do you know anything else about the position?"

Ivy: "I didn't ask him for too many details, he just said to pass off the info to anyone who I knew that might be interested. I can maybe ask him next time for more details if I talk to him about it again."

Bronislav: "I would definitely appreciate that if you could."

Ivy: "I'll try to remember to ask for you." Ivy says with a small smile.

->ShiftToJensen

=== DontAsk ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

    You decide not to push your luck, especially since you would hate for her to feel like you are overstepping when she is already being so generous.

    Ivy smiles, as though a lightbulb went off in her head.

    Ivy: "Actually, I'm realizing I might be able to mention you to my uncle to help you get the position."

    Bronislav: "You'd do that?"

    Ivy: "Yeah, of course," Ivy says with a smile, "As long as I actually remember to."

    Bronislav: "Thank you so much Ivy!" You say with excitement, "I really appreciate it."

    "Mhm." Ivy says quietly.

    ->ShiftToJensen

    - ivyOpinion == OpinionState.Neutral:

    You decide not to push you luck, especially since you don't want to come off as ungrateful.

    Bronislav: "I now have something to look into while I wait for this review," you say excitedly.

    Ivy: "Now that I think about it, I could probably mention you to my uncle to help with your application."

    Bronislav: "Wait, really?"

    Ivy: "Yeah I could definitely do that. Well, as long as I remember to." She says with a laugh.

    Bronislav: "Heh, anything you feel comfortable doing I would definitely be grateful for." You say with a smile.

    Ivy: "Okay..." Ivy says, as she trails off.

    ->ShiftToJensen

    -else:

    You decide not to push your luck, especially since you and Ivy are not the closest.

    Bronislav: "I definitely now have something to look into while I wait for my review." You say appreciatively.

    Ivy nods.

    Ivy: "I could maybe even put in a good word for you if I talk to my uncle about it again."

    Bronislav: "Anything that would help me get the position would be super helpful," You say with a small smile.

    "Yeah..." Ivy says softly.

    ->ShiftToJensen
}

=== ShiftToJensen ===

She starts to absent mindedly twist her hair, as she appears to be lost in thought. Her face shifts to a look of concern. It definitely looks like something else is bothering her.

*["Are you alright?"]
    ->AreYouAlright

=== AreYouAlright ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

    Ivy: "Sorry, yeah."

    Ivy shakes her head as though waking up from a trance.

    Ivy: "I am okay, I am worried about Jensen though."

    *["What's going on with him?"]
        ->WhatsUpWithHim

    - ivyOpinion == OpinionState.Neutral:

    Ivy: "Huh?" Ivy says as her attention turns back to you.

    Ivy: "Yeah, I guess I am a bit worried about Jensen."

    *["What's going on with him?"]
        ->WhatsUpWithHim

    - else:

    Ivy stops and looks towards you, a bit surprised by your question.

    Ivy: "Yeah, I'm fine. I guess I am just a bit worried about Jensen."

    *["What's going on with him?"]
        ->WhatsUpWithHim
}

=== WhatsUpWithHim ===

Bronislav: "What's going on with him?"

Ivy: "He's been really stressed. He's such a hard worker, but he's always worried about not doing enough, and that is certainly not helping his anxiousness about grad school."

*["I know the feeling." #>> ChangeOpinion Ivy Bronislav ++++]
    ->IKnowTheFeeling

*["I hope he can figure that out."]
    ->HopeHeFiguresItOut

*["That's rough." #>> ChangeOpinion Ivy Bronislav ----]
    ->ThatsRough

*["Everyone experiences that." #>> ChangeOpinion Ivy Bronislav ++++]
    ->EveryoneExperiencesThat

=== IKnowTheFeeling ===

Bronislav: "I know the feeling." You say with a chuckle.

Ivy: "Yeah," Ivy says with a smile, "I guess you do, huh."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav ++++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav ++++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ----]
    ->HeShouldBeWorried

=== HopeHeFiguresItOut ===

Bronislav: "Yeah, that's a tough spot to be in. I hope he can figure it all out."

Ivy: "Me too," Ivy says with a sigh, "He definitely belongs in grad school."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav ++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav +++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ----]
    ->HeShouldBeWorried

=== ThatsRough ===

Bronislav: "That's really rough," You say nonchalantly.

Ivy: "Well of course it is." Ivy says flatly, "I'm just surprised you don't have more sympathy for the situation considering you also had a similar struggle."

*["Is there any way I can help him?" #>> ChangeOpinion Ivy Bronislav +++]
    ->AnyWayICanHelp

*["Jensen will figure it out."]
    ->JensensGotIt

*["I wouldn't worry about him." #>> ChangeOpinion Ivy Bronislav ++]
    ->IWouldntWorry

*["He should be worried." #>> ChangeOpinion Ivy Bronislav ---]
    ->HeShouldBeWorried

=== EveryoneExperiencesThat ===

Bronislav: "I think just about everyone in grad school has experienced those feelings." You say sympathetically.

Ivy: "Yeah, no kidding." Ivy says shaking her head, "It's always a grind."

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

Ivy: "Well, I know Jensen is looking to get on a research paper to help his chances. He thinks that by having authorship on something, he really will be able to make an impression."

*["Maybe I could put him on my paper?" #>> ChangeOpinion Ivy Bronislav +++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>> ChangeOpinion Ivy Bronislav --]
    ->HesInTrouble

=== JensensGotIt ===

Bronislav: "Jensen will figure it out, Ivy. If he's smart enough to get this far, he can figure out how to get into grad school."

Ivy: "Maybe you're right," Ivy says with a sigh.

Ivy: "He just keeps talking about needing to get on a research paper to help his chances, and the last time we talked he seemed pretty desperate.

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== IWouldntWorry ===

Bronislav: "While it's nice of you to be concerned, I wouldn't worry about Jensen. If he's as hard of a worker as you say, and he's got the will to go to grad school, he can make it. Just like I did."

Ivy: "Maybe you're right," Ivy says with a small smile.

Ivy: "The last time he talked he seemed pretty hellbent on getting on a research paper. I'm just not sure how he's going to do it going forward."

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== HeShouldBeWorried ===

Bronislav: "Jensen should be worried. If he isn't on top of his game, he simply won't get in to grad school."

Ivy shoots you a look of annoyance.

Ivy: "Yeah I think he's painfully aware of that, which is why he has been so stressed. He keeps bringing up that he needs to get on a research paper to solidify his chances, and I'm not sure how he's going to do it."

*["Maybe I could put him on my paper?" #>>ChangeOpinion Ivy Bronislav ++]
    ->PutHimOn

*["That's a tough one."]
    ->ThatsAToughie

*["A research paper isn't make or break."]
    ->IsntMakeOrBreak

*["He's in trouble if that's what he's gunning for."  #>>ChangeOpinion Ivy Bronislav ---]
    ->HesInTrouble

=== PutHimOn ===

Bronislav: "Maybe I could put him on my paper?"

Ivy perks up.

Ivy: "You'd consider doing something like that?"

Bronislav: "Hey, I was in his shoes at one point, I do know how hard it is to get into grad school."

->ContinueYES

=== ThatsAToughie ===

Bronislav: "That's a tough one. I'm not sure that there are a lot of research opportunities available to undergrads like that."

Ivy: "Yeah, that's exactly what I told him. But he's very determined, and I would hate to seem him crushed by this,"

Ivy looks as though she is considering something, and resolves to ask you.

->GiveQuidProQuo

=== IsntMakeOrBreak ===

Bronislav: "A research paper isn't make or break. There's lot of other ways to stand out getting into grad school, he just needs to look into them."

Ivy: "Yeah, maybe you're right. Still, he's certain it's the only path for him, no matter what I say to dissuade him."

Ivy looks as though she is considering asking you something, and resolves to ask.

->GiveQuidProQuo

=== HesInTrouble ===

Bronislav: "He's in trouble if that's what he's gunning for." You scoff.

Ivy: "Well, maybe, but I still want to try and help him, since that's what he wants to do."

Ivy looks as though she is considering asking you something, and decides to ask.

->GiveQuidProQuo

=== GiveQuidProQuo ===

Ivy: "Do you think you'd be willing to put Jensen on your paper?"

{DbInsert("givenQuidProQuo")}

*["Probably." #>> ChangeOpinion Ivy Bronislav ++]
    ->Probably

*["I'm not sure." #>> ChangeOpinion Ivy Bronislav --]
    ->NotSure

*["No."]
    ->No

=== Probably ===

{DbInsert("IvyDealConsidered")}

Bronislav: "Hmm, maybe I could do something like that. It would certainly be helpful to him."

Ivy perks up.

Ivy: "Really? You'd be willing to do something like that?"

Bronislav: "Probably, yeah." You say with a shrug.

->ContinueYES

=== NotSure ===

Bronislav: "I'm not sure that I could." You say hesitantly, "I don't think I can just add him without causing some problems for the paper."

Ivy: "Oh, alright. Well, if you could, I would ask that you at least consider it, just because I know it would help Jensen a lot. And it would certainly make me feel a lot less worried."

Bronislav: "Sure, I can keep it mind."

->ContinueMAYBE

=== No ===

Bronislav: "No, I definitely can't do that. It would be very unethical for me to do something like that."

Ivy: "Well, I guess it was worth an ask." Ivy says with a shrug.

Ivy: "You're one of the main people I know who has an active research paper, so it would be a big help if you could get him on it"

Bronislav: "I understand where you're coming from, but I don't think I will be an option."

->ContinueNO

=== ContinueYES ===

{DbInsert("IvyDealAccepted")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

        Ivy: "I'm really glad that you're willing to help Jensen." Ivy says, practically glowing.

        Ivy: "I know this will definitely settle his nerves."

        Bronislav: "I'm happy to help," You say with a smile.

        Ivy: "Thanks Bronislav, you really are a true friend."

        ->ContinueOutro

    - ivyOpinion == OpinionState.Neutral:

        Ivy: "That's really nice of you to be willing to help Jensen." Ivy says with a smile, "It certainly will not go unappreciated."

        Bronislav: "Don't mention it."

        Ivy: "I'll be sure to tell him that you're willing to help."

        ->ContinueOutro

    - else:

        Ivy: "I'm a little surprised you're so willing to help Jensen, but I'm very happy that you are."

        Bronislav: "I'm always willing to help someone who's going through some of the same struggles that I went through."

        Ivy: "Thank you, Bronislav, I know this is going to mean a lot to Jensen."

        ->ContinueOutro
}

=== ContinueMAYBE ===

{DbInsert("IvyDealConsidered")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

        Ivy: "I appreciate it, Bronislav. I hope you'll come to see that this a great way to help out your friends."

        ->ContinueOutro

    - ivyOpinion == OpinionState.Neutral:

        Ivy: "I hope that you consider adding him, you and I both know it would really help a lot."

        ->ContinueOutro

    - else:

        Ivy: "I know you have mixed feelings, but at least consider adding him. I know it would mean a lot to Jensen."

        ->ContinueOutro
}

=== ContinueNO ===

{DbInsert("IvyDealDenied")}

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

        Ivy: "While I respect where you are coming from Bronislav, I really hope you reconsider."

        ->ContinueOutro

    - ivyOpinion == OpinionState.Neutral:

        Ivy: "I know you have concerns, but I hope you reconsider for Jensen's sake. It would do a lot to settle his nerves."

        ->ContinueOutro

    - else:

        Ivy: "I know you're insistent on being stubborn, but I really hope you'll come around." Ivy says pointedly.

        ->ContinueOutro
}

=== ContinueOutro ===

~ temp ivyOpinion = GetOpinionState("Ivy", "Bronislav")

{
    - ivyOpinion >= OpinionState.Good:

        Ivy looks down to her watch and a look of surprise washes over her face.

        Ivy: "Wow. I really got swept up in this conversation. I've gotta go for now Bronislav, but it was nice chatting."

        Bronislav: "Yeah, always a pleasure."

    - ivyOpinion == OpinionState.Neutral:

        Ivy looks down to her watch and a look of surprise washes over her face.

        Ivy: "Wow. I really got swept up in the conversation. I've gotta go for now Bronislav, but we'll chat again soon."

        Bronislav: "Alright, bye Ivy."

    - else:

        Ivy looks down at her watch and a look of surprise washes over her face.

        Ivy: "Wow. I really got swept up in this conversation. I've gotta got Bronislav, but see you around, I guess?"

        Bronislav: "Yeah, I guess."
}

{HideCharacter("Ivy")}
-> DONE
