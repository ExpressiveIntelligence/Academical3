=== HP_S1_SceneStart ===
# ---
# choiceLabel: Meet with Praveen
# @query
# Seen_HPS1
# @end
# hidden: true
# tags: action, library, auxiliary
# ===

{DbInsert("Seen_HPS1")}

{ShowCharacter("Praveen", "left", "")}

Shuffling some papers at your desk, you hear a knock at the door.

*["Come in!"]

Hendricks: "Come on in Praveen." 

Right on time Praveen walks through the door giving you a polite nod as you motion for him to have a seat. 

Hendricks: "Hello Praveen, how are you today?" 

Praveen: "I'm doing as good as I can."

*["What's been troubling you?"] -> TroublingYou
*["How is your search for a research paper going?"] -> HowResearchSearch
-->DONE
== TroublingYou ==
Hendricks: "What has been troubling you Praveen?"

Praveen: "Well, I've just been floating around at the moment."

Hendricks: "I see, can you tell me more?"

Praveen: "I feel as if I lack the means of things to do, spending most of my time looking for research and academic projects. Other than when me and Jensen hang out I lack activities to do."

*["Did you seek out clubs or other opportunities for graduate students?" #>> DecrementRelationshipStat Praveen Hendricks Opinion -50] -> SeekOutClubs

*["You are a smart and capable student, would you like some help in finding some clubs or organizaions for graduate students?"#>> IncrementRelationshipStat Praveen Hendricks Opinion 50] -> HelpFindClubs

== HowResearchSearch ==
Hendricks: "I heard you were searching for a research project to work on, how is that going?"

Praveen: "It's been quite troublesome to say the least, finding a paper is one thing, but with reviews and feedback it's a tidious process."

Praveen hangs his head a bit shrugging slightly, as a graduate student he seems used to the stress of the process. 

Hendricks: "Quite understandable, its a long process and needs attention, however, try not to get too caught up in the turmiol, you'll find a paper, your a capable student."

Praveen: "Thank you, even if finding a paper is difficult, the reviews are the next step up making all my hard work seem like it was for nothing, and I know how my work was not for nothing."

*["Try not to stress over the reviews, they are there to help you improve your paper."] -> DontStress

== SeekOutClubs ==
Praveen: "Yes, I have, I feel like I have tried everything. I don't believe I wouldn't be bringing it up if I haven't exhausted all options..."

Preveen sighs in frustration, it seems that he's struggling to find his place.

*["I apologise, and I understand where you are coming from."] -> UnderstandFrustration

== HelpFindClubs ==
Hendricks: "You are a very smart student, Praveen. Would you like me to look into some opportunities for you? With your skills in research, I'm sure I can see what I can do."
 
Praveen gives a small nod seemingly pleased with your answer.

Praveen: "Yes I believe that is a good idea. I appreciate your time. I am quite skilled when it comes to reviewing research papers."

Hendricks: "Yes indeed, I seem to recall some of your work, I will keep that in mind for my search."

Praveen looks up at the clock before checking his phone.

Praveen: "Shoot, I'm supposed to meet up with Jensen for some Coffee. Thank you again Hendricks."

Hendricks: "Of course, Praveen. I will see you at our next meeting!"

{HideCharacter("Praveen")}

-> DONE

== DontStress ==
Praveen: "Yeah, I know."

Praveen shrugs his shoulders leaning back.

Hendricks: "There seems to be something else on your mind?"

Praveen sighs shrugging his shoulders again, it seems to be a trademark of his

*["What's been troubling you?"] -> TroublingYou

== UnderstandFrustration ==
Hendricks: "I understand." 

You feel as if you are to suggest something Praveen will express his attempt, so you decide to take a different approach

Hendricks: "I know how skilled you are in the face of research, how about I look into some opportuinities for you and during our next session I can tell you what I found?" 

Praveen: "Yes I believe that is a good idea. I appreciate your time. I am quite skilled when it comes to reviewing research papers."

Hendricks: "Yes indeed, I seem to recall some of your work, I will keep that in mind for my search."

Praveen looks up at the clock before checking his phone.

Praveen: "Shoot, I'm supposed to meet up with Jensen for some Coffee. Thank you again Hendricks."

Hendricks: "Of course, Praveen. I will see you at our next meeting!"

{HideCharacter("Praveen")}

->DONE