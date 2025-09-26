=== BH_Socializing5_SceneStart ===
# ---
# choiceLabel: Peruse library.
# @query
# date.day!5
# @end
# repeatable: false
# tags: action, library, required
# ===
~IvyAcceptedOfficial = DbAssert("BI_OfficiallyAccepted")

~IvyDeniedOfficial = DbAssert("BI_OfficiallyRejected") 

{IvyAcceptedOfficial: -> HendricksSocial5Accept} 
{IvyDeniedOfficial: -> HendricksSocial5Denied} 

===HendricksSocial5Accept===
Today has been going incredibly well, and the excitement of your upcoming job came with a sense of accomplishment. 
{ShowCharacter("Hendricks", "left", "")}
Lost in thought, you notice Hendricks out of the corner of your eye.

*["Hello, Hendricks!"]
->BH_Socializing5_HelloHen

===HendricksSocial5Denied===
To clear your head, you decide to pass through the library. During your stroll, you notice Professor Hendricks sitting reading a book and decided to approach her to ask for advice.
{ShowCharacter("Hendricks", "left", "")}
*["Hi, Professor Hendricks."]
->BH_Socializing5_HiHen

=== BH_Socializing5_HelloHen ===
Bronislav: "Hello, Hendricks, how are you today?"

Hendricks closes her book and looks over to you with her usual smile.

Hendricks: "Oh, hello, Bronislav. I'm doing well. How about you?"

*["Really well."]
->BH_Socializing5_ReallyWell

*["I have some exciting news!"]
->BH_Socializing5_ExcitingNews

=== BH_Socializing5_ReallyWell ===
Bronislav: "I'm doing really well!"

Hendricks: "It seems that way. Tell me about it."

You take a seat across from Hendricks, beaming with excitement.

Bronislav: "Remember how Ivy offered me a job opportunity with her Uncle?"

Hendricks: "Yes, I recall."

*[Tell Hendricks about taking Ivy's deal. #>>ChangeOpinion Hendricks Bronislav +]
->BH_Socializing5_TellHendricks

*[Don't tell Hendricks.]
->BH_Socializing5_DontTellHendricks

=== BH_Socializing5_ExcitingNews ===
Bronislav: "I have some exciting news!"

Hendricks: "Do you? Have a seat, I'm all ears."

You take a seat across from Hendricks.

*[Tell Hendricks about taking Ivy's deal. #>>ChangeOpinion Hendricks Bronislav +]
->BH_Socializing5_TellHendricks

*[Don't tell Hendricks. #>> ChangeOpinion Hendricks Bronislav -]
->BH_Socializing5_DontTellHendricks

=== BH_Socializing5_TellHendricks ===
Bronislav: "Well, I decided to work with Ivy and take up the job offer."

Hendricks shifts in her seat. 

Hendricks: "Really? How is that going?"

Bronislav: "I considered everything you said the last time we spoke, and while it is kind of a slippery slope, I really need what she's offering, and I am definitely not in a position to turn down a sponsor."

Hendricks: "Does this job offer still include what Ivy gets out of this deal?"

*["I get the feeling you don't agree with me."]
->BH_Socializing5_IGetTheFeeling

*[Dodge the question. #>> ChangeOpinion Hendricks Bronislav -]
->BH_Socializing5_DontTellHendricks

=== BH_Socializing5_DontTellHendricks ===
Bronislav: "Well, I worked things out with Ivy, and everything worked out for the best."

Hendricks: "Ah, I see. well, I'm glad it all worked out. That reminds me; I had to work things out with Praveen. Things took a turn for the worse; I had to remove him from the review process."

*[I'm guessing things didn't turn out well?]
->BH_Socializing5_DidntTurnOut

=== BH_Socializing5_IGetTheFeeling ===
Bronislav: "I get the feeling that you do not agree with me on this decision."

Hendricks sighs, thinking for a moment.

Hendricks: "As I have told you in the past, quid pro quo exchanges in academics are highly discouraged. I was trying to give you space to handle this before, but I fear you may feel the consequences."

*["I need this job."]
->BH_Socializing5_NeedThisJob

*["I believe it'll work out."]
->BH_Socializing5_ItllWorkOut

*["I'll think about it."]
->BH_Socializing5_IllThinkAbtIt

=== BH_Socializing5_DidntTurnOut ===
Bronislav: "I'm guessing things didn't turn out well in the end?"

Hendricks: "Unfortunately not. I had wished whatever paper nonsense was going on would cease. However, we unfortunately need to teach better ethical practices. In any case, is there anything else going on you wish to discuss with me, Bronislav?"

*["Nope, thats it."]
->BH_Socializing5_ThatsIt

=== BH_Socializing5_NeedThisJob ===
Bronsialv: "I need this job, Hendricks. If I don't get this job, I don't have a sponsor for my visa, and I don't want to risk not having that. I don't even want to think about what will happen if I don't have that."

Hendricks sighs.

Hendricks: "I understand where you are coming from, Bronislav, I do. But there's some lines you really can't cross. I really wish you would have come to me with your concern, because I think I could have really helped in your situation."

Bronislav: "I have made my decision, professor. Ivy promised me what I needed and I took it."

Hendricks: "Alright, I won't pry further, but I just want you to be aware there may be consequences. I fear this may not end as well as you hoped."

Bronislav: "I appreciate your concern. Thank you. I have to go get an assignment done. I'll see you later, Hendricks."

You stand up and leave while Hendricks wears a solemn, contemplative expression as she opens her book and continues reading. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_ItllWorkOut ===
Bronislav: "I believe things will work out. They have to, because I need them to."

Hendrick frowns, but it's hard to get a read on what she's thinking.

Hendricks: "Alright then. I recently had to remove Praveen from revision work, because of his own unethical behavior. I sincerely hope that this isn't something that happens to you."

Bronislav: "Oh wow, I wish things went better for him. I appreciate the concern, but I can handle it. Oh, I gotta head out to finish an assignment. I'll see you later, Professor Hendricks."

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_IllThinkAbtIt ===
Bronislav: "I'll give it some thought."

Hendricks: "I appreciate that, thank you."

Bronislav: "Oh shoot, I gotta go get an assingment done. Thanks again, Hendricks."

As you walk off you notice a solemn expression on Hendricks face as she goes back to her book.

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_ThatsIt ===
Bronislav: "Nope, thats all. I just wanted to check in."

Hendricks: "Wonderful. I enjoy our talks, and I'm always here if you need anything."

Bronislav: "Thanks for listening. Enjoy your book."

You take a stand before waving, watching as Hendricks opens her book with a contemplative expression residing on her face. 

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_HiHen ===
Bronislav: "Hi there, Professor Hendricks. How are you doing today?"

Hendricks looks up from her book, taking notice of you.

Hendricks: "Oh, hello there, Bronislav. I'm doing wonderful; how about you?"

Bronislav: "I was actually wondering if you could possibly help me out."

Hendricks: "Of course, have a seat. I'm all ears."

*[Confide in Hendricks. #>>ChangeOpinion Hendricks Bronislav +]
->BH_Socializing5_ConfideinHen

*[Leave.]
->BH_Socializing5_Leave

=== BH_Socializing5_ConfideinHen ===
You take a seat across from Hendricks, folding your hands in your lap.

Bronislav: "Well actually, I took your advice and decided not to go forward with Ivy's proposal. It didn't feel right, and I don't want to go that route."

Hendricks gives a soft smile.

Hendricks: "I can imagine that was a really tough decision. I'm proud of you, Bronislav. You made a good call."

*["Thank you."]
->BH_Socializing5_ThankYou

=== BH_Socializing5_Leave ===
Bronislav: "Actually, sorry, I just realized I have someplace to be. I just wanted to stop by and say hello again."

Hendricks looks genuinely confused, but shrugs it off.

Hendricks: "No problem, Bronislav. I'm here if you need anything."

Bronislav: "Thank you. I'll see you around, Professor."

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_ThankYou ===
Bronislav: "Thank you. But the reason I wanted to ask your help is I still need a sponsor for my visa, and I am really running out of time. Ivy's deal felt like a lifeline, but since I turned it down, I really feel like I have put myself in deeper trouble for doing the right thing."

Hendricks: "Yes of course, I can absolutely help with this. I have a few folks I can talk to about your situation, and I can definitely get something going for you. I need to send some emails and make a few calls, but I will get back to you with help for your sponsor situation as soon as I can, you have my word."

Bronislav: "Thank you professor, I really appreciate it."

Hendricks: "I think we need to put more stress into good ethical practices, these incidents seem to be happening all at once."

Hendricks pinches the bridge of her nose.

Bronislav: "Did something happen?"

Hendricks: "Yes, actually, I unfortunately had to take Praveen off peer reviewing. I wouldn't say I'm not disappointed, I thought he'd know better. It is quite unfortunate."

*["Glad I didnt end up in that boat."]
->BH_Socializing5_GladIDidntEndUp

*["Oh wow."]
->BH_Socializing5_OhWow

=== BH_Socializing5_GladIDidntEndUp ===
Bronislav: "Glad I didn't end up in that boat."

Hendricks: "Indeed, you made the right call getting out of Ivy's deal."

*["I just worry about my friendship with Ivy." #>>ChangeOpinion Hendricks Bronislav +]
->BH_Socializing5_IJustWorryAboutMyFriendship

=== BH_Socializing5_OhWow ===
Bronislav: "Oh wow, thats no good."

Hendricks: "Indeed, which is why I hope we can prevent mishaps like this from occurring in the future."

Hendricks: "I have a feeling something else is on your mind."

*["I just worry about my friendship with Ivy." #>>ChangeOpinion Hendricks Bronislav +] 
->BH_Socializing5_IJustWorryAboutMyFriendship

*["Nope, thats it."]
->BH_Socializing5_NopeThatsIt

=== BH_Socializing5_IJustWorryAboutMyFriendship ===
Bronislav: "I just worry about my friendship with Ivy...she didnt seem to be happy with me last I saw her."

Hendricks: "It's going to be okay. I understand Ivy's your friend, but if we are being put into a position where it risks our academic integrity, Ivy needs to understand your boundaries." 

Bronislav: "Yeah..."

Hendricks: "Give her some time, if she is someone who cares about you and I'm sure she does, she will understand."

*["I really appreciate your help, Hendricks."]
->BH_Socializing5_AppreciateYourHelp

=== BH_Socializing5_AppreciateYourHelp ===
Bronislav: "I really appreciate your help, Professor Hendricks. your advice helped me make a better call in the end."

Hendricks: "Of course, that is why I'm here for. I just wish Praveen had the same revelation."

Bronislav: "Like you said, it'll all work out."

Hendricks gives a small laugh.

Hendricks: "I appreciate it, Bronislav."

Bronislav: "Ah, I have to get going now. I need to finish an assignment. Thanks again."

You get up and Hendricks smiles as you leave going back to her book.

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

=== BH_Socializing5_NopeThatsIt ===
Bronislav: "Nope, thats all. Oh shoot, I have to get going. thanks again, Professor Hendricks."

Hendricks: "Well, I hope you have a good rest of your day, Bronislav."

You get up, and Hendricks goes back to her book as you leave.

{HideCharacter("Hendricks")}
{DbInsert("Seen_BHS5")}
->DONE

