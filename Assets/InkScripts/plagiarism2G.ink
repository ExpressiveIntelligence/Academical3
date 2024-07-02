// good end version 

=== good_end_intro ===

Ayla tightens her grip on the strap of her shoulder bag and tries to ignore Matilda. Matilda's arms are crossed, like it's Ayla's fault they're in this situation in the first place. Standing outside of their advisor's office, Ayla just wants to get this over with. // give matilda 'sad' or 'mad' emote or tag

Matilda: "I still can't believe that you did this." 

* [Ask Matilda what she meant] -> ask_M
* [Call Matilda out] -> should_be
* [Ignore Matilda] -> ignore_Mat

-> DONE

=== ask_M ===

Ayla: "What are you talking about?" 
Matilda: "This was my last chance to get a paper on my resume! I'm screwed now."
// reputation change - matilda decrease

* [End the argument] -> watevah
* [Ignore her] -> ignore_Mati

-> DONE

=== should_be ===

Ayla: "You should be glad that I did. We'd be in a lot more trouble if I hadn't withdrawn our paper."

Matilda scoffs. 
// reputation change - matilda decrease

* [End the argument] -> watevah
* [Ignore her] -> ignore_Mati

=== ignore_Mat ===

Ayla decides to ignore Matilda's comment. It's not worth engaging with her right now. They both have other things to worry about. 

* [Take a deep breath] -> deep_breathe
* [Knock on the door] -> knockin

-> DONE

=== watevah ===
Ayla: "You're the one who- no, you know what? Nevermind." 
Matilda: "What's that supposed to mean?"

Ayla rolls her eyes. She's running out of patience with Matilda, so she decides not to answer her.
// reputation change - matilda decrease

* [Take a deep breath] -> deep_breathe
* [Knock on the door] -> knockin

-> DONE

=== ignore_Mati === 

Ugh, whatever. It doesn't really matter what Ayla did, it seems like Matilda would have blamed her regardless. Ayla ignores Matilda and focuses on the door in front of them instead.

* [Take a deep breath] -> deep_breathe
* [Knock on the door] -> knockin

-> DONE

=== deep_breathe ===

Ayla takes a deep breath. She can do this, with or without Matilda's cooperation. 

* [Kock on the door] -> knockin

-> DONE

=== knockin ===

Ayla knocks on the door of their advisor's office. Matilda sniffs. The door opens.

-> come_inn

-> DONE

=== come_inn ===

Hendriks: "Ah, Matilda, Ayla, welcome. Come in, please." 

Hendriks ushers Ayla and Matilda into his office. 

* [Sit down] -> sit 
* [Stay standing] -> stand

-> DONE

=== sit ===

Ayla chooses one of the two chairs in front of Professor Hendriks' desk to sit down in. Matilda sits down in the other one, as Professor Hendriks takes a seat in his own chair.
-> conversation_begin

-> DONE

=== stand ===

Ayla decides to stand. She sets her bag down in the chair next to the one Matilda sits down in, and grips the back of her chair. 
-> conversation_begin

-> DONE

=== conversation_begin ===

Henriks: "I assume you are both aware why we are meeting this afternoon?" 

* [Nod] -> nodding
* [Answer Hendriks] -> yes_sir

-> DONE

=== nodding ===

Ayla nods. Next to her, so does Matilda.

-> approval

-> DONE

=== yes_sir ===

Ayla: "Yes, Professor Hendriks." 

Next to Ayla, Matilda nods. 

-> approval

-> DONE

=== approval ===

Hendriks: "Good, good. This should not be difficult, then. Ayla, thank you for withdrawing your paper. As I am sure you are both aware, plagiarism is not something we take lightly. I appreciate your honesty." 

* [Sneak a glance at Matilda] -> sneaky
* [Stay focused on Professor Hendriks] -> focused

-> DONE

=== sneaky ===

While Professor Hendriks continues to speak, Ayla sneaks a glance at Matilda. She looks sort of uncomfortable, and keeps shifting in her seat. Ayla quickly looks away. 
-> almost_done

-> DONE

=== focused ===

Ayla resists the urge to look at Matilda while Professor Hendriks is talking.
-> almost_done

-> DONE 

=== almost_done ===

Hendriks: "I believe that about sums up what we needed to speak about today. Matilda, you are free to leave now. Ayla, do you have a moment to stay?" 

* [Leave] -> left
* [Stay] -> stayed

-> DONE

=== left ===

Ayla: "I'm sorry, I have somewhere to be after this. Thank you, Professor Hendriks." 
Hendriks: "Oh, of course. Have a lovely day, ladies." 
-> better

-> DONE

=== stayed ===

Ayla: "Sure, I have time for that." 
Hendriks: "Fantastic!" 

They wait a moment for Matilda to collect her things, mumble a goodbye, and leave. Once Matilda closes the door behind her, Professor Hendriks turns to Ayla and smiles. 

Hendriks: "Ayla, I am aware that you had some difficulty withdrawing this paper. I am impressed by your honesty and integrity. There is a project that a few other students in our department will need honest people like you to help with. Would you like me to let them know you are interested?"

Ayla: "Yes, please! Thank you, Professor Hendriks."

Hendriks: "Think nothing of it. Thank you, Ayla." 

-> better

-> DONE

=== better ===

As Ayla steps out of Professor Hendriks' office, she feels really good. Withdrawing the paper may have felt like a setback or a bad decision in the beginning, but as she had thought it was much better to be honest than to lie and plagiarise. Ayla walks away from the meeting feeling hopeful and excited for the future.  


-> END

















