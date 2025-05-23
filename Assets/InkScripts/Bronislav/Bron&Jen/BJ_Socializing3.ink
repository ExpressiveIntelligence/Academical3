=== BJS3_start ===
# ---
# choiceLabel: Talk to Jensen
# @query
# Seen_BJ_CONF
# date.day!3
# @end
# repeatable: false
# tags: action, cafe, auxiliary
# ===
# Summary: Jensen asks if he's on the paper/updates 

{ShowCharacter("Jensen", "left", "")}

{DbInsert("Seen_BJS3")}

// Coffee Shop
// TODO: CONNECT RELATIONSHIP MODIFIERS HERE FOR SCENE STARTS
// if positive relationship
    // if accepted ivy's deal
        //->scenePositiveIvy
    // if rejected ivy's deal
        //->scenePositiveIvyNo
    // else (considered ivy's deal)
    ->BJS3_scenePositive
// if neutral relationship
    // if accepted ivy's deal
        //->sceneNeutralIvy
    // if rejected ivy's deal
        //->sceneNeutralIvyNo
    // else (considered ivy's deal)
    //->sceneNeutral
// if negative relationship
    // if accepted ivy's deal
        //sceneNegativeIvy
     // if rejected ivy's deal
        //->sceneNegativeIvyNo
    // else (considered ivy's deal)
    //->sceneNegative

{HideCharacter("Jensen")}

-> DONE

=== BJS3_scenePositive ===

Jensen: "Bronislav!"

Jensen says as he walks up to you.

Jensen: "I've heard that my feedback on your presentation got me co-authorship."

*["Keep on hustling." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_KeepOnHustling

*["Here's how you author."]
// Jensen: + Growth Mindset
// Bronsilav: + Supportive
->BJS3_HeresHowYouAuthor

*["Only doing it for the job." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_OnlyDoingItForTheJob

=== BJS3_scenePositiveIvy ===
Jensen sits down at your table quietly, then eventually speaks up with a smile,

Jensen: "I hope my feedback is helping the paper come along well."

*["There's a good chance." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_DoesntFeelRight

=== BJS3_scenePositiveNo ===
Jensen sits down at your table, and smiles.

Jensen: "Hey Bronislav, I just wanted to catch up with you. As much as I hope you change your mind on my inclusion on the paper, I can understand your position."

*["I'll consider changing." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNeutral ===

Jensen walks up to you happily.

Jensen: "Thank you so much for the advice and opportunity for co-authorship Bronislav. Happy I could help."

*["Keep on hustling."]
->BJS3_KeepOnHustling

*["Here's how you author."]
->BJS3_HeresHowYouAuthor

*["Only doing it for the job."]
->BJS3_OnlyDoingItForTheJob

=== BJS3_sceneNeutralIvy ===

Jensen: "Hey, Bronislav, I was wondering, am I joining the paper?"

He looks at you with an attempt at puppy-eyes.

*["There's a good chance." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]

->BJS3_DoesntFeelRight

=== BJS3_sceneNeutralNo ===


*["I'll consider changing." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNegative ===
Jensen sits down across the table from you, setting down his coffee and smiling.

Jensen: "Hey Bronislav, I know we got off on the wrong foot, but I'm happy that you decided to include me as a co-author on your paper."

*["Keep on hustling." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_KeepOnHustling

*["Here's how you author."]
// Jensen: +Growth Mindset
// Bronislav: +Supportive
->BJS3_HeresHowYouAuthor

*["Only doing it for the job." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
//Jensen: +Ashamed
//Bronislav: +Petty
->BJS3_OnlyDoingItForTheJob

=== BJS3_sceneNegativeNo ===


*["I'll consider changing." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNegativeIvy ===

*["There's a good chance." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> DecrRelationshipStat Jensen Bronislav Opinion -50]

->BJS3_DoesntFeelRight

=== BJS3_KeepOnHustling ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "Keep on hustling Jensen, as long as you put in the work like you have been you'll go far."

*[Shake his hand and leave.]
->BJS3_ShakeHandLeave

=== BJS3_HeresHowYouAuthor ===

Bronislav: "While you certainly have some room to grow Jensen, I'd be happy to show you how to author. Let me know some time you are free and we can organize a meeting."


*["Start working on your paper again."]

->BJS3_StartWorkingAgain

=== BJS3_OnlyDoingItForTheJob ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "Look Jensen, you seem like a nice guy so I'll just tell you. Ivy offered me a job opportunity if I put you as a co-author. I'm putting you on here strictly for that job."

*[Get up and leave.]
->BJS3_GetUpAndLeave

=== BJS3_GoodChance ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "I'd say there's a good chance. I'll let you know if something changes."
His expression turns to excitment.

Jensen: "Wow, thanks Bronislav!"

He shakes your hand wildly.

Jensen: "I appreciate you keeping me in mind at least, let me know if something gets set in stone."

He leaves spilling a bit of coffee on the way out.

{HideCharacter("Jensen")}

-> DONE

=== BJS3_AlreadyDone ===
Bronislav: "It's already done Jensen. Sorry but I can't add you to the paper this late into the process."

Jensen: "I gave you feedback at the lab meeting though. It's not like I didn't help at all."

He says then looks down at the table, stirring his coffee.

Jensen: "It technically isn't too late to add me Bronislav."

He smiles at you, then walks away.

Jensen: "I hope you reconsider." 

{HideCharacter("Jensen")}

->DONE

=== BJS3_DoesntFeelRight ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "It just doesn't feel right Jensen, does this not feel sketchy to you?"

Jensen doesn't answer immediately, instead looking down at his coffee then taking a sip.

Jensen: "I..."

He pauses.

Jensen: "I just really need to get on that paper Bronislav. Please? I hope to hear from you soon."

He walks away calmly.

{HideCharacter("Jensen")}

-> DONE

=== BJS3_ConsiderChanging ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "You're perseverance is definitely admirable Jensen." 

You take a long pause, and sip your own coffee. 

Bronislav: "I'll consider changing my mind, and keep you updated."

Jensen, taking a sip from his coffee as you say this, coughs for a bit but collects himself.

Jensen: "Really Bronislav? You're the best! I've got to go now but please, keep me updated."

He gets up and coughs a bit more as he leaves.

{HideCharacter("Jensen")}

->DONE

=== BJS3_FiguringItOut ===
Bronislav: "It's hard to set things in stone, I'm still figuring it out myself. I'll let you know if anything changes."

Jensen seems a bit disappointed, but happy that you're at least still somewhat considering.

Jensen: "Thanks for letting me know, hope to talk to you again soon Bronislav."

He gets up and leaves.

->DONE

=== BJS3_MadeUpMyMind ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "I've made up my mind Jensen, you're not getting co-authorship and that's final."

His innocent gaze contorts into disappointment, and guilt.

Jensen: "Oh, alright. I was really hoping on getting my name on a paper."

He weakly picks up his bag and coffee, and slumps out of the cafe.

{HideCharacter("Jensen")}

->DONE

=== BJS3_StartWorkingAgain ===
You start working on your paper again.

Jensen: "That sounds great! I'll get out of your hair and let you get back to work, but I'll be in contact." 

He gets up and leaves, waving goodbye with a smile.

{HideCharacter("Jensen")}

-> DONE

=== BJS3_YesIncluded ===

Bronislav: "Yes, you will be included."

Jensen's expression shifts to a relieved smile.

Jensen: "Oh, I can't thank you enough."

{HideCharacter("Jensen")}

->DONE

=== BJS3_NoIncluded ===

Bronislav: "No, your feedback wouldn't hold up to review."

His innocent gaze contorts into a naive sadness.

Jensen: "O-Oh, alright. I was really hoping on getting my name on a paper..."

{HideCharacter("Jensen")}

->DONE

=== BJS3_ShakeHandLeave ===

He shakes your hand with a big smile.

Jensen: "Of course, glad to have a mentor like you Bronislav."

You grab your coffee and leave.

{HideCharacter("Jensen")}

->DONE

=== BJS3_GetUpAndLeave ===

You abruptly get up and leave after telling Jensen this. He looks deeply ashamed hearing it.

{HideCharacter("Jensen")}

->DONE
