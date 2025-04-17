=== library ===

// TODO: QUERY ABOUT WHETHER OR NOT BRONISLAV TOOK THE DEAL

#---
#choiceLabel: Peruse library.
#@query
# date.day!5
#@end.
#repeatable: false
#tags: action, library
#===

=== BH_Socializing6_SceneStart ===
// current default is took the deal
Today has been going incredibly well, and the excitement of your upcoming job came with a sense of accomplishment. 
{ShowCharacter(Hendricks)}
Lost in thought, you notice Hendricks out of the corner of your eye.

*["Hello, Hendricks!"]
->BH_Socializing6_HelloHen

// TODO: switch based off of taking Ivy's deal
//To clear your head, you decide to pass through the library. During your stroll, you notice Professor Hendricks sitting reading a book and decided to approach her to ask for advice.
//*["Hi, Professor Hendricks."]
//->BH_Socializing6_HiHen

=== BH_Socializing6_HelloHen ===
Bronislav: "Hello, Hendricks, how are you today?"

Hendricks closes her book and looks over to you with her usual smile.

Hendircks: "Oh, hello, Bronislav. I'm doing well. How about you?"

*["Really well."]
->BH_Socializing6_ReallyWell

*["I have some exciting news!"]
->BH_Socializing6_ExcitingNews

=== BH_Socializing6_ReallyWell ===
Bronislav: "I'm doing really well!"

Hendricks: "It seems that way. Tell me about it."

You take a seat across from Hendricks, beaming with excitement.

Bronislav: "Remember how Ivy offered me a job opportunity with her Uncle?"

Hendricks: "Yes, I recall."

*[Tell Hendricks about taking Ivy's deal. #>> IncrementRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_TellHendricks

*[Don't tell Hendricks.]
->BH_Socializing6_DontTellHendricks

=== BH_Socializing6_ExcitingNews ===
Bronislav: "I have some exciting news!"

Hendricks: "Do you? Have a seat, I'm all ears."

You take a seat across from Hendricks.

*[Tell Hendricks about taking Ivy's deal. #>> IncrementRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_TellHendricks

*[Don't tell Hendricks. #>> DecrRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_DontTellHendricks

=== BH_Socializing6_TellHendricks ===
Bronislav: "Well, I decided to work with Ivy and take up the job offer."

Hendricks shifts in her seat. 

Hendricks: "Really? How is that going?"

Bronislav: "I considered your words from last we chatted, and decided this was the best course of action."

Hendricks: "Does this include what Ivy gets out of this deal?"

*["I get the feeling you don't agree with me."]
->BH_Socializing6_IGetTheFeeling

*[Dodge the question. #>> DecrRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_DontTellHendricks

=== BH_Socializing6_DontTellHendricks ===
Bronislav: "Well, I worked things out with Ivy, and everything worked out for the best."

Hendricks: "Ah, I see. well, I'm glad it all worked out. That reminds me; I had to work things out with Praveen. Things took a turn for the worse; I had to remove him from the review process."

*[I'm guessing things didn't turn out well?]
->BH_Socializing6_DidntTurnOut

=== BH_Socializing6_IGetTheFeeling ===
Bronislav: "I get the feeling that you do not agree with me on this decision."

Hendricks sighs, thinking for a moment.

Hendricks: "As I have told you in the past, quid pro quo exchanges in academics are highly discouraged. I fear you may feel the consequences."

*["I need this job."]
->BH_Socializing6_NeedThisJob

*["I believe it'll work out."]
->BH_Socializing6_ItllWorkOut

*["I'll think about it."]
->BH_Socializing6_IllThinkAbtIt

=== BH_Socializing6_DidntTurnOut ===
Bronislav: "I'm guessing things didn't turn out well in the end?"

Hendricks: "Unfortunately not. I had wished whatever paper nonsense was going on would cease. However, we unfortunately need to teach better ethical practices. In any case, is there anything else going on you wish to discuss with me, Bronislav?"

*["Nope, thats it."]
->BH_Socializing6_ThatsIt

=== BH_Socializing6_NeedThisJob ===
Bronsialv: "I need this job, though; without it, I have nothing."

Hendricks sighs once more.

Hendricks: "I understand that. I am here if you require any assistance of any sort. You also have your counselor to go to for such questions."

Bronislav: "Thank you, and I appreciate that, however, I have made my decision."

Hendricks: "Alright, I won't pry further, but I just want you to be aware there may be consequences. I fear it may go astray."

Bronislav: "I appreciate your concern. Thank you. I have to go get an assignment done. I'll see you later, Hendricks."

You stand up and leave while Hendricks wears a solom contemplative expression as she opens her book and continues reading. 

{HideCharacter("Hendricks")}
->DONE

=== BH_Socializing6_ItllWorkOut ===
Bronislav: "I believe things will work out."

Hendrick's face drops.

Hendricks: "Alright then. I recently had to remove Praveen from editorial work, It was quite disappointing. I just hope the same fate doesn't befall you."

Bronislav: "Oh wow, I wish things went better for him. I appreciate the concern, but I can handle it. Oh, I gotta head out to finish an assignment. I'll see you later, Professor Hendricks."

{HideCharacter("Hendricks")}
->DONE

=== BH_Socializing6_IllThinkAbtIt ===
Bronislav: "I'll give it some thought."

Hendricks: "I appreciate that, thank you."

Bronislav: "Oh shoot, I gotta go get an assingment done. Thanks again, Hendricks."

As you walk off you notice a solom expression on Hendricks face as she goes back to her book.

{HideCharacter("Hendricks")}
->DONE

=== BH_Socializing6_ThatsIt ===
Bronislav: "Nope, thats all. I just wanted to check in."

Hendricks: "Wonderful. I enjoy our talks, and I'm always here if you need anything."

Bronislav: "Thanks for listening. Enjoy your book."

You take a stand before waving, watching as Hendricks opens her book with a contemplative expression residing on her face. 

{HideCharacter("Hendricks")}
->DONE

=== BH_Socializing6_HiHen ===
Bronislav: "Hi there, Professor Hendricks. How are you doing today?"

Hendricks looks up from her book, taking notice of you.

Hendricks: "Oh, hello there, Bronislav. I'm doing wonderful; how about you?"

Bronislav: "I was actually wondering if you could possibly help me out."

Hendricks: "Of course, have a seat. I'm all ears."

*[Confide in Hendricks. #>>IncrementRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_ConfideinHen

*[Leave.]
->BH_Socializing6_Leave

=== BH_Socializing6_ConfideinHen ===
You take a seat across from Hendricks, folding your hands in your lap.

Bronislav: "Well actually, I took your advice and decided not to go forward with Ivy's proposal. It didn't seem right, and I don't wanna go that route."

Hendricks gives a soft smile.

Hendricks: "That was a tough decision. I'm proud of you, Bronislav; you made a good call."

*["Thank you."]
->BH_Socializing6_ThankYou

=== BH_Socializing6_Leave ===
Bronislav: "Actually, sorry, I just realized I have someplace to be. I just wanted to stop by and say hello again."

Hendricks: "No problem, Bronislav. I'm here if you need anything."

Bronislav: "Thank you. I'll see you around, Professor."

{HideCharacter("Hendricks")}
->DONE

=== BH_Socializing6_ThankYou ===
Bronislav: "Thank you."

Hendricks: "I think we need to put more stress into good ethical practices."

Hendricks pinches the bridge of her nose.

Bronislav: "Did something happen?"

Hendricks: "Yes, actually, I unfortunately had to take Praveen off paper editing. I wouldn't say I'm not disappointed, I thought he'd know better. It is quite unfortunate."

*["Glad I didnt end up in that boat."]
->BH_Socializing6_GladIDidntEndUp

*["Oh wow."]
->BH_Socializing6_OhWow

=== BH_Socializing6_GladIDidntEndUp ===
Bronislav: "Glad I didn't end up in that boat."

Hendricks: "Indeed, you made the right call."

*["I just worry about my friendship with Ivy." #>>IncrementRelationshipStat Hendricks Bronislav 5]
->BH_Socializing6_IJustWorryAboutMyFriendship

=== BH_Socializing6_OhWow ===
Bronislav: "Oh wow, thats no good."

Hendricks: "Indeed, which is why I hope we can prevent mishaps like this from occurring in the future."

Hendricks: "I have a feeling something else is on your mind."

*["I just worry about my friendship with Ivy." #>>IncrementRelationshipStat Hendricks Bronislav 5] 
->BH_Socializing6_IJustWorryAboutMyFriendship

*["Nope, thats it."]
->BH_Socializing6_NopeThatsIt

=== BH_Socializing6_IJustWorryAboutMyFriendship ===
Bronislav: "I just worry about my friendship with Ivy...she didnt seem to be happy with me last I saw her."

Hendricks: "It's going to be okay. I understand Ivy's your friend, but if we are being put into a position where it risks our academic integrity, Ivy needs to understand your boundaries." 

Bronislav: "Yeah..."

Hendricks: "Give her some time, if she is someone who cares about you and I'm sure she does, she will understand."

*["I really appreciate your help, Hendricks."]
->BH_Socializing6_AppreciateYourHelp

=== BH_Socializing6_AppreciateYourHelp ===
Bronislav: "I really appreciate your help, Professor Hendircks. your advice helped me make a better call in the end."

Hendricks: "Of course, that is why I'm here for. I just wish Praveen had the same revelation."

Bronislav: "Like you said, it'll all work out."

Hendricks gives a small laugh.

Hendricks: "I appreciate it, Bronislav."

Bronislav: "Ah, I have to get going now. I need to finish an assignment. Thanks again."

You get up and Hendricks smiles as you leave going back to her book.

{HideCharacter(Hendricks)}
->DONE

=== BH_Socializing6_NopeThatsIt ===
Bronislav: "Nope, thats all. Oh shoot, I have to get going. thanks again, Professor Hendricks."

Hendricks: "Well, I hope you have a good rest of your day, Bronislav."

You get up, and Hendricks goes back to her book as you leave.

{HideCharacter(Hendricks)}
->DONE

