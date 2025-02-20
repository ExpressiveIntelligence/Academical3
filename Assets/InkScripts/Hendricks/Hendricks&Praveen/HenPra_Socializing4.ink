=== HP_S4_SceneStart ===
# ---
# choiceLabel: Meet with Praveen
# @query
# Seen_HPCON
# @end
# hidden: true
# tags: action, library, auxiliary
# ===

{DbInsert("Seen_HPS4")}

{ShowCharacter("Praveen", "left", "")}

It was around time for your appointment with Praveen. 

He should have received his review papers and started his review process.

With a knock on the door, Praveen gives his usual nod and takes his seat excitedly.



*["You seem excited, how are you doing?"]->PraSeemsExcited
*["Hello Praveen, how have you been?"]->HowHasPraBeen


== PraSeemsExcited == 
Hendricks: "You seem excited, anything new going on?"

Praveen: "Not really, I've just been working on the assignments I got."

Hendricks: "Thats great to hear, I'm glad each assignment got to you."

*["Mind telling me a little bit more about how thats been going?"]

- Hendricks: "Would you mind telling a bit more?"

Praveen: "About the review papers?"

Hendricks: "Yes, how has the process been going recently? Do you have any questions?"

Praveen: "The process has been going quite well, I've been really enjoying the review process! I feel like I can have a lot of influence on these writers." 

*["You feel like you can have influence?"]->FeelLikePraHasInfluence
*["Would you mind diving a little deeper?"]->DiveALittleDeeper

== HowHasPraBeen == 
Hendricks: "Hello Praveen, how have you been since last I saw you?"

Praveen: "I've actually been doing really well!"

Hendricks: "I'm glad!"

*[Bring up paper]->BringUpPaper
*[Don't bring up paper]->DontBringUpPaper 

== BringUpPaper ==
Hendricks: "How has your research paper review process going?"

Praveen: "The process has been going extremely well! I feel like I can have a lot of influence on these writers. Being a Graduate student I have a lot of experience so I can really make an impact."

*["You feel like you can have influence?"]->FeelLikePraHasInfluence
*["Would you mind diving a little deeper?"]->DiveALittleDeeper


== DontBringUpPaper ==
Praveen is seemingly antsy as he shifts in his chair.

Hendricks: "Anything on your mind?"

Praveen frowns a bit expecting a different question from you.

Praveen: "Well I wanted to talk about my progress with the research paper reviews."

*["Ah right, thats great to bring up."]->GreatToBringUp
*["About that, do you mind telling me what kind of reviews you're leaving?"]->WhatReviewsIsPraLeaving

== FeelLikePraHasInfluence ==
Hendricks: "You feel like you have an influence?"

You watch Praveen nod his head while a bad gut feeling fills your stomach recalling Jensen's words.

Praveen: "Yes, quite. I have a massive amount of experience, so I'm able to leave reviews that can, in a way, completely improve their papers."

Praveen sits proudly.

*[Let him continue.]->LetPraContinue
*[Intervene.]->InterveneWithPra

== DiveALittleDeeper ==
Hendricks: "Could you tell me more?"

Praveen: "Throughout the process, I have found that many of these undergraduates lack some fundamentals in writing research papers. So I helped them out."

Praveen shuffles in his seat sitting up straighter, he's a pretentious one, thats for sure.

*[Let him continue.]->LetPraContinue
*[Intervene.]->InterveneWithPra

== GreatToBringUp ==
Hendricks: "Yes, that's great to bring up, I'm sure you received your projects, how has the review process been going?"

Praveen: "The review process is going quite well, I am very proficient when it comes to writing research papers, and this leads me to be able to leave reviews that can completely improve their papers."

Praveen looks at you, beaming with pride.

*[Let him continue.]->LetPraContinue
*[Intervene.]->InterveneWithPra

== WhatReviewsIsPraLeaving ==
Hendricks: "About that, do you mind telling me what kind of reviews your leaving?"

Praveen: "The reviews I've been leaving? Well, I've been helping the students improve their papers, it seems a lot of them lack the fundamentals of what research is about."

Praveen looks at you confused, as you put your hand to your chin and think.

*["I'm a little concerned about these reviews."]->HenIsConcerned
*["It seems you're doing good work on this job!"]->PraIsDoingGood
*["Could I give you some advice for future works?"]->HenHasFeedbackAdvice

== LetPraContinue ==
Praveen: "I've been able to leave comments as well as an overall review, although the papers given to me weren't the best I've seen I was able to help rewrite some of them. It's, in a matter of speaking, quite nice to be on this end, I feel like I have a lot more control and influence."

*["I'm a little concerned about these reviews."]->HenIsConcerned
*["It seems you're doing good work on this job!"]->PraIsDoingGood
*["Could I give you some advice for future works?"]->HenHasFeedbackAdvice

== InterveneWithPra ==
Hendricks: "Praveen could we talk about some good review practices? I would like to dive into some better practices."

Praveen: "Better practices...what do you mean, the way I see it these students require crucial help."

*["I'm a little concerned about these reviews."]->HenIsConcerned
*["Could I give you some advice for future works?"]->HenHasFeedbackAdvice
*["I completely understand. And you're right, you are the best student for this task, but I believe there is a better way to go about this."]->HenHasBetterApproach

== HenIsConcerned ==
Hendricks: "Praveen, I'm a little concerned about these reviews you are leaving, it seems you are leaving more negative reviews and edits, where you are tasked with just giving feedback versus the negative comments I'm hearing..."

Praveen: "I'm not sure what you mean Professor Hendricks, you gave me this task because I'm the most adequate for the job. I don't understand why my reviews aren't helpful, I'm helping these students fix their work."

*["I completely understand. And you're right, you are the best student for this task, but I believe there is a better way to go about this."]->HenHasBetterApproach
*["I'm sorry that it came to this, but I think you should reconsider how you review these papers."]->PraShouldReconsiderReviews

== PraIsDoingGood ==
Hendricks: "I can see you putting your best foot forward with this review job."

Praveen: "I'm doing all I can! I appreciate you recognizing my hard work."

*["Of course."]->HenOfCourse
*["It's no problem, you are working extremely hard."]->NoProblemYouAreWorkingHard
*["Let's just keep in mind that we are leaving reviews for improvements."]->KeepImprovementInMind

== HenHasFeedbackAdvice ==
// TO DO CONDITIONAL FOR BAD STANDING WITH PRAVEEN == 
// Hendricks: "I think it would be a good idea to backtrack a bit, would it be okay if I give you some advice for future works?"
// Praveen: "I'm not so sure, I have a gut feeling that I'm doing the right work."
// Hendricks: "I think it would be a good idea to make sure our reviews revolve around feedback about how the paper can improve based on what's given versus pointing out exactly what's wrong. For example, maybe advising that there is a need for more evidence or the thesis is too broad."
// Praveen: "I'll think about it..."
// Praveen trails off seemingly annoyed
Hendricks: "I think it would be a good idea to backtrack a bit, would it be okay if I give you some advice for future works?"

Praveen: "Sure...I'll hear you out."

Hendricks: "I think it would be a good idea to make sure our reviews revolve around feedback about how the paper can improve based on what's given versus pointing out exactly what's wrong. For example, maybe advising that there is a need for more evidence or the thesis is too broad."

Praveen: "Alright, I'll take that into consideration."

*["Wonderful, I appreciate it."]->WonderfulIAppreciateIt

== HenHasBetterApproach == 
Hendricks: "I completely understand, and you're right, you are very capable for this task...but, I believe there is a better way to go about this."

Praveen slumped in his chair, he never liked being ridiculed but this was the best way to go about the situation.

Praveen: "Alright, what do you think is the better way to go about this?"

Hendricks: "Well, I think we should start by focusing on feedback about how they can improve their essay such as "good thesis, but too broad" or even "Include more quotes.""

Praveen: "Okay I understand, I'll take that into consideration."

*["Wonderful, I appreciate it."]->WonderfulIAppreciateIt

== PraShouldReconsiderReviews ==
Hendricks: "I'm sorry it has come to this, but I believe it would be best if you reconsider how you review these papers."

Praveen looks a little defensive and sighs.

Praveen: "I'm not sure if what I'm doing is bad and I rather think it helps these students, but I'll hear you out since you're my adviser."

Hendricks: "Thank you I appreciate it, I think you should start by focusing on feedback rather then what is necessarily wrong with the essay, for example, "good thesis but, focus on condensing it," notations like these help the author more."

Praveen: "Okay, I'll take that into consideration."

*["Wonderful, I appreciate it."]->WonderfulIAppreciateIt

== HenOfCourse == 
Hendricks: "Of course, you're doing a lot helping out these students, keep it up"

Praveen: "Thank you I'll do my best."

Praveen: "Well it's my time to go, thank you, and I'll see you next meeting."

Hendricks: "Goodbye Praveen, have a good rest of your day."-> HidePraAndEnd

== NoProblemYouAreWorkingHard ==
Hendricks: "It's no problem at all, you're the one doing all the work, and we appreciate it."

Praveen beams happily.

Praveen: "Thank you, I will continue to keep up my work."

Praveen: "Well it's time for me to head out, thanks again."

Praveen stands from his chair giving a wave

Hendricks: "Goodbye, have a good rest of your day."-> HidePraAndEnd

== KeepImprovementInMind ==
Hendricks: "Let's just keep in mind that we are leaving reviews for the paper's improvement."

Praveen: "Of course, that is what I have been doing,"

Hendricks: "Alright, sounds good."

Praveen: "Well it looks like it's time for me to head out, thank you again."

Praveen smiles standing from his chair and waving goodbye.

Hendricks: "I'll see you next time Praveen, have a good rest of your day."->HidePraAndEnd

== WonderfulIAppreciateIt ==
Hendricks: "Wonderful, I appreciate your consideration. Remember I'm here to help you if you need anything!"

Praveen: "Alright thank you, It's time for me to head out, I'll see you next time."

You give a small wave as Praveen stands and heads out the door in a worse mood than when he entered.-> HidePraAndEnd

== HidePraAndEnd ==
{HideCharacter("Praveen")}

->DONE