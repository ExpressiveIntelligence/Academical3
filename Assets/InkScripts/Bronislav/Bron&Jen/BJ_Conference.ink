=== BJ_CONF_IncludedStart ===
# ---
# choiceLabel: Talk to Jensen
# @query
# Seen_BJ_INTRO
# @end
# repeatable: false
# tags: action, student_cubes, required
# ===

{ShowCharacter("Jensen", "left", "")}

{DbInsert("Seen_BJ_CONF")}

You find Jensen in the cubicles on the phone with someone so you wait to reveal yourself until he's done with the call.

Jensen: "This will totally get me into grad school now! Thanks so much for your help Ivy."

He pauses while Ivy is speaking presumably.

Jensen: "Alright I'll talk to you later then."

*["Glad to see you so happy."]
->BJ_CONF_GladtoSeeYouHappy

*["Don't make me regret it."]
->BJ_CONF_DontMakeMeRegret

=== BJ_CONF_GladtoSeeYouHappy ===
You walk in after he gets off the call.

Bronislav: "Hey Jensen! Glad to see you so happy."

Jensen: "How could I not be? There's no way they don't let me into grad school with this on my record! Thank you so much again Bronislav.

*["Happy to help."]
->BJ_CONF_HappyToHelp

*["Don't make me regret it."]
->BJ_CONF_DontMakeMeRegret

=== BJ_CONF_HappyToHelp ===
Bronislav: "Happy that I could help you Jensen. Keep it up and I know you'll get into grad school in no time."

Jensen: "You really think so? Wow... I'm so glad I have an advisor like you Bronislav."

{HideCharacter("Jensen")}

->DONE

=== BJ_CONF_DontMakeMeRegret ===
Bronislav: "That's great to hear, but don't make me regret it Jensen."

Jensen: "I promise I won't let you down Bronislav."

He gives you a jokey salute, giggles a bit, then goes back to looking at his laptop."

{HideCharacter("Jensen")}

-> DONE

=== BJ_CONF_UnincludedStart ===
You find Jensen in the cubicles on the phone with someone so you wait to reveal yourself until he's done with the call.

Jensen: "I appreciate the effort Ivy..."

He sighs.

Jensen: "Thanks for everything, I'll talk to you later, maybe..."

*["Are you doing ok?"]
->BJ_CONF_DoingOkay

*["You can't rely on stuff like that."]
->BJ_CONF_CantRelyOnThat


=== BJ_CONF_DoingOkay ===
Bronislav: "Hey Jensen... Are you doing ok?"

Jensen: He rests his chin on his arms, "Could be doing better. Could be doing better..."

*["You can't rely on stuff like that."]
->BJ_CONF_CantRelyOnThat

*["I know you'll succeed."]
->BJ_CONF_KnowYoullSucceed


=== BJ_CONF_CantRelyOnThat ===
Bronislav: "As much as I resepct you Jensen, you can't rely on stuff like that. Grad school needs effort, and determination. You aren't going to get in with handouts."

Jensen: "You're right, you're right. I'll keep trying. Thanks Bronislav."

He sighs and starts working at his computer again.

{HideCharacter("Jensen")}

->DONE

=== BJ_CONF_KnowYoullSucceed ===

Bronislav: "Don't let this get you down Jensen, you're a smart guy. Keep putting in the effort, and you'll go far. A different opportunity should be good for you."

Jensen: "Well Bronislav, I appreciate the kind words. I'll just... get back to work."

He starts typing away at his laptop.

{HideCharacter("Jensen")}

->DONE
