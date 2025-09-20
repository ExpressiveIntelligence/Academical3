/*

Hendricks Socializing 4
=======================

Location: Hendrick's Office
Day: 4
Is Required: No

In this optional scene, the player (Bronislav) expresses to their advisor,
Hendricks that they are not worried about adding Jensen to the paper. This
scene is intended to check if players understand the ethical reasons why
gift authorship is problematic.

This scene contains a moderate amount of exposition. Players can skip past
it if they already know about it, but they will need to demonstrate that to
Hendricks first. If they both explain it AND do the wrong thing, they are
DOUBLE in the wrong and will lose major opinion points with Hendricks.

*/

// This is a placeholder variable
VAR hendricksOpinion = 0
VAR BHS4_tension = 0
VAR ignoredHendricksDay1 = false
VAR ignoredHendricksDay3 = false

=== BH_S4_Start ===
# ===
# choiceLabel: Meet with Hendricks about paper with Jensen
# hidden: true
# @query
# BI_OfficiallyAccepted
# date.day!4
# @end
# tags: action, hendricks_office, auxiliary
# ---

~ignoredHendricksDay1 = DbAssert("BHS1_ignored")
~ignoredHendricksDay3 = DbAssert("BHS3_ignored")

You knock Hendricks' office door.

Hendricks: "Come on in."

You step into the office and sit down across from her.

{ShowCharacter("Hendricks", "left", "")}

// This first choice sets up the tension of the scene
// You can go in trying to defuse the tension or you can
// add to it by being stand-off-ish
* [Sit down without saying anything]
    You sit down silently.

    ~ BHS4_tension += 1

* [Ask how she is doing]
    Bronislav: "Hey Hendricks. How is your day going?"

    Hendricks: "I'm fine"

// Below is a roleplaying option that goes against what we
// know about Bron's personality. It's a false option that
// never succeeds.
* [Try cracking a joke]
    -> BH_S4_CrackJoke ->
-

Hendricks: "You know why I called you in to meet today, right?"

* ["I'm not sure"]
    ~ hendricksOpinion = hendricksOpinion - 5

    Hendricks: "I called you in to talk about this authorship deal that you and Ivy have arranged. I recieved a report from a student who overheard your conversation this afternoon."
    
    {ignoredHendricksDay1 && ignoredHendricksDay3: Hendricks: "Is this why you have been avoiding me?"} 

    Hendricks: "Are you aware that this is wrong?"

    ** [Sit silently]
        ~ BHS4_tension = BHS4_tension + 1

        Hendricks looks at you with a stern expression. You can feel the tension rising.
        
         {ignoredHendricksDay1 && ignoredHendricksDay3: Hendricks: "Is this why you have been avoiding me?"} 

        Hendricks: "Bronislav, I want you to listen to me carefully."

        -> BH_S4_ExplainConsequences ->

    ** ["No."]
        ~ hendricksOpinion = hendricksOpinion - 5

        Bronislav: "No."
        
         {ignoredHendricksDay1 && ignoredHendricksDay3: Hendricks: "Is this why you have been avoiding me?"} 

        Hendricks: "Bronislav, I want you to listen to me carefully."

        -> BH_S4_ExplainConsequences ->

    ** ["Why is it such a big deal?"]

        Bronislav: "Why is it such a big deal? I'm just helping a student?"

        Bronislav: "People get their names on papers all the time without contributing anything."

        -> BH_S4_ExplainConsequences ->

        Bronislav: "The way I see it, a publication is a publication. Plus this will help me get a job anyway"

        ~ hendricksOpinion = hendricksOpinion - 5

    ** ["I guess ..."]

        Bronislav: "I guess"
        
        {ignoredHendricksDay1 && ignoredHendricksDay3: Hendricks: "Is this why you have been avoiding me?"} 

        Hendricks closes her eyes and take an slow deepth breath.

        Hendricks: "It is."

        -> BH_S4_ExplainConsequences ->

* ["It's about the authorship situation"]

    Bronislav: "It's about the authorship situation"

    Hendricks: "It is."
    
      {ignoredHendricksDay1 && ignoredHendricksDay3: Hendricks: "Is this why you have been avoiding me?"} 

    ->BH_S4_ExplainConsequences->

-

-> BH_S4_DeliverUltimatum ->

Hendricks: "You can leave."

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS3")}
-> DONE


=== BH_S4_ExplainConsequences ===

Hendricks: "You could get in serious trouble for this."

Hendricks: "Allegations of unethical practices will make it much harder for you to continue an academic career."

Hendricks: "People remember these things, and the last person they would want to hire is someone who is a liability and brings bad press."

->->

=== BH_S4_DeliverUltimatum ===

Hendricks: "You need to think seriously about if you want to continue down this road"

Hendricks: "Usually, I'm hands-off, and allow my students to learn on their own. However, I won't have my reputation tarnished by your actions."

Hendricks: "Handle this situation with Ivy, or I will."

->->


// The knot below handles the joke mechanic. Jokes have some percent chance
// of helping the tension, but will mostly faile since Bron is not a
// comedic character.
=== BH_S4_CrackJoke ===

~ temp dice_roll = RANDOM(1, 6)

{
    - dice_roll < 2:
        You say a little joke you've heard your dad tell when going into awkward conversations.

        Hendricks gives you an annoyed look with a small smile.

        Things feel a little less tense.

        ~ BHS4_tension = BHS4_tension - 1

    - else:
        You try to come up with a funny openning, but {~you can't think of anything. | your nerves are too high. | Hendricks doesn't look like she's in the mood | this probably isn't the right time | your words come out as a jumbled mess. }

        The tension in the room seems to have gotten higher.

        ~ BHS4_tension = BHS4_tension + 2
}

->->

/*

Personal Notes
==============

- State the starting point(s) and their conditions.
- State the storytelling goal(s).
- State the potential ending points, their conditions, and their effects.
- State any mechanics the player navigates in the scene. For example,
  this scene is designed to be a tense interaction between Bron and
  Hendricks. So, they have choice options to raise and lower the tension
  between the characters.
- Writing in spread sheets limits the dynamism of the initial text because
  its hard to represent things like the joke dice roll above


*/
