EXTERNAL SetPlayerLocation(locationId)
EXTERNAL GetRelationshipStat(a, b, c)
EXTERNAL IncrementRelationshipStat(a, b, stat, value)


VAR speaker = ""

=== start ===
# ---
# ===


-> HendricksOffice 



- 
-> DONE

=== CoffeeShop ===
#---
# choiceLabel: Go to Coffee Shop.
# hidden: true
# tags: location
#===

{SetPlayerLocation("CoffeeShop")}


- -> DONE


=== Lab ===
#---
# choiceLabel: Go to Lab.
# hidden: true
# tags: location
#===

{SetPlayerLocation("Lab")}


- -> DONE

=== Cafeteria ===
#---
# choiceLabel: Go to Cafeteria.
# hidden: true
# tags: location
#===

{SetPlayerLocation("Cafeteria")}


- -> DONE

=== LectureHall ===
#---
# choiceLabel: Go to Lecture Hall.
# hidden: true
# tags: location
#===

{SetPlayerLocation("LectureHall")}


- -> DONE

=== Library ===
#---
# choiceLabel: Go to Library.
# hidden: true
# tags: location
#===

{SetPlayerLocation("Library")}


- -> DONE


=== NedsOffice ===
#---
# choiceLabel: Go to Ned's Office.
# hidden: true
# tags: location
#===

{SetPlayerLocation("NedsOffice")}


- -> DONE

=== HendricksOffice ===
#---
# choiceLabel: Go to Hendrick's Office.
# hidden: true
# tags: location
#===

{SetPlayerLocation("HendricksOffice")}

// {HendricksOffice == 1:
//  -> student_tutorial(-> HendricksOffice)
// }


- -> DONE

=== Outside ===
#---
# choiceLabel: Go to outside walkway.
# hidden: true
# tags: location
#===

{SetPlayerLocation("Outside")}


- -> DONE

=== StudentCubes ===
#---
# choiceLabel: Go to student cubicles.
# hidden: true
# tags: location
#===

{SetPlayerLocation("StudentCubes")}

// {StudentCubes == 1:
//     You walk into the student office space. 
    
//     Each student has their own cube and a nametag. 
    
//     Ivy sits at the desk behind yours. Brad to your left. And Matilda infront of him.

// }


- -> DONE

=== talk_to_ivy_cubicles ===
# ---
# choiceLabel: Talk to Ivy
# @query
# Player.location!StudentCubes
# @end
# hidden: true
# tags: action
# ===

~speaker = "Ivy"

You approach the cube next to yours. The name tag says, "Ivy". Sitting at the desk 

Ivy: Hi. Nice to meet you

-> DONE

=== talk_to_brad_cubicles ===
# ---
# choiceLabel: Talk to Brad
# @query
# Player.location!StudentCubes
# @end
# hidden: true
# tags: action
# ===

~speaker = "Brad"

{talk_to_brad_cubicles == 1:
    Brad is another newer student. He constantly looks anxious and disheveled. He seems to be muttering to himself about something with his head on his desk.
    
    You want to say something, but the two of you haven't hung out much.
}

Brad: Oh hey. Do you need something?

Brad seems tense.

* [Is something wrong?]

~ temp rel = GetRelationshipStat("Brad", "Player", "Friendship")

{
- rel == 0:
    Brad: Don't worry about it.
- rel == 10:
    Brad: I think I messed up.
}

-> DONE

=== talk_to_matilda_cubicles ===
# ---
# choiceLabel: Talk to Matilda
# @query
# Player.location!StudentCubes
# @end
# hidden: true
# tags: action
# ===

~speaker = "Matilda"

Hi. 

-> DONE

=== work_on_relationship_with_brad ===
# ---
# choiceLabel: Work on relationship with Brad
# @query
# Player.location!StudentCubes
# @end
# hidden: true
# tags: action
# ===


Player: Hey Brad. Do you want to ...

+ [Get Coffee?]
    -> get_coffee_with("Brad") ->
+ [Get Food?]
    -> get_food_with("Brad") ->
-

-> DONE


=== get_coffee_with(npc) ===

{npc}: Thanks for inviting me. Its been {a little while|too long|just yesterday} since I took a break

Your relationship with {npc} has improved. {IncrementRelationshipStat(npc, "Player", "Friendship", 10)}

->->


=== get_food_with(npc) ===

{npc}: Thanks for inviting me. Its been {a little while|too long|just yesterday} since I took a break

Your relationship with {npc} has improved. {IncrementRelationshipStat(npc, "Player", "Friendship", 10)}


->->

=== student_tutorial(-> back) ===

You have recently joined the lab as a new graduate student. 

Your advisor, Prof. Hendricks, has called you into their office for a meeting. It sounded important.

Hendricks: Hey! Thanks for being available on short notice.

Hendricks: I wanted to discuss something with you

* [What is it?]
- 

Hendricks: In a recent faculty meeting, the department chair brought up workplace culture and responsible conduct of research.

Hendricks: It seems that there are suspiciouns from the Dean's office that our department might be in trouble.

Hendricks: Now, this could happen to any department. We certainly try our best, but sometimes good decisions conflict with our want to impress, or fears of maintaining relationships.

Hendricks: The reason why I called you in today is because I need your help.

Hendricks: As a new student, you can approach things with a clearer perspective.

Hendricks: ** Some other Text**

Hendricks: Relationships are important

Hendricks: Talking to people in the department can be a challenge. Based on your relationships with other people, they may be more or less willing to open up to you about what's going on.

Hendricks: Also, the more they like you, the more likely they are to assist you with hopefully resolving other problems.

Hendricks: If you find that someone is not as open to speaking with you. I would try working on your relationship with them to build more trust.

Hendricks: Last, but not least, no body is immune from facing these problems. You and me included. But it's important that when we do, we can always to someone else before acting.

Hendricks: You can save a lot of headache that way.

* [So, what should I do now?]
- 

Hendricks: Go talk with your lab mates, Ivy, Matilda, and Brad. They should be at the student cubicles.

-> back