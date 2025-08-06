// Author: Ivy Dudzik
=== BHS3_sceneStart ===
# ---
# choiceLabel: Find Hendricks in the Library
# @query
# Seen_BHS2
# date.day!3
# @end
# tags: action, library, auxiliary
# repeatable: false
# ===

{DbInsert("Seen_BHS3")}

{ShowCharacter("Hendricks", "left", "")}

You take a seat across from Hendricks, eyeing a meticulously organized stack of books next to her. The largest of the books lies open on the table in front of her, and she is lost in thought.


*[Clear your throat.]
Bronislav: "Ahem."
*["Hello professor."]
Bronislav: "Hello professor."

- Hendricks: "Bronislav!"

She turns to you smiling.

Hendricks: "I didn't see you there, take a seat! How are you doing? You seem... introspective. Did something happen?"

*["I'm fine, how are things with you?"]->BHS3_ImFine

*["Ivy offered to get me a job... if I add Jensen to my paper."]->BHS3_IvyOfferedMeJob


== BHS3_IvyOfferedMeJob ==
    Bronislav: "Ivy offered to help me get a job... but her support is conditional upon Jensen being credited on my paper."
    
    Hendricks: "Oh, wow. How do you feel about that?"
    
    *["It seems like a fair deal."]
        Bronislav: "It seems like a fair deal. Jensen gets the credit he needs for grad school and I get a sponsor for my visa."
        
        Hendricks: "I don't know if you should be so comfortable with this arrangement, Bronislav. I don't think its ethical to trade favors like this in an academic context."
        
        **["Why not?"]->BHS3_WhyNot
    *["It feels wrong, right?"]
        Bronislav: "It feels wrong, right? Ivy has been really focused on the fact that I need someone to sponsor my visa, and it has really been stressing me out. I know I could really use what she's offering, but I am not sure that its the right thing to do."
        
        Hendricks: "I think you are right. It feels like a breach of ethics to me that Ivy even put you in such a position."
        
        **["How do you mean?"]
            Bronislav: "How do you mean?"
            
            ->BHS3_HowDoYouMeanISee
    *["I don't know..."]
        Bronislav: "I don't know... I really could use the help she's offering, since I am definitely in need of a sponsor for my visa, and she is offering something that could really help me."
    
        Hendricks: "This doesn't seem right to me. I don't think its ethical to trade favors like this in an academic context."
        **["Why not?"]->BHS3_WhyNot
== BHS3_WhyNot ==
Bronislav: "Why not?"

Hendricks: "It brings bias into your work that undermines its integrity. What Ivy is offering sounds like "quid pro quo", which is essentially trading one favor for another. Its a slippery slope of conflicting interests.

*["I see."]
Bronislav: I see...

->BHS3_HowDoYouMeanISee

== BHS3_HowDoYouMeanISee ==
Hendricks: "For instance, would you have ever considered putting Jensen on your paper if not for this offer? Last time we spoke, you were frustrated with his feedback."

*["Of course I wouldn't have considered it."]
    Bronislav: "Of course I wouldn't have considered it."
*["He's not so bad..."]
    Bronislav: "He's not so bad..."

-She sighs.

Hendricks: "This really is a problematic situation. I am going to let you decide how you want to handle it, but please let me know if I can help."

Bronislav: "Thank you Hendricks, I always appreciate your insight."

Hendricks: "It's odd... this isn't the only strange thing I've seen happen around a paper lately. Something must be in the air..."

*["What do you mean?"]
    Bronislav: "What do you mean?"

-Hendricks: "To speak candidly, something is not quite... adding up with Brad and his research. At least, according to what I've heard from Ned. Neither of us can quite put our finger on the problem, though."

She seems to consider asking your opinion, but holds her tongue.

*["Brad is a good guy."]
    Bronislav: "Brad is a good guy."

    She nods in appreciation. 
    
    Hendricks: "I'm sure he is. Hopefully Ned is overthinking things."
    **["Should I let you get back to your book?"]
*["Should I let you get back to your book?"]

-Bronislav: "Should I let you get back to your book?"

She laughs gently. 

Hendricks: "Sure. Thank you for sharing about your situation with Ivy, I hope you can navigate it without too much stress. Make sure you are honoring your principles."

Bronislav: "Of course. Thank you for the advice. I hope the situation with Brad works out well."

->BHS3_HideHenAndEnd

== BHS3_ImFine ==
Bronislav: "I'm fine, how are things with you?"

Hendricks: "Ned and I have been collaborating on supervising Brad and his research. It's been...  uneventful."

She seems to be telling half the truth, put off by your curtness.

*["I hope things continue going well."]
    Bronislav: "I hope things continue going well."

    Her face softens slightly.
    
    Hendricks: "Me too. Thank you Bronislav. There's really nothing bothering you?"
    
    **["Ivy offered to get me a job... if I add Jensen to my paper."]->BHS3_IvyOfferedMeJob
    **["No, I just wanted to say hello."]
    Bronislav: "No, I just wanted to say hello."
        Hendricks: "Well, it was good to see you! I should probably get back to my reading. It was just getting good."

   She smiles and waves as you take your leave.
    
    ->BHS3_HideHenAndEnd
    
*["Sorry for interrupting your study session."]
    Hendricks: "It's no problem. It was good to see you! Have a good day."
    
    ->BHS3_HideHenAndEnd
== BHS3_HideHenAndEnd ==
{HideCharacter("Hendricks")}

->DONE
