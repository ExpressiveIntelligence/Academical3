VAR withdrewPaper = false

=== BB_LabMeeting_SceneStart ===
# ---
# choiceLabel: Sit and relax.
# @query
# date.day!6
# @end
# repeatable: false
# tags: action, student_cubes, auxiliary
#===
#Summary: Brad either goes to ethics training or shares excitement about next conference

{DbInsert("Seen_BB_LabMeeting")}

~ withdrewPaper = DbAssert("BradWithdrawsData")


{ShowCharacter("Brad", "left", "")}

{withdrewPaper:
//paper was withdrawn
At the lab meeting, you're approached by Brad. He seems happy to see you.

Brad: "Hey hey Bronislav! How's it going?"

*["Going great!"]
->BB_LabMeeting_GoingGreat

*["I've been good."]
->BB_LabMeeting_Good

*["It's complicated."]
->BB_LabMeeting_Complicated
}
{not withdrewPaper:
//paper was not withdrawn
~temp r = GetOpinionState("Brad", "Bronislav")
{r == OpinionState.Good || r == OpinionState.Excellent:
While at the lab meeting, Brad runs into you again.

Brad: "Hey Bronislav. Have you been doing good?"

*["Doing great!"]
->BB_LabMeeting_GoingGreat

*["I've been good."]
->BB_LabMeeting_Good

*["It's complicated."]
->BB_LabMeeting_Complicated
}

{r == OpinionState.Terrible || r == OpinionState.Bad || r == OpinionState.Neutral:

While at the lab meeting, Brad runs into you again.

Brad: "Hey Bronislav."

*["Hey Brad."]
->BB_LabMeeting_HeyBrad
}

}

=== BB_LabMeeting_GoingGreat ===
Bronislav: "It's been going great! I'm curious with how you're doing Brad, you seem to be happy though."

Brad nods.

Brad: "Yeah, after withdrawing the paper all I can do now is just look forward to the next conference, and not make the same mistakes again."

*["Glad to hear!"]
->BB_LabMeeting_GladtoHear

*["How's Ned?"]
->BB_LabMeeting_HowsNed

*["Any ideas for next year?"]
->BB_LabMeeting_AnyIdeas

=== BB_LabMeeting_Good ===
Bronislav: "I've been pretty good, finally getting a break is much needed right now. How about you, Brad?"

Brad thinks for a moment.

// TODO: I think we're missing a choice option in here? This looks like it was written exclusively for brad ending bad

Brad: "Well, on one hand I'm excited to work on a new paper next year, but this ethics training is going to be a sink into my freetime. Overall, not too bad though."

*["Glad to hear!"]
->BB_LabMeeting_GladtoHear

*["How's Ned?"]
->BB_LabMeeting_HowsNed

*["Any ideas for next year?"]
->BB_LabMeeting_AnyIdeas

=== BB_LabMeeting_Complicated ===
Bronislav: "It's a bit complicated right now, but it's not a big deal. How're you doing, Brad?"

Brad thinks for a moment.


// TODO: I think we're missing a choice option in here? This looks like it was written exclusively for brad good ending
{withdrewPaper:
Brad: "Well, on one hand I'm excited to work on a new paper next year, but this ethics training is going to be a sink into my freetime. Overall, not too bad though."

*["Glad to hear!"]
->BB_LabMeeting_GladtoHear

*["How's Ned?"]
->BB_LabMeeting_HowsNed

*["Any ideas for next year?"]
->->BB_LabMeeting_AnyIdeas
}

=== BB_LabMeeting_HeyBrad ===
Bronislav: "Hey Brad, how's it going?"

Brad: "Fine." Brad says coldly.

Brad: "Busy with my ethics training recently, not much going on outside of that though now."

*["That's all you're doing?" #>> ChangeOpinion Brad Bronislav --]
->BB_LabMeeting_ThatsAll

*["I'm sorry to hear that."]
->BB_LabMeeting_SorrytoHear

=== BB_LabMeeting_GladtoHear ===
Bronislav: "I'm glad to hear that Brad! Sorry it couldn't work out this year, but I know you'll make something great."

Brad shrugs.

Brad: "I'm not happy about it either, but you live and you learn. Thanks for being by my side through it all though Bronislav. It means a lot."

*["No problem."]
->BB_LabMeeting_NoProb

*["Are you free later?"]
->BB_LabMeeting_FreeLater

=== BB_LabMeeting_HowsNed ===
Bronislav: "Glad to hear you've been alright, and are looking forward to the future, Brad. Is Ned feeling the same at all?"

Brad chuckles awkwardly.

Brad: "He's definitely still not over everything, but I think that's understandable. I definitely feel like we're still on good terms. I do still feel like I disappointed him."

*["Could be worse."]
->BB_LabMeeting_CouldbeWorse

*["Are you free later?"]
->BB_LabMeeting_FreeLater

=== BB_LabMeeting_AnyIdeas ===
Bronislav: "Have you had time to think of what you're doing next year?"

Brad sighs.

Brad: "Unfortunately, not really. This whole thing has kind of been in the back of my mind, I'm still a bit rattled by everything."

*["That makes sense."]
->BB_LabMeeting_MakesSense

*["Are you free later?"]
->BB_LabMeeting_FreeLater

=== BB_LabMeeting_ThatsAll ===
Bronislav: "That's all you're doing?"

Brad seems offended.

Brad: "No Bronislav, I obviously do more, just nothing I thought would interest you. Like right now I'm spending my time to see how people I knew were working on papers, like you, were doing."

Brad: "I just wanted to talk, smooth things out. You know? It's alright if you don't want to Bronislav, I've got other people to talk to anyways."

Brad turns and leaves.

{HideCharacter("Brad")}

->DONE

=== BB_LabMeeting_SorrytoHear ===
Bronislav: "I'm sorry to hear that, Brad. Wish things could have gone differently."

Brad sighs.

Brad: "Me too Bronislav, me too. It's really frustrating, but I know I'll move past it."

*["Want to talk more later?"]
->BB_LabMeeting_WantToTalkMore

*["Hope that goes well."]
->BB_LabMeeting_HopeItGoeseWell

=== BB_LabMeeting_NoProb ===
Bronislav: "No problem Brad, that whole situation was tough. If you want to talk more about it I'll be more free after this."

Brad gives a nod.

Brad: "That sounds like a plan to me, hope to see you then."

{HideCharacter("Brad")}

->DONE

=== BB_LabMeeting_CouldbeWorse ===
Bronislav: "Well it could be worse."

Brad laughs.

Brad: "I guess that's this whole situation in a nutshell isn't it?"

"Well," Brad says after a brief pause, "If you're free later I'd love to talk a bit more. I'm going to head out to the cafe, hopefully see you later Bronislav."

{HideCharacter("Brad")}

->DONE

=== BB_LabMeeting_FreeLater ===
Bronislav: "Well, I don't want to keep you for too long Brad, but are you free later to talk more?"

Brad looks excited.

Brad: "I am actually! I'd be happy to talk more at the cafe sometime after this. Hope to see you there."

{HideCharacter("Brad")}

->DONE

=== BB_LabMeeting_WantToTalkMore ===
Bronislav: "Do you want to talk more later? I'd love to chat over a coffee to talk about it more."

"Yeah." Brad says with a full smile, "I would like that, hope to see you later then."

{HideCharacter("Brad")}

->DONE

=== BB_LabMeeting_HopeItGoeseWell ===
Bronislav: "I hope that goes well for you, good luck on the trainings."

Brad lightly smiles.

Brad: "Thanks Bronislav. If you want to talk more later, I'll be at the cafe. Don't want to take up more of your time."

{HideCharacter("Brad")}

->DONE


=== BB_LabMeeting_MakesSense ===

// TODO: Add content for this dialogue path

There is no content for this dialogue path.

{HideCharacter("Brad")}

-> DONE
