
VAR BP_Suggestion = false
VAR BP_S2_Pretentious = false
VAR BP_S2_AskDirectly = false

=== BP_Socializing2_SceneStart ===
#---
# choiceLabel: Talk with Praveen.
# hidden: true
# tags: action, student_cubes, auxiliary
# repeatable: false
#===

// Summary: Praveen spills his evil plan



{DbInsert("Seen_BP_EvilPlan")}

As you begin to head out, you overhear Praveen talking with another student.

{ShowCharacter("Praveen", "left", "")}

Praveen: "...and you know, now I'm peer reviewing his work." 

Praveen: "It's honestly pretty garbage. He starts at one point and then jumps between twenty different topics before hardly returning to his original point. Such a long paper to say nothing at all." 

Praveen: "But he did make a couple good points in some sections. I wasn't planning on giving a good review, so maybe I could take those points and write my own paper." 

Praveen: "But yeah it's overall going well. How about you? How's your work going?..." 

You walk away before listening to the rest of the conversation 
->DONE
