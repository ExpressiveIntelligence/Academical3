=== start ===
#---
#===
-> student_cubes

=== student_cubes ===
#---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
#===
-> SceneStart

=== SceneStart ===
# SetBackground lab
Jensen: "Bronislav was it? Nice to meet you, my name is Jensen." 

He extends his hand for you to shake.

*["Nice to meet you too Jensen." Shake his hand.]
->ShakeHand

=== ShakeHand ===
Jensen smiles. 

Jensen: "Likewise. I just wanted to talk to you about your presentation and some feedback I had for it." 

He pulls out a small notebook.

*["Oh, fantastic." Pull out your own notebook.]
->Notebook

=== Notebook ===
Jensen: "I did like how you presented your information for the first half, but got really confused about halfway through. I also thought that you could have presented your evidence better, and had a stronger conclusion." 

He looks at you expectingly.

*["Yes, of course." #>> IncrementRelationshipStat Jensen Bronislav Opinion 50]
// Jensen: +Hopeful
// Bronislav: +Supportive

->WriteDown

*["Could you tell me a little more?"]
// Jensen: +Growth Mindset
// Bronislav: +Supportive
->MoreInfo

*["This has to be your first time at a meeting like this isn't it."#>> DecrRelationshipStat Jensen Bronislav Opinion -50]
// Jensen: +Ashamed
// Bronislav: +Petty

->FirstTime

=== WriteDown ===
{ShowCharacter("Jensen", "left", "hopeful")}
Bronislav: "Yes, of course. Thanks for letting me know." 

You write down his feedback in your notebook. He smiles happily, and walks off.

->DONE

=== MoreInfo ===
Bronislav: "Could you tell me a little more about what did confuse you, and how I could present my evidence better?"

->DONE

=== FirstTime ===
{ShowCharacter("Jensen", "left", "ashamed")}
Bronislav: "This has to be your first time at a meeting like this isn't it?" 

You put the pen and notebook back away. Jensen turns away ashamed by you mocking his input.

->DONE

-> DONE