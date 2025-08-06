=== BB_ConferenceSubmissionDeadline_SceneStart ===
# ---
# choiceLabel: Sit and relax.
# @query
# date.day!3
# @end
# hidden: true
# repeatable: false
# tags: action, student_cubes, auxiliary
# ===
# Summary: Brad confides in Bronislav about using pre-IRB data

~temp r = GetOpinionState("Brad", "Bronislav")
{r == OpinionState.Terrible || r == OpinionState.Bad || r == OpinionState.Neutral:
->DONE
}

{DbInsert("Seen_BB_ConferenceSubmissionDeadline")}

After submitting your paper you sit down and try to finally get a second of rest. However, you see Brad cautiously approach you.

{ShowCharacter("Brad", "left", "")}

Brad: "Hey Bronislav. Nice to see you! How've you been?" 

*["Relieved."]
->BB_CSD_Relieved

*["Pretty tired."]
->BB_CSD_PrettyTired

*["Alright."]
->BB_CSD_Alright

=== BB_CSD_Relieved ===
Bronislav: "I'm just relieved that I got it all submitted. Everything alright with you Brad?"

Brad looks around for a moment.

Brad: "It... it really could be going a lot better."

*["What's happening?"]
->BB_CSD_WhatsHappening

*["Anyway I could help?"]
->BB_CSD_AnywayICouldHelp

=== BB_CSD_PrettyTired ===
Bronislav: "Overall, pretty tired. Luckily I can take a load off now. How's your paper coming along?"

Brad half-heartedly chuckles.

Brad: "Yeah I've also been pretty tired recently. A lot of stress around the paper."

*["What's happening?"]
->BB_CSD_WhatsHappening

*["It is stressful."]
->BB_CSD_ItsStressful

=== BB_CSD_Alright ===
Bronislav: "I've been alright. The paper's been taking up most of my time, but I've at least got today to cool off. What about you?"

Brad nods in agreeance.

Brad:"I just really want something to take my mind off the paper, it's been... less than great."

*["What's happening?"]
->BB_CSD_WhatsHappening

*["Anyway I could help?"]
->BB_CSD_AnywayICouldHelp

*["It is stressful."]
->BB_CSD_ItsStressful

=== BB_CSD_WhatsHappening ===
Bronislav: "What's happening with your paper Brad? The IRB got back to you right?"

Brad: "Y-yeah they did."

Brad anxiously scratches the back of his head.

Brad: "I just need your input on something."

*["Input on what?"]
->BB_CSD_InputOnWhat

*["What did you do?" #>> ChangeOpinion Brad Bronislav -]
->BB_CSD_WhatDidYouDo

=== BB_CSD_AnywayICouldHelp ===
Bronislav: "Is there some way I can help? I know the conference submission deadline is soon, but I'll help where I can."

Brad shrugs.

Brad: "There's nothing really to do now. I appreciate the offer, but can I just... run something by you Bronislav?"

*["Go ahead."]
->BB_CSD_GoAhead

*["What did you do?" #>> ChangeOpinion Brad Bronislav -]
->BB_CSD_WhatDidYouDo

=== BB_CSD_ItsStressful ===
Bronislav: "It definitely has proven stressful. Sorry to hear it's been especially so for you."

Brad smiles.

Brad: "Thanks Bronislav, means a lot, really.  Also, could I ask you something?"

*["Go ahead."]
->BB_CSD_GoAhead

*["What did you do?" #>> ChangeOpinion Brad Bronislav -]
->BB_CSD_WhatDidYouDo

=== BB_CSD_InputOnWhat ===
Bronislav: "Sure! What do you need input on?"

Brad looks even more nervous.

Brad: "So, I did get the IRB approval. I just got it way later than I wanted. I thought that I'd just get some data to use to get started on the paper. So...I used that data on my paper."

He looks at you.

Brad: "It shouldn't be that big of a deal though, right?"

*["That's really bad."]
->BB_CSD_ThatsReallyBad

*["I'm not sure."]
->BB_CSD_NotSure

*["It shouldn't be that bad." #>>ChangeOpinion Brad Bronislav ++]
->BB_CSD_ShouldntBeThatBad

=== BB_CSD_WhatDidYouDo ===
Bronislav: "Brad, what did you do?"

Brad looks a bit offended to hear you say this.

Brad: "Well...I ended up using some data I did collect, and I did get IRB approval to collect the data. I just did it in... the wrong order."

He looks at you then snaps back to what he was saying.

Brad: "I just really wanted to start on the paper, and didn't want to stress about the IRB anymore. I got their approval anyway, can't be that big of a problem."

*["That's really bad."]
->BB_CSD_ThatsReallyBad

*["I'm not sure."]
->BB_CSD_NotSure

*["It shouldn't be that bad." #>> ChangeOpinion Brad Bronislav ++]
->BB_CSD_ShouldntBeThatBad

=== BB_CSD_GoAhead ===
Bronislav: "Go ahead!"

Brad beams happily.

Brad: "Great! I used the data I gathered, submitted the paper, and got the IRB's approval on my research."

He pauses for a bit.

Brad: "The only problem is I got the data before the IRB approved it. That can't be too big of a deal though right? They still approved my research, I just did it before they did."

*["That's really bad."]
->BB_CSD_ThatsReallyBad

*["I'm not sure."]
->BB_CSD_NotSure

*["It shouldn't be that bad." #>> ChangeOpinion Brad Bronislav ++]
->BB_CSD_ShouldntBeThatBad

=== BB_CSD_ThatsReallyBad ===
Bronislav: "Brad, that is a really bad thing to do. Even if they did approve you doing your research doesn't mean you can get data before you got approval."

Brad looks even more nervous.

Brad: "They wouldn't know though, so what difference does it make?"

*["It makes a huge difference." #>> ChangeOpinion Brad Bronislav +]
->BB_CSD_HugeDifference

*["Don't be dumb Brad." #>> ChangeOpinion Brad Bronislav -]
->BB_CSD_DontBeDumb

=== BB_CSD_NotSure ===
Bronislav: "I'm not really sure Brad. I think that's something you should tell some faculty and see what they think."

Brad thinks for a moment.

Brad: "I probably should, but I don't want to waste all the research I did. I'll think on it."

*["Should do it soon."  #>> ChangeOpinion Brad Bronislav -]
->BB_CSD_ShouldDoItSoon

*["Definitely think on it."]
->BB_CSD_ShouldDefThinkOnIt

=== BB_CSD_ShouldntBeThatBad ===
Bronislav: "I feel like you're right. It's not your fault the IRB takes forever, and you have deadlines to meet. I wouldn't worry about it."

Brad looks relieved.

Brad: "That's great to hear. I also didn't think it'd be that bad, just glad you also thought so."

*["Of course."]
->BB_CSD_OfCourse

*["Anything else?"]
->BB_CSD_AnythingElse

=== BB_CSD_HugeDifference ===
Bronislav: "It makes a huge difference Brad. You can face huge fines or receive academic punishment. It's just not something you should risk while you have the opportunity."

Brad looks upset, but understanding.

Brad: "Thanks Bronislav. I'll consider withdrawing the paper."

He packs up his things, and waves goodbye without another word.

{HideCharacter("Brad")}

->DONE

=== BB_CSD_DontBeDumb ===
Bronislav: "Brad you and I both know that the IRB has strict rules that we all need to follow for a reason. Don't be dumb."

Brad looks confused hearing you say this.

Brad: "Bronislav I just wanted your opinion on something I wasn't sure of the answer."

He starts walking away.

Brad: "I'll talk to you some other time Bronislav, maybe when we can have a reasonable conversation."

{HideCharacter("Brad")}

->DONE

=== BB_CSD_ShouldDoItSoon ===
Bronislav: "You should definitely check with them sooner rather than later. I feel like that's something that should be disclosed early."

Brad nods his head in agreement.

Brad: "That definitely sounds like a good plan."

Brad looks back up while packing up his things.

Brad: "I'll let you know when I hear back. Thanks Bronislav!"

{HideCharacter("Brad")}

->DONE

=== BB_CSD_ShouldDefThinkOnIt ===
Bronislav: "It's definitely something you should think on Brad, let me know whenever that works out."

Brad gives you a thumbs up.

Brad: "Thanks Bronislav. I will let you know!"

He waves you goodbye as he leaves.

{HideCharacter("Brad")}

->DONE

=== BB_CSD_OfCourse ===
Bronislav: "Of course, happy to help in any way I can Brad."

He seems happy and relaxed for the first time since before the paper.

Brad: "Feels like a big weight just got taken off my shoulders."

He packs up his things.

Brad: "Think I'm going to take a lesson from you and take a chance to relax. See ya Bronislav!"

{HideCharacter("Brad")}

->DONE

=== BB_CSD_AnythingElse ===
Bronislav: "Is there anything else you needed, Brad?"

Brad shakes his head.

Brad: "Nope, that's all I really had! Thanks a ton Bronislav. Time for me to have a chance to relax."

{HideCharacter("Brad")}
->DONE
