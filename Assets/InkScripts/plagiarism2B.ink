// start with bad end? may be easier for you

=== bad_end_intro ===

Ayla tightens her grip on the strap of her shoulder bag and tries to ignore Matilda. Matilda's arms are crossed, like it's Ayla's fault they're in this situation in the first place. Standing outside of their advisor's office, Ayla is starting to think she might be right. // give matilda 'sad' or 'mad' emote or tag

* [Tell Matilda this is her fault] -> say_something
* [Ignore Matilda] -> ignore_M

-> DONE

=== say_something ===

Ayla: "Why are you sulking? This is your fault, Matilda." 
Matilda: "You should've said something if you noticed something! I'm screwed now."

* [End the argument] -> wateva
* [Ignore her] -> ignore_Ma

-> DONE

=== ignore_M ===

Ayla decides to ignore Matilda's pity party. It's not worth engaging with her right now. They both have other things to worry about. 

* [Take a deep breath] -> deep_breath
* [Knock on the door] -> knock

-> DONE

=== wateva ===
Ayla: "Right, okay." 

Ayla rolls her eyes. Instead of arguing about whose fault it is, it's better to just face the consequences.

* [Take a deep breath] -> deep_breath
* [Knock on the door] -> knock

-> DONE

=== ignore_Ma === 

Ugh, whatever. It doesn't really matter what Ayla did, it seems like Matilda would have blamed her regardless. Ayla ignores Matilda and focuses on the door in front of them instead.

* [Take a deep breath] -> deep_breath
* [Knock on the door] -> knock

-> DONE

=== deep_breath ===

Ayla takes a deep breath. She can do this, with or without Matilda's cooperation. 

* [Kock on the door] -> knock

-> DONE

=== knock ===

Ayla knocks on the door of their advisor's office. Matilda sniffs. The door opens. 
-> come_in

-> DONE

=== come_in ===

Hendriks: "Ah, Matilda, Ayla, welcome. Come in, please." 

Hendriks ushers Ayla and Matilda into his office. 

* [Sit down] -> sat 
* [Stay standing] -> stood

-> DONE

=== sat ===

Ayla chooses one of the two chairs in front of Professor Hendriks' desk to sit down in. Matilda sits down in the other one, as Professor Hendriks takes a seat in his own chair.
-> conversation_begins

-> DONE

=== stood ===

Ayla decides to stand. She sets her bag down in the chair next to the one Matilda sits down in, and grips the back of her chair.
-> conversation_begins

-> DONE

=== conversation_begins ===

Henriks: "I assume you are both aware why we are meeting this afternoon?" 

* [Nod] -> nodded
* [Answer Hendriks] -> yessir

-> DONE

=== nodded ===

Ayla nods. Next to her, so does Matilda.

-> disapproval

-> DONE

=== yessir ===

Ayla: "Yes, Professor Hendriks." 

Next to Ayla, Matilda nods.
// reputation change - hendriks small increase

-> disapproval

-> DONE

=== disapproval ===

Hendriks: "That makes this conversation easier, then. I was very disappointed to hear that your paper had been rejected from the conference for plagiarism. Plagiarism, as you should both be aware, is something we take very seriously, and is a form of academic malpractice." 

* [Agree] -> agreed
* [Make excuses] -> excuses

-> DONE

=== agreed ===

Ayla: "Yes, Professor." 
Matilda: "Yes, Professor." 
Hendriks: "I expect to see better from you two. You are not high school students nor undergraduate students."
// reputation change - hendriks small increase

-> last_word

-> DONE

=== excuses ===

Ayla: "I tried to tell Matilda, but she insisted-" 
Hendriks: "If you were aware that your research partner had plagiarised, you should not have allowed this paper to be submitted. By not withdrawing the paper, you are complicit in this malpractice, Ayla." 
// reputation change - hendriks down, matilda down

-> last_word

-> DONE

=== last_word ===

Hendriks: "You may both go now. I expect that I will not see this from either of you again. Expect to receive an email from me to schedule a private meeting so that we may discuss this further." 

-> go 

-> DONE

=== go ===
As Ayla steps out of Professor Hendriks' office, she feels really bad. Withdrawing the paper may have felt like a setback or a bad decision in the beginning, but not doing anything about it ended up having worse consequences than she thought. With this plagiarism issue now on her record, being able to participate in future conferences and research groups will be much harder. 

-> END












r. 

-> END












