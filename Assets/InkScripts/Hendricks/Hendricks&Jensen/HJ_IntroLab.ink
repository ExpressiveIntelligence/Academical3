VAR startPassthrough = false
VAR convoOptions = 0
VAR haveDifficult = false
VAR researchLook = false

=== HJ_INTRO_sceneStart ===
# ---
# choiceLabel: Start meeting with Jensen.
# repeatable: false
# hidden: true
# tags: action, hendricks_office, required
# ===

{DbInsert("Seen_HJINTRO")}

{startPassthrough == false :

As you sit down at your desk, you notice Jensen wandering through the library. It's been a while since you've seen him, and he notices you, so you wave as he walks over.

Hendricks: "Hi Jensen, how are things?"

{ShowCharacter("Jensen", "left", "")}

Jensen: "Things have been alright, definitely could be better though."
~ startPassthrough = true
}
{convoOptions == 3:

Jensen looks to his watch, and his eyes widen as he realizes the time.

Jensen: "Oh wow, is it really that late? Sorry Professor, I gotta run, otherwise I'm going to miss my only chance to grab lunch."

He looks to you apologetically.

*["Alright, good seeing you."]
Hendricks: "Alright, good seeing you Jensen."

Jensen smiles and nods as he turns to leave.

{HideCharacter("Jensen")}

->DONE

*["Take care."]
Hendricks: "Take care Jensen."

Jensen smiles and nodes as he turns to leave.

{HideCharacter("Jensen")}

->DONE

}

*["Do you have difficult classes this quarter?"]
~ convoOptions += 1
//{convoOptions}
->difficultClasses

*["Have you thought any more about grad school?"]
~ convoOptions += 1
//{convoOptions}
->gradSchool

*["Have you had any luck with finding any research to get involved with?"]
~ convoOptions += 1
//{convoOptions}
->researchInvolvement

=== difficultClasses ===
~ haveDifficult = true
Hendricks: "Do you have difficult classes this quarter?"

Jensen: "Fortunately I don't have any tough classes this time around. That's honestly probably about the only thing keeping me afloat right now."

Hendricks: "I see..."

->HJ_INTRO_sceneStart

=== gradSchool ===
{haveDifficult == true:
    Hendricks: "Well, since you have a lighter load this quarter h<>
~ haveDifficult = false
- else:
    Hendricks: "H<>
}

<>ave you thought any more about grad school? I know you mentioned that before the last time we talked."

Jensen lets out a sharp sigh.

{researchLook == true:
    Jensen: "Yeah that's the main reason I need the research in the first place. It's really tough because <>
- else:
    Jensen: "I have. <>
}

I actually just finished talking with Praveen about this too and his experience is making me doubt my chances to say the least."

*["What has Praveen been experiencing?"]
Hendricks: "What has Praveen been experiencing, Jensen?"

Jensen: "He's been talking about how he can't really find a research paper to work on. He's been telling me how cut throat it can all be, especially when it comes to working with other people and getting reviews."

Jensen shakes his head as he lets out a laugh.

Jensen: "He said reviews are especially the thing to watch out for, because they are so harsh. Praveen said they scrutinize over every little detail. I don't know Professor, I just am not sure if I am cut out for all of this."

->consoleOptions


*["You shouldn't worry about someone else's experience."]
Hendricks: "You really shouldn't worry about someone else's experience, Jensen. I know you and Praveen are friends, but just because he's having a bad experience doesn't necessarily mean you will."

Jensen: "I know, Professor, but he's been talking about how he can't really find a research paper to work on. He's been telling me how cut throat it can all be, especially when it comes to working with other people and getting reviews."

Jensen shakes his head as he lets out a laugh.

Jensen: "He said reviews are especially the thing to watch out for, because they are so harsh. Praveen said they scrutinize over every little detail. I don't know Professor, I just am not sure if I am cut out for all of this."

->consoleOptions

=== consoleOptions ===

*["Of course you are."  #>> IncrementRelationshipStat Jensen Hendricks Opinion 50]
Hendricks: "Of course you are cut out for grad school. Self doubt would be what's holding you back there."

Jensen: "That and a thousand hurdles."

Hendricks: "If it was easy, everyone would go to grad school. But just beacuse something is difficult doesn't make it out of reach."

Jensen: "Maybe... yeah I guess you're right."

->HJ_INTRO_sceneStart

*["You don't have to do it if you don't want to." #>> DecrementRelationshipStat Jensen Hendricks Opinion -20]
Hendricks: "You know Jensen, you don't have to go to grad school if you don't want to."

Jensen: "Are you saying I shouldn't?"

Hendricks: "No, but I am saying its not the only path to succuess. Plenty of other people take different routes and you have to actually do what's best for you."

Jensen: "Well, grad school is what's best for me professor, whether you agree or not."

->HJ_INTRO_sceneStart

=== researchInvolvement ===
~ researchLook = true
Hendricks: "I remember you talking about wanting to get involved with some research to help bolster your resume. Have you had any luck with that?"

Jensen: "Not yet, although there is some research that I am giving feedback on that will hopefully help me get on the paper."

Hendricks: "Oh? Who's research would that be?"

Jensen: "This guy named Bronislav, actually. I met him through a mutual friend."

// TODO: FLAG THAT PLAYER IS AWARE OF BRONISLAV'S RESEARCH

*["Bronislav? I'm surprised."]
Hendricks:"Bronislav? Now there's a name I was not expecting."

Jensen: "Is that a good thing or bad?"

Hendricks: "Neither. He's very reserved though, and can be fairly protective of his work, so I am surprised he would be letting someone new on. That said, I think it would be great for you to work with him if he wants that type of collaboration."

Jensen: "Okay cool. I'll definitely be figuring it out and I'll let you know how it goes."

Hendricks: "Yeah, I actually didn't know that he was working on a paper, I'll have to ask him more about that."

->HJ_INTRO_sceneStart

*["Could be a good place to start."]
Hendricks: "Huh, could be a good place to start."

Jensen: "What do you mean?"

Hendricks: "Well, Bronislav has a tendency to be very reserved, and can be fairly protective of his work, so I am a little surprised he would be letting someone new onto one of his papers. That said, I think it would be great for you to work with him if he wants that type of collaboration."

Jensen: "Noted. I'll definitely be figuring it out and I'll let you know how it goes."

Hendricks: "Yeah, I actually didn't know that he was working on a paper, I'll have to ask him more about that."
->HJ_INTRO_sceneStart

->DONE
