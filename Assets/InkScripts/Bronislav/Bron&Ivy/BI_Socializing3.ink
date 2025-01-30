=== student_cubes ===
#---
# choiceLabel: Go to the student cubicles.
# hidden: true
# tags: location
#===

{SetCurrentLocation("student_cubes")}

->SceneStart

// NOTE: CURRENT DEFAULT IS BRONISLAV WAS RECEPTIVE OF IVY'S DEAL

=== SceneStart ===

As you walk towards your desk, you notice that Ivy steps into your path.

*["Hey Ivy." #>> IncrementRelationshipStat Ivy Bronislav Opinion 50]
Bronislav: "Hey Ivy." 

You say as you stop in front of her.

// TODO: decision indicator based off of whether Bronislav previously showed interest

// if you were receptive of the offer
Ivy smiles, still excited from your talk earlier.

Ivy: "So actually, I've been thinking about it more, and I am realizing there is another good reason why you should definitely consider helping Jensen."

->HelpJensen

// if you weren't receptive
//Ivy smiles, a bit surprised.

//Ivy: "Glad I caught you in a better mood. I've actually been thinking about our conversation earlier, and I realized there is another good reason why you should help Jensen."

->HelpJensen

*["Uh.. hi.. Ivy."]
Bronislav: "Uh.. hi... Ivy."

// TODO: decision indicator based off of whether Bronislav previously showed interest

// if you were receptive of the offer
Ivy: "Oh?" 

Ivy seems surprised.

Ivy: "Why so cold all of a sudden?"

->SoCold

// if you weren't receptive
//Ivy: "Hi. I... uh... okay..."

//She looks like she is mentally fortifying herself for this conversation.

//Ivy: "I know I kind of caught you off guard with our conversation earlier, but I thought about it bit more, and I thought of another reason why you should help Jensen."

->WhyShouldIHelp

*["Excuse me, Ivy." #>> DecrRelationshipStat Ivy Bronislav Opinion -50]
Bronislav: "Excuse me, Ivy." 

You try to deliberately move around her to your desk.

// TODO: decision indicator based off of whether Bronislav previously showed interest
// if you were receptive of the offer

Ivy: "Oh?" 

Ivy seems surprised.

Ivy: "Why so cold all of a sudden?"

->SoCold

// if you weren't receptive
//Ivy looks annoyed.

//Ivy: "Real mature Bronislav."

//Bronislav: "I'm just trying to go to my desk."

//Ivy: "Yeah, well I'm just trying to talk to you. I know I kind of caught you off guard with our conversation earlier, but I thought about it bit more, and I thought of another reason why you should help Jensen."

//->WhyShouldIHelp


=== SoCold ===

*["I'm sorry, I didn't mean to come off cold." #>> IncrementRelationshipStat Ivy Bronislav Opinion 20]
Bronislav: "Sorry Ivy, I didn't mean to come off cold, I just have a lot on my plate right this second and I just need to get to work."

Ivy: "Oh, sorry. I won't take up too much of your time then, I just thought about it a bit more, and I thought of another reason why you should help Jensen."

->WhyShouldIHelp

*["I'm not sure I'm comfortable with talking."]
Bronislav: "I'm honestly not sure I'm comfortable talking with you right now. I know I said I was potentially interested in taking your offer, but my gut is telling me this is all a bad idea."

Ivy: "Oh, well... I wasn't exactly expecting that..." 

Ivy now looks nervous. 

Ivy: "I know I kind of caught you off guard with our conversation earlier, but I thought about it bit more, and I thought of another reason why you should definitely help Jensen."

->WhyShouldIHelp

*["Learn to read the room Ivy."#>> DecrRelationshipStat Ivy Bronislav Opinion -80 ]
Bronislav: "Learn to read the room Ivy."

You say harshly as you sit down, ignoring Ivy completely as you start using your computer.

Ivy looks both offended and annoyed.

Ivy: "Real mature Bronislav."

->NotInterested

=== WhyShouldIHelp ===
Bronislav: "Okay, you have my attention, why should I help Jensen?"

Ivy: "Well, in thinking about it more, you and I both know how hard it is to get into grad school. We both know how difficult it is to get in, especially without taking part in research like you're engaged in. But, I realized this extends into getting a job in our field after school. 

Ivy: "I've heard so many horror stories about the whole process, and I am realizing that having an in like the one I'm offering not only would be a testimate to your hard work, but it gives you security for your future going forward. You're not only helping Jensen through what we both know is a difficult situation, but you are helping yourself have a plan for post graduation."

*["I hadn't thought about it like that." #>> IncrementRelationshipStat Ivy Bronislav Opinion +40]
Bronislav: "Huh, I hadn't thought about it like that, Ivy."

Ivy giggles.

Ivy: "Oh you know me, master schemer and insight wizard over here. Anyway, I think you should defintiely put Jensen on the paper, because you're not only helping him, but you're helping yourself."

Bronislav: "Alright, I'll have to see. I've got some work I have to do now, but it was nice chatting."

Ivy: "Of course, I'll leave you to it."

Ivy leaves with a pep in her step.

{HideCharacter(“Ivy”)}

->DONE

*["And you're sure this will work how?"]
Bronislav: "And you're sure this will work how exactly?"

Ivy: "It's a simple as putting Jensen on the paper Bronislav. There's nothing to overthink here."

Bronislav: "I just don't know Ivy."

Ivy: "Well, you don't have to be sure just yet, but at least tell me you'll consider it."

Bronislav: "Okay, I will. Now, I've got some work I have to do, but it was nice chatting."

You move to sit down, and Ivy gets out of your way.

Ivy: "Of course, I'll leave you to it."

Ivy turns and leaves the room.

{HideCharacter(“Ivy”)}

->DONE

*["This is making me uncomfortable." #>> IncrementRelationshipStat Ivy Bronislav Opinion +20]
Bronislav: "Okay, this is making me uncomfortable, Ivy."

Ivy: "Oh, my bad. I didn't realize I was making this weird, I appreciate you being honest."

Ivy: "Is there anything that I can say that might make you feel less worried? The last thing I want is to make you feel uncomfortable."

Bronislav: "Just give me some time to think about all this. I've got some work to do right now, and I think I need to focus on that first before I can think anymore about your ideas."

Ivy: "Okay, no problem, I'll leave you to it. Just please think about it, because it could really help you both."

Ivy leaves you to your work.

{HideCharacter(“Ivy”)}

->DONE

*["You're trying too hard." #>> DecrRelationshipStat Ivy Bronislav Opinion -50]
Bronislav: "You're trying too hard. Is there a reason you are this desperate for me to help Jensen?"

Ivy: "Is there a reason you are so intent on being rude? Have you not been listening to a word I've been saying?"

Bronislav: "I don't know Ivy, but what I do know is that this idea is not a good one."

Ivy: "Okay, well, can I ask you to at least consider the more than generous offer that is being handed to you?"

Bronislav: "Okay it's being considered. Now I have some work that I actually need to do, so can I use my desk please?"

Ivy: "Mature, Bronislav, really mature."

She shoots you an annoyed look as she walks past you out of the room.

{HideCharacter(“Ivy”)}

->DONE

=== HelpJensen ===
Bronislav: "Oh yeah? What other reason did you think of?"

Ivy: "Well, you and I both know how hard it is to get into grad school, especially without taking part in research like you're engaged in, but I also thought about how hard it is to actually get a job in our field after school."

Ivy: "Helping Jensen would really give you the secruity of having your life after school totally planned out, and all you would be doing would be giving him a leg-up for getting into school. It's a win-win situation no matter how you slice it."

*["I hadn't thought about it like that." #>> IncrementRelationshipStat Ivy Bronislav Opinion +40]
Bronislav: "Huh, I hadn't thought about it like that, Ivy."

Ivy giggles.

Ivy: "Oh you know me, master schemer and insight wizard over here. Anyway, I think you should defintiely put Jensen on the paper, because you're not only helping him, but you're helping yourself."

Bronislav: "Alright, I'll have to see. I've got some work I have to do now, but it was nice chatting."

Ivy: "Of course, I'll leave you to it."

Ivy leaves with a pep in her step.

{HideCharacter(“Ivy”)}

->DONE

*["I guess you're right." #>> IncrementRelationshipStat Ivy Bronislav Opinion +20]
Bronislav: "Yeah, I guess you're right, Ivy."

Ivy: "Of course I am. When have I ever not been on the mark?"

Bronislav: "Yeah, I guess so. I'll have to see about helping Jensen. 

You move to sit down at your desk.

Bronislav: "I've got some work to do for now, but it was nice chatting."

Ivy: "Of course, I'll leave you to it."

Ivy leaves with a pep in her step.

{HideCharacter(“Ivy”)}

->DONE

*["I'm not so sure it will pan out that way." #>> DecrRelationshipStat Ivy Bronislav Opinion -20]
Bronislav: "I'm not so sure it will pan out that way, Ivy. Consider realisitically, the possibility of everything working out that nicely."

Ivy: "I have, and this is fool proof. It's simple straightforwad logic, and you of all people should be on board."

Bronislav: "And why is that exactly?"

Ivy: "You are a reasonable person Bronislav, and its so easy to do the reasonable thing in this case. Just at least say you will consider it."

Bronislav: "Okay, I will, but right now I've got some work to do."

Ivy nods politely.

Ivy:"Of course, I'll leave you to it."

She heads out of the office.

{HideCharacter(“Ivy”)}

->DONE

=== NotInterested ===
Ivy: "All I was going to say was that I thought about our conversation earlier, which may I remind you, you said you were interested in helping Jensen, and that I also thought about how this deal would really be helpful both for you securing a job and getting your life planned out prior to graduating."

Ivy: "But clearly, you're more invested in whatever work is waiting for you at your desk, so I'll leave you to it. You're lucky Jensen needs my help, because it is ridiculous for you to treat me like this."

Ivy walks out of the office before you can say anything else.

{HideCharacter(“Ivy”)}

->DONE
