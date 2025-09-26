@ -1,181 +0,2 @@

=== BJ_CONF_IncludedStart ===
# ---
# choiceLabel: Talk to Jensen
# @query
# Seen_BJ_INTRO
# date.day!5
# @end
# repeatable: false
# tags: action, student_cubes, required
# ===
# Summary: You find Jensen at the conference and learn his feelings considering the outcome of the situation. 

{ShowCharacter("Jensen", "left", "")}




~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

~SwitchingOpinionsReject = DbAssert("BI_SwitchingOpinions_Reject")

~SwitchingOpinionsAccept = DbAssert("BI_SwitchingOpinions_Accept")

~BlowUp = DbAssert ("BI_Blowup")

{IvyAcceptedOfficial: -> JensenDealAccepted} 
{IvyDeniedOfficial: -> JensenDealDenied} 
{BlowUp: -> JensenIgnore} 

===JensenIgnore===

You wave at Jensen and make eye contact. 

~ temp jensenOpinion = GetOpinionState("Jensen", "Bronislav")
{jensenOpinion >= OpinionState.Good: -> goodBlowUp} 
{jensenOpinion >= OpinionState.Neutral && jensenOpinion < OpinionState.Good: -> goodBlowUp} 
{jensenOpinion < OpinionState.Neutral: -> badBlowUp} 

=goodBlowUp
Jensen: "Hey." 

Bronislav: "Hey, how's the conference going?" 

Jensen: "Fine...I guess." 

Bronislav: "Is something wrong?" 

Jensen: "Yeah something's wrong! You were so mean to my aunt the other day, I can't believe you." 

Bronislav: "Jensen, I was just defending myse-" 

Jensen: "I don't want to hear it. You've been so nice to me and all of the sudden you embarass my family memeber by accusing her of doing something so awful." 

*["Jensen please listen to me." #>> ChangeOpinion Ivy Bronislav ----] 

Jensen: "Leave me alone." 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
->DONE

=badBlowUp

Bronislav: "Hey." 

Jensen: "Get away from me. I know what you said to my aunt, accusing her of something so awful." 

Bronislav: "Woah hey, I know Ivy and I got into a heated conversation but-" 

Jensen: "I don't want to hear it." 

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
->DONE

===JensenDealAccepted===

You find Jensen on the phone with someone so you wait until he's done with the call.

Jensen: "This will totally get me into a PhD program now! Thanks so much for your help Ivy."

He pauses while Ivy is speaking presumably.

Jensen: "Alright I'll talk to you later then."

*["Glad to see you so happy."]
->BJ_CONF_GladtoSeeYouHappy

*["Don't make me regret it."]
->BJ_CONF_DontMakeMeRegret

=== BJ_CONF_GladtoSeeYouHappy ===
You walk in after he gets off the call.

Bronislav: "Hey Jensen! Glad to see you so happy."

Jensen: "How could I not be? There's no way they don't let me into the program now with this on my record! Thank you so much again Bronislav."

*["Happy to help."]
->BJ_CONF_HappyToHelp

*["Don't make me regret it."]
->BJ_CONF_DontMakeMeRegret

=== BJ_CONF_HappyToHelp ===
Bronislav: "Happy that I could help you Jensen. Keep it up and I know you'll get in."

Jensen: "You really think so? Wow... I'm so glad I have an advisor like you Bronislav."

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
->DONE

=== BJ_CONF_DontMakeMeRegret ===
Bronislav: "That's great to hear, but don't make me regret it Jensen."

Jensen: "I promise I won't let you down Bronislav."

He gives you a jokey salute, giggles a bit, then goes back to looking at his laptop.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
-> DONE

=== JensenDealDenied ===
You find Jensen on the phone with someone so you wait to reveal yourself until he's done with the call.

Jensen: "I appreciate the effort Ivy..."

He sighs.

Jensen: "Thanks for everything, I'll talk to you later, maybe..."

*["Are you doing ok?"]
->BJ_CONF_DoingOkay

*["You can't rely on stuff like that."]
->BJ_CONF_CantRelyOnThat


=== BJ_CONF_DoingOkay ===
Bronislav: "Hey Jensen... Are you doing ok?"

He rests his chin on his arms

Jensen: "Could be doing better. Could be doing better. I'm just...I don't know. Disappointed that it didn't work out."

*["You can't rely on stuff like that."]
->BJ_CONF_CantRelyOnThat

*["I know you'll succeed."]
->BJ_CONF_KnowYoullSucceed


=== BJ_CONF_CantRelyOnThat ===
Bronislav: "As much as I resepct you Jensen, you can't rely on stuff like that. Grad school needs effort, and determination. You aren't going to get in with handouts."

Jensen: "You're right, you're right. I'll keep trying. Thanks Bronislav."

He sighs and walks away.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
->DONE

=== BJ_CONF_KnowYoullSucceed ===

Bronislav: "Don't let this get you down Jensen, you're a smart guy. Keep putting in the effort, and you'll go far. A different opportunity should be good for you."

Jensen: "Well Bronislav, I appreciate the kind words. I'll just... get back to work."

He sighs and walks away.

{HideCharacter("Jensen")}
{DbInsert("Seen_BJ_CONF")}
->DONE

