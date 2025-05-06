== BP_Socializing4_SceneStart ===
#---
#choiceLabel: Chat with Praveen.
#@query
# date.day!4
#@end.
#repeatable: false
#tags: action, student_cubicles
#===

{DbInsert("Seen_BP_Socializing4")}

{ShowCharacter("Praveen", "left", "")}
Striding into the student cubicles you spot Praveen clacking away on his computer. He looks concentrated but has a prideful resting face. 

*["Yo Praveen."] 
->BP_Socializing4_YoPraveen

*["What are you working on?"]

->BP_Socializing4_WhatYouWorking

*[Peek over his shoulder.]

->BP_Socializing4_PeekOver

=== BP_Socializing4_YoPraveen ===
Bronislav: "Yo Praveen, whats up?"

Praveen jumps slightly as he takes off his headphones.

Praveen: "Bronislav, dude warn me next time."

*["Locked in I see?"]
->BP_Socializing4_LockedIn

*["Don't be a scaredy cat." #>> DecrRelationshipStat Praveen Bronislav 5]
->BP_Socializing4_ScaredyCat

=== BP_Socializing4_WhatYouWorking ===
Bronislav: "What are you working on? You seemed pretty locked in."

Praveen: "I've been analyzing these papers. It's pretty straightforward and rather effortless."

Bronislav: "Gotcha, still working on the review process."

Praveen: "Yup, it's going quite well. Honestly, I quite enjoy the process."

*["I mean you just giving your advice right?"]
->BP_Socializing4_GivingAdvice

*["Don't you just give comments?"]
->BP_Socializing4_GiveComments

=== BP_Socializing4_PeekOver ===
Walking towards Praveen you peek over his shoulder. Praveen noticing a presence turns around.

Praveen: "Bronislav, geez, you're gonna kill me."

Bronislav: "My bad, I should've said something." 

Praveen shakes his head.

Praveen: "What are you doing here?"

*["I was gonna do some work."]
->BP_Socializing4_DoSomeWork

=== BP_Socializing4_LockedIn ===
Bronislav: "Locked in I see, what are you working on."

Praveen: "Just working on reviewing some more papers right now." 

Bronislav: "Gotch ya, how's that going." 

Praveen: "Swimingly to say the least, this paper needs some work though so I'm just adding some comments."

*["Easy work huh?"]
->BP_Socializing4_EasyWorkHuh

=== BP_Socializing4_ScaredyCat ===
Bronislav: "Come on, don't be a scardy cat."

Praveen rolls his eyes at you going back to his work.

Praveen: "Yeah whatever dude."

Bronislav: "What are you working on anyways?"

Praveen: "Same as last time, reviewing some papers."

*["Easy work huh?"]
->BP_Socializing4_EasyWorkHuh

=== BP_Socializing4_GivingAdvice ===
Bronislav: "I mean you're just giving advice right?"

Praveen: "You could say thats the simple way to put it. This paper just needs some work so I'm adding some comments."

*["Easy work huh?"]
->BP_Socializing4_EasyWorkHuh

=== BP_Socializing4_GiveComments ===
Bronislav: "Don't you just give comments?"

Praveen: "Yeah pretty much, It's quite easy and simple. In all honesty, I feel as if I can have a real impact. This gives me a sense of satisfaction."  

*["Easy work huh?"]
->BP_Socializing4_EasyWorkHuh

=== BP_Socializing4_DoSomeWork ===
Bronislav: "Oh I was just looking to do some work but noticed you pretty locked in over here. So I decided to check in."

Praveen raises an eyebrow.

Praveen: "Check in by scaring the living daylights out of me?"

*["Don't be a scaredy cat."]
->BP_Socializing4_ScaredyCat

*["That was an accident."]
->BP_Socializing4_ThatWasAnAccident

=== BP_Socializing4_ThatWasAnAccident ===
Bronislav: "Hey hey that was an accident."

You put your hands up in defense as Praveen shakes his head.

Praveen: "Yeah yeah okay."

*["What are you working on?"]
->BP_Socializing4_WhatYouWorking

=== BP_Socializing4_EasyWorkHuh ===
Bronislav: "Easy work huh?"

Praveen: "Indeed, quite."

Bronislav: "You seem very engrossed in it."

Praveen: "Well, in all honesty in a way I understand why professors like being professors."

Bronislav: "What do you mean?"

Praveen: "Well they get to determine the outcome of their students, that's quite the power no?

*["I'm not sure if that is the point of this..." #>> DecrRelationshipStat Praveen Bronislav 10]
->BP_Socializing4_PointOfThis

*["Yeah I totally agree!" #>> IncrementRelationshipStat Praveen Bronislav 10]
->BP_Socializing4_TotallyAgree

*["I think of it from a different perspective." #>> IncrementRelationshipStat Praveen Bronislav 5]
->BP_Different_Perspective

=== BP_Socializing4_PointOfThis ===
Bronislav: "I'm not sure if that's the point of this assignment...."

Praveen turns towards you his expression more guarded.

Praveen: "What do you mean not the point of this assignment? Do you think I'm doing my job wrong?"

Bronislav: "No thats not what I'm saying I just think that this was not what Hendricks had in mind when giving you this task."

Praveen: "I'm not sure what you mean. Look I need to get back to this, I'll talk to you later Bronislav.

Praveen turns back to his assignment ignoring you as his signal to leave. 

{HideCharacter("Praveen")}
->DONE

=== BP_Socializing4_TotallyAgree ===
Bronislav: "Yes I totally agree. Professors get so much power, they literally determine our fates with there grading. You're basically one right now."

Praveen: "Yeah I know, right? These papers are in my hands... I should probably be getting back to work. I'll catch you later Bronislav."

Bronislav: "Alright, good luck!."

Praveen goes back to his work as you walk to settle and get some of your own work done. 

{HideCharacter("Praveen")}
->DONE

=== BP_Different_Perspective ===
Bronislav: "I think of it from a different perspective. Think of it like this way: Professors are given a big responsibility to aid students, like you are doing now."

Praveen nods his head following along.

Bronislav: "Hendricks has trusted you for this because she has faith you'll treat this professionally and well."

Praveen: "I see. Yes I can get behind that logic. I need to be responsible for higher results."

*[Nod your head.]
->BP_Socializing4_NodYourHead

=== BP_Socializing4_NodYourHead ===
You nod your head in agreement.

Bronislav: "Yes, exactly." 

Praveen: "Well, thanks for stopping by, I gotta get back to work but I'll see you around."

Bronislav: "Sounds good, good luck with the rest of your work!"

{HideCharacter("Praveen")}
->DONE