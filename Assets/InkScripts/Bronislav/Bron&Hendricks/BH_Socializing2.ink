// Author: Ivy Dudzik
=== BHS2_sceneStart ===
# ---
# choiceLabel: Meet with Hendricks.
# @query
# Seen_BHS1
# @end
# tags: action, library, auxiliary
# repeatable: false
# ===

{DbInsert("Seen_BHS2")}

Hendricks lets out a sigh as she sits next to you, surely coming from a boring meeting or a long talk with a student. 

{ShowCharacter("Hendricks", "left", "")}

She smiles gently as she turns her full attention to you.

Hendricks: "Good to see you, Bronislav, how is the week treating you so far?"

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
    
    Hendricks: "I would be more than happy to, but I worry that I might not be able to provide you an unbiased perspective. Maybe another one of my students could be a better fit?"
    
    Bronislav: "That would be wonderful! Do you have anyone in mind?"
    
*["Do you know anyone who could provide some feedback?"]
    Bronislav: "Do you know anyone who could provide feedback? The paper is ready for it, and I would appreciate hearing from reviewers who I could trust."
    
    Hendricks: "Absolutely! I have some students who would love the opportunity to offer their experience and insight on a paper like yours."
    
    Bronislav: "Wonderful! Do you have someone in mind?"

// Should this be conditional upon whether we have been introduced to Praveen?
// Should she introduce Praveen or refer to him as a mutually known person?
- Hendricks: "Yes! I have a student named Praveen who has an interest in the exact topic you are studying, and he has been looking for papers to pitch in on."
*["Convenient."]
    Bronislav: "Convenient."
*["That's great!"]
    Bronislav: "That's great!"
*["Do you think he will have good feedback?"]
    Bronislav: "Do you think he will have good feedback?"

- Hendricks: "I think he will have great feedback. I'll send him your information so he can reach out to you in the next couple days."

Bronislav: "Thank you so much."

// Add mention that hendricks needs reviewers for conference
// Add mention that Bronislav needs a job

The professor checks her phone and frowns slightly.

Hendricks: "Sorry for the brief chat, but I have to make a meeting."

*["Thank you again!"]
    Bronislav: "Thank you again!"
    She nods, gathers her things, and strides to the door.
    
*["Good luck!"]
    Bronislav: "Good luck!"
    
    She smiles as she gathers her things
    
    Hendricks: "Thank you, Bronislav."
    
    And she turns decisively and strides to the door

- ->HideHenAndEnd

== HideHenAndEnd ==
{HideCharacter("Hendricks")}

->DONE
