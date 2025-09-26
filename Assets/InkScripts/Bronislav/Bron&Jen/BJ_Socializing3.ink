=== BJS3_start ===
# ---
# choiceLabel: Grab a coffee
# @query
# Seen_BI_CONF
# date.day!3
# @end
# repeatable: false
# tags: action, cafe, auxiliary
# ===
# Summary: Jensen asks if he's on the paper/updates 

VAR PraveenGossipConfirm = false

~IvyDealAccepted = DbAssert("IvyDealAccepted")

~IvyDealConsidered = DbAssert("IvyDealConsidered")

~IvyDealDenied = DbAssert ("IvyDealDenied") 

~PraveenGossipConfirm = DbAssert("BradPraveenGossip")

// Coffee Shop
// TODO: CONNECT RELATIONSHIP MODIFIERS HERE FOR SCENE STARTS
~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{JenOpinionSocial3 >= OpinionState.Good: -> GoodJensenBeginning} 
{JenOpinionSocial3 >= OpinionState.Neutral && JenOpinionSocial3 < OpinionState.Good: -> NeutralJensenBeginning} 
{JenOpinionSocial3 <= OpinionState.Neutral: -> BadJensenBeginning} 

=GoodJensenBeginning
{IvyDealAccepted: ->BJS3_scenePositive} 
{IvyDealConsidered: -> BJS3_scenePositiveIvy}
{IvyDealDenied: ->BJS3_scenePositiveNo}

=NeutralJensenBeginning
{IvyDealAccepted: -> BJS3_sceneNeutralIvy}
{IvyDealConsidered: -> BJS3_sceneNeutralIvy}
{IvyDealDenied: -> BJS3_sceneNeutralNo} 

=BadJensenBeginning 
{IvyDealAccepted: -> BJS3_sceneNegative} 
{IvyDealConsidered: -> BJS3_sceneNegative} 
{IvyDealDenied: -> BJS3_sceneNegativeNo}
// if positive relationship
    // if accepted ivy's deal
        //->scenePositiveIvy
    // if rejected ivy's deal
        //->scenePositiveIvyNo
    // else (considered ivy's deal)
    //->BJS3_scenePositive
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

=== BJS3_scenePositive ===

It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

"Bronislav!"

You turn your attention over. 

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey!" 

Jensen abruptly sits at your table. 

Jensen: "I heard that my feedback on your presentation got me co-authorship."

*["Keep on hustling." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_KeepOnHustling

*["Here's how you author."]
->BJS3_HeresHowYouAuthor

*["Only doing it for the job." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_OnlyDoingItForTheJob

=== BJS3_scenePositiveIvy ===
It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

"Bronislav!"

You turn your attention over. 

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey Bronislav, how's your paper going?" 

Bronislav: "Oh hey, it's been good." 

Jensen: "Awesome!" 

Jensen: "I hope my feedback is helping the paper come along well."

Jensen: "...And Ivy's been telling me that you're considering me for authorship?" 

*["There's a good chance." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_DoesntFeelRight

=== BJS3_scenePositiveNo ===
It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

"Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey Bronislav, how's your paper going?" 

Bronislav: "Oh hey, it's been good." 

Jensen: "Awesome!"

Jensen: "I just wanted to catch up with you. I heard from Ivy that you don't want me as an author on the paper, but as much as I hope you change your mind, I can understand your position."

*["I'll consider changing." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNeutral ===

It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

"Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey Bronislav, how's your paper going?" 

Bronislav: "Oh hey, it's been good." 

Jensen: "Awesome!"

Jensen: "I heard from Ivy that you're considering putting me on the paper.Thank you so much for the opportunity, I'm just happy I could help."

*["Keep on hustling." #>> ChangeOpinion Jensen Bronislav ++]
->BJS3_KeepOnHustling

*["Here's how you author." #>> ChangeOpinion Jensen Bronislav +++]
->BJS3_HeresHowYouAuthor

*["Only doing it for the job." #>> ChangeOpinion Jensen Bronislav --]
->BJS3_OnlyDoingItForTheJob

=== BJS3_sceneNeutralIvy ===

It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

 "Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey Bronislav, how's your paper going?" 

Bronislav: "Oh hey, it's been good." 

Jensen: "Awesome!"

Jensen: "Hey, Bronislav, I was wondering, am I joining the paper?"

He looks at you with an attempt at puppy-eyes.

*["There's a good chance." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> ChangeOpinion Jensen Bronislav --]

->BJS3_DoesntFeelRight

=== BJS3_sceneNeutralNo ===
It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

 "Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey Bronislav, how's your paper going?" 

Bronislav: "Oh hey, it's been good." 

Jensen: "Awesome!"

Jensen: "I just wanted to catch up with you. I heard from Ivy that you don't want me as an author on the paper, but as much as I hope you change your mind. It would really help me out."


*["I'll consider changing." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNegative ===
It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

 "Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey!!! Bronislav!!" 

You fake an awkward smile and wave, hoping he would go away. 

Instead he abruptly pulls the seat in front of you and sits down at your table.

Jensen: "How's your paper going?" 

Bronislav: "Oh uh hey, yeah it's been good." 

Jensen: "Awesome!"

Jensen: "I know we got off on the wrong foot, but I'm happy that you decided to include me as a co-author on your paper."

*["Keep on hustling." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_KeepOnHustling

*["Here's how you author."]
// Jensen: +Growth Mindset
// Bronislav: +Supportive
->BJS3_HeresHowYouAuthor

*["Only doing it for the job." #>> ChangeOpinion Jensen Bronislav --]
//Jensen: +Ashamed
//Bronislav: +Petty
->BJS3_OnlyDoingItForTheJob

=== BJS3_sceneNegativeNo ===

It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

"Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey!!! Bronislav!!" 

You fake an awkward smile and wave, hoping he would go away. 

Instead he abruptly pulls the seat in front of you and sits down at your table.

Jensen: "How's your paper going?" 

Bronislav: "Oh uh hey, yeah it's been good." 

Jensen: "Awesome!"

Jensen: "I know we got off on the wrong foot, but I know I have and could contribute more to this paper...and yeah the research is already done but I could proof read. Wasn't my feedback good? It helped you on your presentation!"


*["I'll consider changing." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_ConsiderChanging

*["I'm still figuring it out."]

->BJS3_FiguringItOut

*["I've made up my mind." #>> ChangeOpinion Jensen Bronislav --]
// Jensen: + Ashamed
// Bronislav: + Petty
->BJS3_MadeUpMyMind

=== BJS3_sceneNegativeIvy ===

It's time to finally take a break. As you sit down with your coffee, you suddenly hear someone call out to you. 

 "Bronislav!"

You turn your attention over.

{ShowCharacter("Jensen", "left", "")}

Jensen: "Hey!!! Bronislav!!" 

You fake an awkward smile and wave, hoping he would go away. 

Instead he abruptly pulls the seat in front of you and sits down at your table.

Jensen: "How's your paper going?" 

Bronislav: "Oh uh hey, yeah it's been good." 

Jensen: "Awesome!"

Jensen: "I know we got off on the wrong foot, but I know I have and could contribute more to this paper...and yeah the research is already done but I could proof read. Wasn't my feedback good? It helped you on your presentation!"

*["There's a good chance." #>> ChangeOpinion Jensen Bronislav ++]
// Jensen: +Hopeful
// Bronislav: +Bad Advisor
->BJS3_GoodChance

*["It's already done."]

->BJS3_AlreadyDone

*["It doesn't feel right." #>> ChangeOpinion Jensen Bronislav --]

->BJS3_DoesntFeelRight

=== BJS3_KeepOnHustling ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "Keep on hustling Jensen, as long as you put in the work like you have been you'll go far."

Jensen: "Thanks Bronislav! I appreciate it!!" 

Jensen: "Alright I need to run to class, I'll see you later!" 

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}
{JenOpinionSocial3 >= OpinionState.Good: Bronislav: "Yeah! See you later!" } 
{JenOpinionSocial3 >= OpinionState.Neutral && JenOpinionSocial3 < OpinionState.Good: Bronislav: "Ok!" }
{JenOpinionSocial3 <= OpinionState.Neutral: Bronislav: "Sure." } 



*[Shake his hand]
->BJS3_ShakeHandLeave


=== BJS3_HeresHowYouAuthor ===

Bronislav: "While you certainly have some room to grow Jensen, I'd be happy to show you how to author. Let me know some time you are free and we can organize a meeting."

Jensen: "Really?! Oh that would be great!! Thank you!!" 

*[Exchange contact information]

->BJS3_StartWorkingAgain

=== BJS3_OnlyDoingItForTheJob ===
{ShowCharacter("Jensen", "left", "ashamed")}

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{JenOpinionSocial3 >= OpinionState.Good: Bronislav: "Look Jensen, you seem like a nice guy so I'll just tell you. Ivy offered me a job opportunity if I put you as a co-author. I'm putting you on here strictly for that job."} 
{JenOpinionSocial3 >= OpinionState.Neutral && JenOpinionSocial3 < OpinionState.Good: Bronislav: "Look Jensen, you seem like a nice guy so I'll just tell you. Ivy offered me a job opportunity if I put you as a co-author. I'm putting you on here strictly for that job."}
{JenOpinionSocial3 <= OpinionState.Neutral: -> BJS3_notLikeMe } 

Jensen: "Oh...I see." 

Jensen: "Well...it would still help I guess?" 

Jensen: "I'll leave then, bye Bronislav." 

*["Bye."]
->BJS3_GetUpAndLeave

=== BJS3_notLikeMe===

Bronislav: "Look Jensen, Ivy offered me a job opportunity if I put you as a co-author. I'm only doing this for the job." 

Jensen: "Oh...I see. So I'm not working with you?" 

Bronislav: "No, I'm just putting your name down for credit and that's it." 

Jensen: "Ok...gotcha." 

Jensen: "..."

Jensen: "Do you not like me or something? You're really short with me in meetings lately and just...I don't know." 

->notLikeMeChoices

=notLikeMeChoices

*[What is my opinion on Jensen?] ->thoughtExposition
*["Yeah I don't like you." #>> ChangeOpinion Jensen Bronislav ---]->BJS3_jensenSad
*["It's not like that." #>> ChangeOpinion Jensen Bronislav +] -> BJS3_jensenOk

=thoughtExposition 

His aunt has been dangling your visa issues over your head to get you to do this. It's been causing you alot of anxiety and pressure, but is Jensen at fault for this too? He's been nonstop pestering you about it, it's beginning to get to you.

->notLikeMeChoices

=BJS3_jensenSad
 
{DbInsert("Jensen_cry")}
  
Jensen: "Oh..." 

Jensen: "Ok Bronislav." 

You see his eyes turn slightly red from holding back tears. 

Jensen: "I guess I'll leave you alone." 

Jensen: "Bye."

{HideCharacter("Jensen")}

He runs out before you can say anything else 
{DbInsert("Seen_BJS3")}
->DONE 

=BJS3_jensenOk

Bronislav: "No, it's not like that. I'm just really stressed, and sorry for taking it out on you." 

Jensen: "Oh, I understand!" 

Jensen: "Sometimes it feels like people hate me cause they keep talking behind my back and don't think I notice." 

Jensen: "Expecially Brad...he likes spreading rumors about me." 

Jensen: "But it's ok, I'm glad to know you don't hate me." 

Jensen: "Anyways, gotta go. I'll see you later." 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE 

=== BJS3_GoodChance ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "I'd say there's a good chance. I'll let you know if something changes."

His expression turns to excitment.

Jensen: "Wow, thanks Bronislav!"

He shakes your hand wildly.

Jensen: "I appreciate you keeping me in mind at least, let me know if something gets set in stone."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

He leaves spilling a bit of coffee on the way out.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
-> DONE

=== BJS3_AlreadyDone ===
Bronislav: "It's already done Jensen. Sorry but I can't add you to the paper this late into the process."

Jensen: "I gave you feedback at the lab meeting though. It's not like I didn't help at all."

He says then looks down at the table, stirring his coffee.

Jensen: "It technically isn't too late to add me Bronislav."

He smiles at you, then walks away.

Jensen: "I hope you reconsider." 

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_DoesntFeelRight ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "It just doesn't feel right Jensen, does this not feel sketchy to you?"

Jensen doesn't answer immediately, instead looking down at his coffee then taking a sip.

Jensen: "I..."

He pauses.

Jensen: "I just really need to get on that paper Bronislav. Please? I hope to hear from you soon."

He walks away calmly.

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}
{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
-> DONE

=== BJS3_ConsiderChanging ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "You're perseverance is definitely admirable Jensen." 

You take a long pause, and sip your own coffee. 

Bronislav: "I'll consider changing my mind, and keep you updated."

Jensen, taking a sip from his coffee as you say this, coughs for a bit but collects himself.

Jensen: "Really Bronislav? You're the best! I've got to go now but please, keep me updated."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

He gets up and coughs a bit more as he leaves.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_FiguringItOut ===
Bronislav: "It's hard to set things in stone, I'm still figuring it out myself. I'll let you know if anything changes."

Jensen seems a bit disappointed, but happy that you're at least still somewhat considering.

Jensen: "Thanks for letting me know, hope to talk to you again soon Bronislav."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

He gets up and leaves.
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_MadeUpMyMind ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "I've made up my mind Jensen, you're not getting co-authorship."

His gaze goes from disappointment to guilt.

Jensen: "Oh, alright. I was really hoping on getting my name on a paper."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

He weakly picks up his bag and coffee, and slumps out of the cafe.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_StartWorkingAgain ===
You start working on your paper again.

Jensen: "That sounds great! I'll get out of your hair and let you get back to work, but I'll be in contact." 

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

He gets up and leaves, waving goodbye with a smile.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
-> DONE

=== BJS3_YesIncluded ===

Bronislav: "Yes, you will be included."

Jensen's expression shifts to a relieved smile.

Jensen: "Oh, I can't thank you enough."
~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_NoIncluded ===

Bronislav: "No, your feedback wouldn't hold up to review."

His innocent gaze contorts into a naive sadness.

Jensen: "O-Oh, alright. I was really hoping on getting my name on a paper..."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_ShakeHandLeave ===

He shakes your hand with a big smile.

Jensen: "Of course, glad to have a mentor like you Bronislav."

~ temp JenOpinionSocial3 = GetOpinionState("Jensen", "Bronislav")
{PraveenGossipConfirm && JenOpinionSocial3 >= OpinionState.Good: -> BJS3_PraveenClosure}

You grab your coffee and leave.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

=== BJS3_GetUpAndLeave ===

You abruptly get up and leave after telling Jensen this. He looks deeply ashamed hearing it.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
->DONE

===BJS3_PraveenClosure===
Bronislav: "Before you go..." 

Jensen: "Hm?" 

Bronislav: "I heard through the grapevine that Praveen was being mean to you? What's that about?" 

Jensen: "Oh...yeah." 

Jensen: "Well I was showing him something I'm working on and he didn't really give constructive criticism. He just...said everything wrong or weird about my idea. Just...tore into my work." 

Jensen: "I mean I know I gotta take criticism as it comes but...I don't know it didn't feel constructive. Just like all he wanted to do was bring me down." 

Bronislav: "I'm sorry to hear that Praveen, that's not ok. Yes, you should be able to take criticism, but there's a difference between trying to be helpful and just trashing someone." 

Jensen: "Yeah...but it's not that big of a deal. It's fine." 

Bronislav: "Alright, I'll keep a look out to see if he's still doing this. Thanks for confiding in me." 

Jensen: "Of course, thanks for listening!" 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJS3")}
-> DONE 
