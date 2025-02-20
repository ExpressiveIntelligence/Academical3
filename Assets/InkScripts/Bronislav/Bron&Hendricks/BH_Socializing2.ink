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

// {DbInsert("Seen_BHS2")}

Hendricks lets out a sigh as she sits next to you, surely coming from a boring meeting or a long talk with a student. 

// {ShowCharacter("Hendricks", "left", "")}

She smiles gently as she turns her full attention to you.

Hendricks: "Good to see you, Bronislav, how is the week treating you so far?"

*["I'm exhausted. But at least the paper is ready."]
    Bronislav: "I'm exhausted. But my paper is finally ready to recieve reviews, thankfully."
    
    She makes a face somewhere between a grimace and a smile.
    
    Hendricks: "I understand the feeling. I'm proud of you."

*["I'm thrilled! My paper is ready to recieve reviews!"]
    Bronislav: "I'm thrilled! My paper is finally ready to recieve reviews."
    
    She looks relieved.
    
    Hendricks: "How wonderful. I'm proud of you."

- Hendricks: "Is there anything I can do to help you succeed in this next stage of your research?

*["I could really use some advice on academic expectations."]
    Bronislav: "I could really use some advice on academic expectations."
    
    Hendricks: "I would be happy to advise, are you running into roadblocks on your paper?"
    
    Bronislav: "Not exactly, I am just worried about taking a misstep or missing an opportunity... I feel paralyzed by how many choices I have to make throughout this process, and I don't want to mess up such an important opportunity."
    
    Hendricks: "While that is awfully vague, I can tell you what I know. If you are honest, communicative, and passionate, people will be drawn to your work. I wouldn't worry about perfection."
    
    Hendricks: ""
    
*["Would you be willing to give the paper a formal review?"]
    Bronislav: "Do you know anyone who could provide reviews? The paper is ready for it, and I would appreciate hearing from reviewers who I could trust."
*["Do you know anyone who could provide reviews?"]
Bronislav: "Do you know anyone who could provide reviews? The paper is ready for it, and I would appreciate hearing from reviewers who I could trust."
->BHS2_2

=== BHS2_2 ===

->HideHenAndEnd

/*
Scene summary

Needs reviewers for conference 
Player has choice to suggest Praveen or not

- Tells Bronislav that she needs reviewers for conference
- Can recommend Praveen for paper if previously talked to
- Bronislav tells Hendricks his need for a job

*/


== HideHenAndEnd ==
{HideCharacter("Hendricks")}

->DONE
