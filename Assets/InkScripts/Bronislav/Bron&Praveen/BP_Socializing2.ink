// Wishes Hendricks would ask to help with conference
// Tell Praveen he will put in a good word for him or not

=== BP_Socializing2_SceneStart ===
#---
# choiceLabel: Talk with Praveen.
# @query
# date.day!1
# @end
# hidden: true
# tags: action, student_cubes, required
# repeatable: false
#===

// Summary: Praveen asks you to help on getting Hendrick's approval

VAR BP_Suggestion = false
VAR BP_S2_Pretentious = false
VAR BP_S2_AskDirectly = false

{ShowCharacter("Praveen", "left", "")}

You notice your friend Praveen working at his desk and decide to talk to him. It's been a while since you two have hung out.

Bronislav: "Hey Praveen, what are you working on?"

Praveen: "Oh hey Bronislav."

He pushes aside his laptop.

Praveen: "I was just working on this paper on the multitude of perspectives regarding the influence of AI in various technological fields. Convulted, I know, but nevertheless I am tackling it."

*["Oh, nice." ]
->BP_Socializing2_OhNice

*["Well, that sounds like a lot." #>> ChangeOpinion Praveen Bronislav +]
->BP_Socializing2_SoundsLikeALot

*["As pretentious as ever." #>> ChangeOpinion Praveen Bronislav --]
->BP_Socializing2_AsPretentious

=== BP_Socializing2_OhNice ===
Bronislav: "Oh, nice. Sounds interesting."

Praveen: "Endlessly so, but enough about me. How have you been doing?"

*["I've had a lot on my plate as well."]
->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_SoundsLikeALot ===
Bronislav: "Well, that sounds like a lot of work."

Praveen becomes excited that you think something he's working on is difficult.

Praveen: "Yes, it is, but I am managing. But enough about me, how have you been doing?"

*["I've had a lot on my plate as well."]
->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_AsPretentious ===
Bronislav: "As pretentious as ever I see."

You say with an unmasked eye roll.

Praveen: "And here I hoped that you were less self-important than you used to be. Whatever, you clearly didn't come over here to talk about me. How have you been doing?"

*["I've had a lot on my plate as well."  #>> ChangeOpinion Praveen Bronislav -]
~ BP_S2_Pretentious = true
Bronislav: "I've had a lot on my plate. I just finished getting my own paper ready for IRB review."

Praveen: "I'm not surprised that's keeping you busy. You probably are getting plenty of pushback knowing your tendency to work alone. Hendricks certainly never helps matters."

->BP_Socializing2_LotOnMyPlate

*["Pretty good."]
->BP_Socializing2_PrettyGood

*["Could be better."]
->BP_Socializing2_CouldBeBetter

=== BP_Socializing2_LotOnMyPlate ===
{ BP_S2_Pretentious == false:
Bronislav: "I've had a lot on my plate. I just finished getting my own paper ready for IRB review."

Praveen: "Oh wow, that is a lot. Hopefully the stress hasn't been too much for you. Hendricks certainly never helps matters."
}

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*[Why does he think Hendricks is a problem?] -> HendricksExpositionLoop

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_PrettyGood ===
Bronislav: "I've been pretty good overall. I just finished getting my own paper ready for IRB review."

Praveen: "Oh, I see. Well, good luck with that. And hopefully you can get more help from Hendricks than I have been able to."

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*[Why does he think Hendricks is a problem?] -> HendricksExpositionLoop

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_CouldBeBetter ===
Bronislav: "Things could be better for sure. I just finished getting my own paper ready for IRB review, but I have been busy working on everything else I have been neglecting." 

Praveen: "That is certainly a lot, especially when you can't exactly expect too much help from Hendricks."

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*[Why does he think Hendricks is a problem?] -> HendricksExpositionLoop

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

==HendricksExpositionLoop==
Praveen has been struggling quite a bit to get involved in the community, and tends to put the blame on Hendricks for not telling him of more opportunities.

*["I'm not stressed about it."]
->BP_Socializing2_NotStressed

*["Hendricks? How is she a problem?"]
->BP_Socializing2_ShesNotAProblem

// TODO: MAKE A SELECTOR FOR YOU HAVE PREVIOUSLY TALKED TO HEDRICKS
*["Hendricks has been helpful."]
->BP_Socializing2_HendricksHelpful

=== BP_Socializing2_NotStressed ===
Bronislav: "Ehh... I'm not too stressed honestly. I just got to jump through all the hoops and I'll be fine."

Praveen: "So Hendricks is going to help you then?"

*["I'd assume so."]
->BP_Socializing2_ShesMyAdvisor

*["Why are you so interested in talking about Hendricks?"]
->BP_Socializing2_InterestedHendricks

=== BP_Socializing2_ShesMyAdvisor ===
Bronislav: "She's my advisor, so I'd assume I will receive feedback from her, yes."

Praveen groans as he spins in his chair.

Praveen: "Why is she helpful to everyone else besides me?"

*["I'm not sure I follow."]
->BP_Socializing2_NotSureIFollow

*["What are you whinning about?"  #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing2_Whinning

=== BP_Socializing2_InterestedHendricks ===
Bronislav: "Why are you so interested in talking about Hendricks?"

Praveen slumps over at his desk dramatically.

Praveen: "It's not that I'm super interested in talking about her, I just..."

Bronislav: "You're just what?"

Praveen: "I just really wish Hendricks would ask me to help with getting into a conference. I know she's been helping you and Brad with that other conference, but I found this one and wish I had a volunteer opportunity. I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_ShesNotAProblem ===
Bronislav: "Hendricks? How is she a problem?"

Praveen slumps over at his desk dramatically.

Praveen: "It's not that she's a problem... it's just..."

Bronislav: "It's just what?"

Praveen sighs as he looks over at you.

Praveen: "I just really wish Hendricks would ask me to help with getting into a conference. I know she's been helping you and Brad with that other conference, but I found this one and wish I had a volunteer opportunity. I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_HendricksHelpful ===
Bronislav: "Hendricks has been nothing but helpful to me, Praveen. I'm not sure what you're issue is, but maybe it's a bit unfounded."

Praveen: "I don't have an issue with her..."

Bronislav: "But?"

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "I just really wish Hendricks would ask me to help with getting into a conference. I know she's been helping you and Brad with that other conference, but I found this one and wish I had a volunteer opportunity. I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_NotSureIFollow ===
Bronislav: "I'm not sure I follow."

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "I just really wish Hendricks would ask me to help with getting into a conference. I know she's been helping you and Brad with that other conference, but I found this one and wish I had a volunteer opportunity. I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_Whinning ===
Bronislav: "What are you whinning about? Get yourself together, Praveen."

Praveen: "Easy for you to say, you're clearly a favorite of hers."

Praveen sighs as he slumps over at his desk dramatically.

Praveen: "I...just really wish Hendricks would ask me to help with getting into a conference. I know she's been helping you and Brad with that other conference, but I found this one and wish I had a volunteer opportunity. I haven't had much luck at all."

->BP_Socializing2_Suggestion

=== BP_Socializing2_Suggestion ====
You notice that despite all of his theatrics, he is genuinely stressed about the situation.

*["Have you tried just asking her directly?"]
->BP_Socializing2_AskDirectly

*["Is there anything I could do to help?"  #>> ChangeOpinion Praveen Bronislav +]
->BP_Socializing2_CouldIHelp

*["Surely this is something you can figure out yourself?" #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing2_SurelyYouCanFigure

=== BP_Socializing2_AskDirectly ===
~ BP_S2_AskDirectly = true
Bronislav: "Have you considered just asking her directly?"

Praveen: "Of course you would suggest the tasteless option. You and I both know no good comes from being overly direct about your intentions. It's always best to let someone think they are original for having the idea to help you."

*["That's a great way to end up with no help."]
->BP_Socializing2_GreatWayToEndUp

*["You realize it's generally better to just ask for things, right?"]
->BP_Socializing2_GenerallyBetterToAsk

*["I'm pretty direct and I don't have problems."]
->BP_Socializing2_ImDirect

=== BP_Socializing2_GreatWayToEndUp ===
Bronislav: "That's a great way to end up with no help. People generally aren't mind readers, Praveen."

Praveen: "Well, then, what would you suggest?"

*["Ask Hendricks."]
->BP_Socializing2_AskHendricks

*["Do you have a plan right now?"]
->BP_Socializing2_DoYouHaveAPlan

=== BP_Socializing2_GenerallyBetterToAsk
Bronislav: "You realize it's generally better to just ask for things when you need them, right? People are usually flattered when you ask them for help."

Praveen: "Hmmm... I guess I hadn't thought about it like that. Okay, so say I be direct about wanting to help with the conference. What would you suggest?"

*["Ask Hendricks."]
->BP_Socializing2_AskHendricks

*["Do you have a plan right now?"]
->BP_Socializing2_DoYouHaveAPlan

=== BP_Socializing2_ImDirect ===
Bronislav: "I'm pretty direct about what I need, especially when asking people for help, and I usually don't have any problems because of that."

Praveen: "Well, that's because you're you, Bronislav. Not everyone can just waltz up and ask exactly what they need."

Bronislav: "And not asking is a great way to end up with no help. People generally aren't mind readers, Praveen."

Praveen: "Well, then, what would you suggest?"

*["Ask Hendricks."]
->BP_Socializing2_AskHendricks

*["Do you have a plan right now?"]
->BP_Socializing2_DoYouHaveAPlan

=== BP_Socializing2_CouldIHelp ===
Bronislav: "Is there anything I could do to help?"

Praveen lights up immediately.

Praveen: "Wait, you'd really be willing to help me?"

Bronislav: "What did you have in mind?"

Praveen: "Well, I know Hendricks likes you, or at least respects your opinion. I was wondering if you would be willing to just put in a good word for me next time you talk to Hendricks."

*["Why can't you just ask Hendricks?"]
->BP_Socializing2_AskHendricks

*["I could do that."  #>> ChangeOpinion Praveen Bronislav ++]
->BP_Socializing2_ICanDoThat

=== BP_Socializing2_SurelyYouCanFigure ===
Bronislav: "Surely this is something you can figure out yourself?"

Praveen shoots you a look of annoyamce.

Praveen: "I suppose I can, but I was kind of thinking I could enlist your help Bronislav."

Bronislav: "What do you need my help with?" 

Praveen: "Well, I know Hendricks likes you, or at least respects your opinion. I was wondering if you would be willing to just put in a good word for me next time you talk to Hendricks."

*["Why can't you just ask Hendricks?"]
->BP_Socializing2_AskHendricks

*["I could do that."  #>> ChangeOpinion Praveen Bronislav ++]
->BP_Socializing2_ICanDoThat

=== BP_Socializing2_AskHendricks ===
{ BP_S2_AskDirectly == true:
Bronislav: "As I said before, just ask Hendricks. I'm pretty sure she'd be willing to help you"
- else:
Bronislav: "Why can't you just ask Hendricks?"

Praveen fidgets nervously as he considers your suggestion.
}

Praveen: "I just don't know, it feels too direct. But maybe if you could ask Hendricks, and just mention that I'd like to help with the conference, she'd be more willing to consider it coming from you."

{BP_S2_AskDirectly == true:

Bronislav: "Why should I ask Hendricks?"

Praveen: "Well, I know Hendricks likes you, or at least respects your opinion. If you were the one to bring it up, she may take it better than if it was coming from me."
}

Praveen: "So, what do you say?"

*["I could do that."  #>> ChangeOpinion Praveen Bronislav ++]
->BP_Socializing2_ICanDoThat

*["Maybe, I'm not sure."]
->BP_Socializing2_MaybeNotSure

*["I think this is something you should handle yourself." #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing2_HandleYourself

=== BP_Socializing2_DoYouHaveAPlan ===
Bronislav: "Do you have a plan right now?"

Praveen: "Well, not really, but I was thinking since it's a bit weird if I just ask her, I was thinking maybe you could put in a good word for me with Hendricks, and maybe mention that I want to help with the conference."

Praveen: "How does this all sound?"

*["I could do that." #>> ChangeOpinion Praveen Bronislav ++]
->BP_Socializing2_ICanDoThat

*["Maybe, I'm not sure."]
->BP_Socializing2_MaybeNotSure

*["I think this is something you should handle yourself." #>> ChangeOpinion Praveen Bronislav -]
->BP_Socializing2_HandleYourself

=== BP_Socializing2_ICanDoThat ===
Bronislav: "I could do that."

Praveen looks absolutely ecstatic.

Praveen: "Thank you, thank you, thank you! You're the best."

Bronislav: "Yeah no problem. I'm going to head out for now, but yeah I can definitely put in a good word for you next time I see Hendricks."

Praveen: "Thank you so much Bronislav, I appreciate it."

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing2")}
->DONE

=== BP_Socializing2_MaybeNotSure ===
Bronislav: "Maybe I can, I'm not so sure that it would be helpful."

Praveen: "Well, could you please at least think about it. I think if you did it would really help me."

Bronislav: "Yeah, I'll think about it more. I'm going to head out for now, but I'll consider it some more before I talk to Hendricks again."

Praveen: "Okay, I would really appreciate the help though, so at least consider it."

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing2")}
->DONE


=== BP_Socializing2_HandleYourself ===
Bronislav: "I seriously think this is something you should handle yourself, Praveen."

Praveen groans and rolls his eyes at you.

Praveen: "Of course you wouldn't be willing to help me. I shouldn't have expected it."

Bronislav: "I think it will go better if you talk to her yourself. I'm going to head out for now, but please at least consider actually asking her to help with the conference."

Praveen: "Sure, whatever, like it will make a difference."

{HideCharacter("Praveen")}
{DbInsert("Seen_BP_Socializing2")}
->DONE
