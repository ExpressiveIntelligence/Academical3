=== day1 ===

# ---
# ===

Welcome to the world of Academical!


{ShowCharacter("Bronislav", "right", "")}
This is you! Your name is Bronislav. 
You are a PhD student in the final stretch of their dissertation. You are trying to finish out a final round of publications while maintaining your relationships with professors and peers in the Psychology department at your university.
The stresses of your degree are getting to you - your Visa ends soon, and you need to find a job that will provide one shortly after graduation. You also need a few more peer-reviewed conference publications to demonstrate the quality of your dissertation.
You are just starting a new quarter, and a major conference is coming up soon. Students and Faculty alike are rushing around trying to get their work submitted on time.
Your job is to navigate through conversations and meetings with characters in the department throughout the upcoming term. The world of research can be confusing and morally fraught - you should do your best to stay out of trouble while being kind to others.

{HideCharacter("Bronislav")}

Do you need a quick tutorial on how to play before we get started?

*[Yes please!] 
    ->Tutorial

*[I know how to play.]
    ->Day1_Continue

=== Tutorial ===

Great! Academical is straightforward to play. We'll go over the interface first.
The top of the screen has a row of buttons to help you manage your time in this world.
The <i><b>"Pause"</b></i> button lets you change settings and take a break from the story.
The <i><b>"Save"</b></i> button lets you save your progress so you can return at a later time.
The <i><b>"History"</b></i> button shows a history of past dialogue you've encountered in the story.
The <i><b>"Characters"</b></i> button shows information about each character as well as your current relationship status with them.
The <i><b>"Dilemmas"</b></i> button shows what moral and relationship issues have arisen.
The <i><b>"Agenda"</b></i> button shows what key events are planned for the upcoming term.
You will navigate through the term by having conversations with various characters throughout the Psychology department. You will act from Bronislav's perspective, and make choices for how he will respond.
Characters will be at various locations across campus during gameplay. The <i><b>"Choose Location"</i></b> button on the lower-right side of the screen allows you to go to various locations. Areas of interest will be represented with exclamation and question mark icons.
Once in a location, the <i><b>"Choose Action"</i></b> button on the bottom-left will allow you to choose a specific character to interact with at a given location.
Certain options may positively or negatively impact your relationship with a character. These impacts will be shown when you attempt to make a dialogue decision. Depending on how you treat characters, interactions with them might change later on in the game!

Did you get all of that?

*[Yup, let's play!]
    ->Day1_Continue

+[I need to hear it again.]
    ->Tutorial

=== Day1_Continue ===

Excellent! We'll start our story in the lecture hall of the Psychology department.

{SetPlayerLocation("lecture_hall")}
{ShowCharacter("Bronislav", "right", "")}

It's the start of a new term - and you've (<i>mostly</i>) finished work on research that you aim to submit to a conference at the end of the term.

Your department has agreed to watch a presentation of your work so that you can get feedback before your final submission.

-> DONE