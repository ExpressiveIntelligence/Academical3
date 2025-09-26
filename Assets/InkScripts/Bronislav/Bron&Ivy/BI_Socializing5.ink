
#VAR IvyAcceptedOfficial = false 
#VAR IvyDeniedOfficial = false
#VAR SwitchingOpinionsReject = false 
#VAR SwitchingOpinionsAccept = false
=== BI_Socializing5_SceneStart ===
# ---
# choiceLabel: Meet with Ivy
# @query
# BI_Coffee
# date.day!5
# @end
# repeatable: false
# tags: action, cafe, required
#===

// TODO: selection based off of whether Jensen was ever on the paper
// TODO: selection based off of whether or not Jensen is currently on the paper


~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert ("BI_OfficiallyRejected") 

~SwitchingOpinionsReject = DbAssert ("BI_SwitchingOpinions_Reject")

~SwitchingOpinionsAccept = DbAssert ("BI_SwitchingOpinions_Accept")

//currently assumes Jensen was on the paper for both
{ShowCharacter("Ivy", "left", "")}

->BI_Socializing5_Branches

===BI_Socializing5_Branches===

{IvyAcceptedOfficial && not SwitchingOpinionsAccept: -> BI_Socializing5_AlwaysAccepted}
{IvyAcceptedOfficial && SwitchingOpinionsAccept: -> BI_Socializing5_SwitchAccept}
{IvyDeniedOfficial && not SwitchingOpinionsReject: -> BI_Socializing5_AlwaysDenied}
{IvyDeniedOfficial && SwitchingOpinionsReject: -> BI_Socializing5_SwitchDenied} 

===BI_Socializing5_AlwaysAccepted===
// Jensen is on the paper, Bronislav always had him on the paper.
After the great news for Jensen, Ivy said that she wanted to congratulate both of you and offered to meet you at the cafe. When you arrive, you see her sitting at a table with two cups.

*["Is someone else sitting here?"]
->BI_Socializing5_SomeoneSittingHere

*[Sit Down.]
->BI_Socializing5_SitDown

===BI_Socializing5_SwitchAccept===
//Jensen is on the paper, Bronislav had declined to put Jensen on the paper at some point
After the great news for Jensen, Ivy said that she wanted to congratulate both of you and offered to meet you at the cafe. You see her sitting at the table with her coffee.

*["Nice to see you Ivy."]
->BI_Socializing5_NiceToSeeYou

*[Sit down.]
->BI_Socializing5_SitDown2

===BI_Socializing5_AlwaysDenied===

//Jensen is not on the paper, Bronislav never had Jensen on the paper
After the bad news for Jensen, Ivy said that she wanted to meet with you to have a talk. You meet her at the cafe, she looks a bit stressed with a completely empty cup of coffee with its lid off on the table. You see her give you a slight side eye.

*["Sorry about Jensen." #>> ChangeOpinion Ivy Bronislav +]
->BI_Socializing5_SorryAbtJensen

*[Sit down.]
->BI_Socializing5_SitDown3

=== BI_Socializing5_SwitchDenied===
//Jensen is not on the paper, Bronislav had Jensen on the paper at one point.
After the bad news for Jensen, Ivy said that she wanted to meet with you to have a talk. You meet her at the cafe, she looks stressed, with a completely empty cup of coffee with its lid off on the table. You see her give you a slight side eye.

*["Sorry about Jensen." #>> ChangeOpinion Ivy Bronislav +]
->BI_Socializing5_SorryAbtJensen2

*[Sit down.]
->BI_Socializing5_SitDown4


=== BI_Socializing5_SomeoneSittingHere ===
Bronislav: "Hey Ivy, is someone else sitting here?" You say as you point to the cup.

Ivy: "I thought I'd buy your coffee for you because of the great news! So glad to hear Jensen is on the paper."

*["I'm excited."]
->BI_Socializing5_ImExcited

*["Thanks Ivy."]
->BI_Socializing5_ThanksIvy

=== BI_Socializing5_SitDown ===
You sit down at the table and catch Ivy's attention.

Bronislav: "Hey Bronislav, glad you could make it. I got that coffee for you to celebrate the good news."

*["Thanks Ivy."]
->BI_Socializing5_ThanksIvy

*[Take a relieved sip.]
->BI_Socializing5_TakeARelievedSip

=== BI_Socializing5_ImExcited ===
Bronislav: "I'm really excited, feels rare that everyone gets what they want."

Ivy: "You can say that again. Seeing Jensen so happy is a relief, feels like a big weight is taken off of his shoulders."

*["I'd feel the same." #>>ChangeOpinion Ivy Bronislav ++++]
->BI_Socializing5_IdFeelTheSame

*[Take a relieved sip.]
->BI_Socializing5_TakeARelievedSip

=== BI_Socializing5_ThanksIvy ===
Bronislav: "Thanks Ivy, for the coffee and the great opportunity with your uncle."

Ivy: "Don't mention it, none of this could have happened without you Bronislav. Just happy to help where I can."

*["So what now?"]
->BI_Socializing5_SoWhatNow

*[Take a relieved sip.]
->BI_Socializing5_TakeARelievedSip

=== BI_Socializing5_TakeARelievedSip ===
Taking a sip of the coffee you finally feel relaxed for the first time in a while. Ivy's happy, Jensen is happy, and you won't have to stress about what you're going to do once you're out of school.

Ivy: "Sorry if this all felt so spurred on you Bronislav. I just really wanted to see Jensen get into a program, and thought this would be the perfect opportunity."

*["No Problem."]
->BI_Socializing5_NoProblem

*["Not a big deal."]
->BI_Socializing5_NotABigDeal

=== BI_Socializing5_IdFeelTheSame ===
Bronislav: "When I was trying to get into a PhD program I had that same feeling, just glad it's all over now and we can just focus on the paper."

Ivy: "Seriously, even if it isn't guaranteed Jensen's CV will look so much better."

Ivy: "Well I wish you two the best of luck on the paper, just happy to check in with you now that it's all set in stone. I've got to head out, but I'm sure we'll talk again."

*["Glad we could meet."]
->BI_Socializing5_GladWeCouldMeet

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye

=== BI_Socializing5_SoWhatNow ===
Bronislav: "So, what's next Ivy?"

Ivy takes a deep breath.

Ivy: "Well, I'll talk with my uncle and get back to you on how that's going."


Ivy: "I've got to head out now, glad we could do a little check in. Just make sure this stays between us three, and everything will go smoothly."

*["Will do."]
->BI_Socializing5_WillDo

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye

=== BI_Socializing5_NoProblem ===
Bronislav: "It's not a problem at all Ivy, you just wanted to make sure to take the opportunity when it presented itself. That's very respectable."

Ivy: "Good to know that you understand." 

Bronislav: "I've got somewhere to be, but glad to catch up with you so soon. I'll keep in contact with you and Jensen."

*["Glad we could meet."]
->BI_Socializing5_GladWeCouldMeet

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye

=== BI_Socializing5_NotABigDeal ===
Bronislav: "It's not a big deal. It did catch me off-guard initially but it's all good now that everything's figured out."

Bronislav: "Yeah, just had to take the opportunity when it presented itself."

Ivy: "Speaking of brief opportunities, I've got to head out now. Thanks for meeting on such short notice. I'll be in touch."

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye

=== BI_Socializing5_GladWeCouldMeet ===
Bronislav: "I'll see you later Ivy. Glad we could meet again."

She packs up, and waves goodbye.

Ivy: "I'm sure we'll see each other again soon."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WillDo ===
Bronislav: "I'll make sure that it just stays between us."

Ivy: "Good to hear."

She gives a wave goodbye as she leaves the cafe.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WaveGoodbye ===
You wave Ivy goodbye.

She does the same, and leaves the cafe.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_NiceToSeeYou ===
You take the other chair at the table, and sit down.

Bronislav: "Nice to see you Ivy!"

Ivy: "Nice to see you too. Heard the great news and just wanted to meet up with you to congratulate the both of you."

*["I'm excited."]
->BI_Socializing5_ImExcited2

*["Thanks Ivy."]
->BI_Socializing5_ThanksIvy2

=== BI_Socializing5_SitDown2 ===
You sit down at the table, and exchange a smile with Ivy.

Ivy: "Good to have you here on such short notice Bronislav. Just wanted to talk with you in person about the great news."

*["Thanks Ivy."]
->BI_Socializing5_ThanksIvy2

*["Any new news?"]
->BI_Socializing5_AnyNewNews


=== BI_Socializing5_ImExcited2 ===
Bronislav: "I'm really excited, feels rare that everyone gets what they want."

Ivy: "You can say that again. I know Jensen and I were a bit stressed when you said no before, but we were both relieved to know you changed your mind."

*["I'd feel the same."]
->BI_Socializing5_IdFeelTheSame2

*["I was just concerned."]
->BI_Socializing5_JustConcerned

=== BI_Socializing5_ThanksIvy2 ===
Bronislav: "Thanks Ivy. Glad to have this opportunity with Jensen and with your uncle."

Ivy: "Don't mention it. Just happy to help where I can, and get everyone pushed in the right direction."

*["So what now?"]
->BI_Socializing5_SoWhatNow2

*["Classic Ivy." #>> ChangeOpinion Ivy Bronislav -]
->BI_Socializing5_ClassicIvy

=== BI_Socializing5_AnyNewNews ===
Bronislav: "Of course, is there any new news?"

Ivy thinks for a second.

Ivy: "Well, no. Since you were a bit indecisive I held off of telling my uncle, but now that things are set in stone I for sure can now."


Ivy: "I know it was all spur of the moment, but I just wanted to make sure that Jensen would be able to secure this opportunity."

*["I'd feel the same."]
->BI_Socializing5_IdFeelTheSame2

*["Not a big deal."]
->BI_Socializing5_NotABigDeal2

*["I was just concerned."]
->BI_Socializing5_JustConcerned

=== BI_Socializing5_IdFeelTheSame2 ===
Bronislav: "Yeah, being in the position Jensen was in at one point, I'd feel the same. Sorry about all that."

Ivy: "Well it's all behind us now. Even if it isn't guaranteed that Jensen will get into a PhD program, this will look great on his CV."

Ivy: "Well I wish you two the best of luck on the paper, just happy to check in with you now that things are finally set in stone. I've got to head out, but I know we'll talk again."

*["Glad we could meet."]
->BI_Socializing5_GladWeCouldMeet2

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye2

=== BI_Socializing5_JustConcerned ===
Bronislav: "I mean, you've got to understand where I was coming from right Ivy? It just seemed risky."

She rolls her eyes.

Ivy: "It's not that big of a deal. Just keep it between us and everything will go smoothly. Everyone gets what they wanted right?"

Ivy: "Well, I've got to run. I'm excited to see how the paper will go, I'll talk to you later Bronislav."

*["Talk to you later."]
->BI_Socializing5_TalkToYouLater

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye2

=== BI_Socializing5_SoWhatNow2 ===
Bronislav: "So what now Ivy?"

Ivy takes a deep breath.

Ivy: "Well, I'll see when I can talk with my uncle and get back to you on how that's going."

Ivy: "I've got to head out now, glad we could do a little check in. I'll get back to you when I get back to you."

*["Talk to you later."]
->BI_Socializing5_TalkToYouLater

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye2

=== BI_Socializing5_ClassicIvy ===
Bronislav: "Classic Ivy." 

Ivy gives you a side-eye and fakely laughs with you.

Ivy: "Yeah. Classic Ivy."

Ivy: "I've got to head out Bronislav. I'll see you again soon. Bye."

*[Wave goodbye.]
->BI_Socializing5_WaveHerGoodbye2

=== BI_Socializing5_NotABigDeal2 ===
Bronislav: "It's not a big deal. It did catch me off-guard initially but it's all good now that everything's figured out."

Ivy: "Yeah, just had to take the opportunity when it presented itself."

Ivy: "Speaking of brief opportunities, I've got to head out now. Thanks for meeting on such short notice. I'll be in touch."

*[Wave goodbye.]
->BI_Socializing5_WaveHerGoodbye2

=== BI_Socializing5_GladWeCouldMeet2 ===
Bronislav: "I'll see you later Ivy. Glad we could meet again."

She packs up, and waves goodbye.

Ivy: "I'm sure we'll see each other again soon."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WaveGoodbye2 ===
You wave Ivy goodbye.

She does the same, and leaves the cafe.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WaveHerGoodbye2 ===
You attempt to wave Ivy goodbye, but she walks out seeming not to notice your wave goodbye.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_TalkToYouLater ===
Bronislav: "Yep, talk to you later Ivy."

You both exchange waves goodbye.

Ivy: "I'll be in touch."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_SorryAbtJensen ===
Bronislav: "Hey Ivy, sorry about the Jensen. How's he doing?"

Ivy lets out a grunt at you saying this.

Ivy: "Not great.. not great. I've had to start finding our backup plan for Jensen, so I'm definitely a bit overwhelmed."

*["Wish I could help."]
->BI_Socializing5_WishICouldHelp

*["Jensen should do that."]
->BI_Socializing5_JensenShouldDoThat

*["Change your approach."]
->BI_Socializing5_ChangeYourApproach

=== BI_Socializing5_SitDown3 ===
You sit down at the table silently, and this clearly irks Ivy.

She half-heartedly smiles.

Ivy: "Nice to see you Bronislav. I know it might be a forgone conclusion, but..."

She pauses.

*["I'm sorry I couldn't..."]
->BI_Socializing5_IJustCant

*["You can't push me like this" #>>ChangeOpinion Ivy Bronislav ---]
->BI_Socializing5_ItsNotHappening

=== BI_Socializing5_WishICouldHelp ===
Bronislav: "I wish I could help more Ivy, but he didn't do anything that would give him authorship."

Ivy: "I know. He's just really struggling to get into a PhD program, and that's always been a dream for him. It'd be so sad to see him make it this far and not get in."

*["Sorry Ivy."]
->BI_Socializing5_SorryIvy

*["I've made my decision."]
->BI_Socializing5_IveMadeMyDecision

*["You can't push me like this" #>>ChangeOpinion Ivy Bronislav ---]
->BI_Socializing5_ItsNotHappening

=== BI_Socializing5_JensenShouldDoThat ===
Bronislav: "Ivy you really should have Jensen do that. He really needs to learn how to take up tasks for himself."

Ivy: "I know, it's just never a bad thing to help family. Especially someone who really needs the help, because his future is really on the line."

*["I've made my decision."]
->BI_Socializing5_IveMadeMyDecision

*["You can't push me like this" #>>ChangeOpinion Ivy Bronislav ---]
->BI_Socializing5_ItsNotHappening

=== BI_Socializing5_ChangeYourApproach ===
Bronislav: "You should change your approach then. Not something that could get everyone in serious trouble."


She rolls her eyes.

Ivy: "Yeah I'll think about that Bronislav. Nothing wrong with helping a student with resources at my disposal."

*["Just being honest."]
->BI_Socializing5_JustBeingHonest

*["Even if something bad happens?" #>>ChangeOpinion Ivy Bronislav -]
->BI_Socializing5_EvenIfSomethingBad

=== BI_Socializing5_IJustCant ===
Bronislav: "I'm sorry I couldn't do it. I just can't have Jensen on the paper."

Ivy: "Mhm... just wish that Jensen had an easier time getting into a program, this really could have helped him."

*["I've made my decision."]
->BI_Socializing5_IveMadeMyDecision

*["You can't push me like this" #>>ChangeOpinion Ivy Bronislav ---]
->BI_Socializing5_ItsNotHappening

=== BI_Socializing5_ItsNotHappening ===
Bronislav: "You can't push me around like this and expect me to do unethical practices for your family. You're not getting my help in the future, no matter how many times you ask or dangle a job in front of me."

Ivy: "Fine Bronislav, have it your way. We'll both get out of your hair and figure something else out. Thanks a ton."

She glares at you, fuming.

Ivy: "I've got to go. Bye."

She quickly storms out of the cafe, slamming the door catching the attention of everyone.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

== BI_Socializing5_SorryIvy ===
Bronislav: "I'm sorry Ivy, I've really tried to help as much as I can. I just couldn't risk it."

She groans.

Bronislav: "That's... you know that's fair Bronislav. Such a shame though, you know? Real shame."

Ivy: "Glad we could meet up so soon, I've got somewhere to be, though. I'll catch you later."

*["Glad we could meet."]
->BI_Socializing5_GladWeCouldMeet3

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye3

=== BI_Socializing5_IveMadeMyDecision ===
Bronislav: "I've made my decision, and it's too late to go back on it."

Ivy shrugs and lets out a tiredly disappointed sigh.

Ivy: "At least you stuck by your word, I'll give you that. Gives Jensen something to learn from this experience."

Bronislav: "I've got to head out now Bronislav. I'll catch up with you again later."

*["Talk to you later."]
->BI_Socializing5_TalkToYouLater

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye3

=== BI_Socializing5_JustBeingHonest ===
Bronislav: "I'm just being honest Ivy. You should know that people aren't going to entertain anything quid pro quo adjacent."

Ivy: "You're making it way bigger of a deal than it is. Should just be as simple as students helping students."

Ivy: "I've got somewhere to be soon. See you when I see you."

*["Talk to you later."]
->BI_Socializing5_TalkToYouLater

*[Wave goodbye.]
->BI_Socializing5_WaveGoodbye3

=== BI_Socializing5_EvenIfSomethingBad ===
Bronislav: "Even if something bad happens? Are you willing to risk your own reputation for him too?"

She looks at you confused.

Ivy: "Do you think I haven't considered that? Of course I've thought about that, and I still did it.

She takes a deep breath, controlling her temper.

Ivy: "Whatever Bronislav. I'm leaving. Bye."

*[Wave goodbye.]
->BI_Socializing5_WaveHerGoodbye3

=== BI_Socializing5_GladWeCouldMeet3 ===
Bronislav: "I'll see you later Ivy. Glad we could meet again."

She packs up, and waves goodbye.

Ivy: "I'm sure we'll see each other again soon."

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WaveGoodbye3 ===
You wave Ivy goodbye.

She does the same, and leaves the cafe.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_WaveHerGoodbye3 ===
You attempt to wave Ivy goodbye, but she walks out seeming not to notice your wave goodbye.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_SorryAbtJensen2 ===
Bronislav: "Hey Ivy, I'm really sorry about Jensen. I just changed my mind, it didn't feel right."

Ivy: "Didn't feel right? Jensen felt like he finally would have a good chance of getting into a PhD program, and you really just pulled the rug out from both of us. I expected better from you Bronislav."

*["I just couldn't."]
->BI_Socializing5_IJustCant4

*["I expected better from you."]
->BI_Socializing5_IExpectedBetter

=== BI_Socializing5_SitDown4 ===
You sit down at the table silently. This clearly irks Ivy.

Ivy: "Well? We're not going to talk about it Bronislav? You really betrayed mine and Jensen's trust."

*["Sorry Ivy."]
->BI_Socializing5_SorryIvy4

*["I expected better from you." #>>ChangeOpinion Ivy Bronislav --]
->BI_Socializing5_IExpectedBetter

=== BI_Socializing5_IJustCant4 ===
Bronislav: "I just couldn't Ivy. I couldn't have Jensen on the paper."

Ivy: "Mhm... just wish that Jensen had an easier time getting into a PhD program, this really could have helped him."

*["I've made my decision." #>>ChangeOpinion Ivy Bronislav -]
->BI_Socializing5_IveMadeMyDecision4


=== BI_Socializing5_IExpectedBetter ===
Bronislav: "I expected better from you Ivy. I didn't think you'd do something like this, you're putting everyone's reputation on the line and you know it."

She scoffs.

Ivy: "Yet you still accepted at one point, so you understood where I was coming from then. It's sad to see Jensen learn nothing from all of this, I thought you'd be a good mentor. But I guess I expected too much from you."

She packs up her things quickly, and storms out of the cafe. Slamming the door behind her, catching the attention of everyone briefly.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_SorryIvy4 ===
Bronislav: "I'm sorry Ivy, I've really tried to help as much as I can. I just can't risk it."

Ivy: "Helped as much as you can. Can't risk it anymore. What a shame, Jensen was really relying on you Bronislav. We both were."


Ivy: "Now I'm sorry because I've got to be... somewhere else. Bye."

You attempt to wave Ivy goodbye, but she walks out seeming not to notice your wave goodbye.

{HideCharacter("Ivy")}
{DbInsert("Seen_BI_Socializing5")}
->DONE

=== BI_Socializing5_IveMadeMyDecision4 ===
Bronislav: "I've made my decision, and I'm going to stick by it."

Ivy: "That's a first. Sorry we couldn't come to an agreement to meet your strandards. Sad to see someone like Jensen struggle this much to get into a PhD program."


Ivy: "Well Bronislav. I'm going to head out now, I've got somewhere else to be."

You attempt to wave Ivy goodbye, but she walks out seeming not to notice your wave goodbye.

{HideCharacter("Ivy")}
->DONE
