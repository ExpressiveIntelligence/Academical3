@ -1,103 +0,0 @@
// Author: Ivy Dudzik
=== BHS2_sceneStart ===
# ---
# choiceLabel: Meet with Hendricks.
# @query
# Seen_BHS1
# date.day!2
# @end
# tags: action, library, auxiliary
# repeatable: false
# ===



{ShowCharacter("Hendricks", "left", "")}

You approach Hendricks, and she smiles gently as she turns her full attention to you.

Hendricks: "Hello Bronislav! Good to see you, how is the week treating you so far?"

*["I'm exhausted. But at least the paper is ready."]
    Bronislav: "I'm exhausted. But my paper is finally ready for feedback, thankfully."
    
    Hendricks: "I understand the feeling. I'm proud of you."

*["I'm thrilled! My paper is ready for feedback!"]
    Bronislav: "I'm thrilled! My paper is finally ready for feedback."
    
    She looks relieved.
    
    Hendricks: "How wonderful. I'm proud of you."

- ->BHS2_WhatCanIDo

== BHS2_WhatCanIDo ==
Hendricks: "Is there anything I can do to help you succeed in this next stage of your research?

*["I could really use some advice on academic expectations."]
    Bronislav: "I could really use some advice on academic expectations."
    
    Hendricks: "I would be happy to advise, are you running into roadblocks on your paper?"
    
    Bronislav: "Not exactly, I am just worried about taking a misstep or missing an opportunity... I feel paralyzed by how many choices I have to make throughout this process, and I don't want to mess up such an important opportunity."
    
    Hendricks: "While that is awfully vague, I can tell you what I know. If you are honest, communicative, and passionate, people will be drawn to your work. I wouldn't worry about perfection."
    
    Hendricks: "Trust yourself. Now, besides that..."
->BHS2_WhatCanIDo
    
*["Would you be willing to give the paper feedback?"]
    Bronislav: "Would you be willing to give my paper feedback? I trust your judgement and would be very grateful."
    
    Hendricks: "I would be more than happy to! If you send over your draft I'd be happy to take a look."
    
    Bronislav: "Thank you!"

// Should this be conditional upon whether we have been introduced to Praveen?
// Should she introduce Praveen or refer to him as a mutually known person?
- Hendricks: "By the way, I spoke with your friend Praveen. He seemed to be interested in peer reviewing some work, so I gave him that opportunity."
*["That's great!"]
    Bronislav: "That's great!"
*["Do you think he will have good feedback?"]
    Bronislav: "Do you think he will have good feedback?"

- Hendricks: "Yeah, I think he will have great feedback."

Bronislav: "Me too! I'm happy for him."

// Add mention that hendricks needs reviewers for conference
// Add mention that Bronislav needs a job

The professor checks her phone and frowns slightly.

Hendricks: "Sorry for the brief chat, but I have to make a meeting."

*["Thank you again!"]
    Bronislav: "Thank you again!"
    She nods, gathers her things, and strides to the door.

- ->HideHenAndEnd

== HideHenAndEnd ==
{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS2")}
->DONE
