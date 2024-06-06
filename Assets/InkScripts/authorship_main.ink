=== start ===
//Biology lab
//->lab 
//->bradstart
->finalstart
=== lab ===
# SetBackground lab
It's been a hectic Tuesday for Bronislav. He's had an international student meeting with his counselor to discuss his visa status, a lab tour for the undergraduates, a coffee chat with his advisor, and only two hours to do his actual work in the lab.

Bronislav sighs as he sinks into his swivel chair in his lab, as he does his best to relish the brief respite he has right now.

Suddenly, the door creaks open, as he hears the familiar sound of his senior's high-heeled footfalls.

Ivy: "Sorry, am I bothering?"

Bronislav: "No, it's fine. I am just a little tired."

Ivy: "Oh I'm sorry to hear that. How's your research going?"

*[It's a bit stressful; we're not getting the results we were hoping for.]   
    Ivy: "Oh, there's nothing you can't handle. You can let me know if you need any help!" 
    ->Jensenintro
*[It's going well, I suppose.] 
    Ivy: "That's good! I'm glad to hear that it's going well." 
    ->Jensenintro
*[I'm putting in a lot of effort into this paper. I hope it will be good in the end.] 
    Ivy: "That's good to hear! Make sure you're taking care of yourself." ->Jensenintro

=== Jensenintro ===
Ivy: "On the subject of the research paper...I know this sounds strange, but is it possible for you to add my friend Jensen as an author?"
*[Why? They didn't contribute anything.]
   Ivy: "Well, they told me that they were able to offer some insights into your research."
        ->questionmethods
*[Jensen? The person that came to shadow two lab meetings?]
   Ivy: "Yes, and they're a valuable member of the lab. They told me that they were able to offer some insights into your research.
        ->questionmethods
        
 === questionmethods === 
 
*[All they did was question our methods...]
        ->Jensenpapers
*[That's true...we were able to reflect on our methods a bit more.]
        ->Jensenpapers
        
=== Jensenpapers ===
Ivy: "Look, Jensen doesn't have a lot of papers to their name, and it's not looking good for them since they want to pursue a career in academia."
*[Could you elaborate?]
  Ivy: "Well, they have a hard time committing to projects...but we all have our fair share of struggles.
    ->Jensenfriend
*[That's not really my problem. Maybe they should start writing their own papers.]
   Ivy: "Think of it this way -- this would be a good opportunity for Jensen to be mentored by a diligent researcher like yourself!"
    ->Jensenfriend
    
=== Jensenfriend ===
Ivy: "But they're a dear friend of mine, and you wouldn't be doing this for nothing either."
*[What do you mean by that?]
    ->Ivyuncle
*[Quid pro quo? Isn't that unethical?]
   Ivy: "This sort of stuff hapens all the time. Advisors don't even do any of the writing but their names still get added as authors."
    ->Ivyuncle

=== Ivyuncle ===
Ivy: "My uncle is the head of research at SynthoGen Biotechnologies, and I could put in a good word for you. You're planning to pursue the industry route, correct?"

*[Yes..I guess adding Jensen wouldn't hurt.]
   Ivy: "Great! Let's discuss more closer to the paper's deadline."
    ->DONE
*[I'm not sure...could I get back to you regarding that?]
  Ivy: "No worries! Just let me know in about a week."
   ->DONE
*[I'm sorry Ivy, but I don't think this seems very fair. Could I have some time to think about it?]
 Ivy: "No worries! Just let me know in about a week."

-> DONE

=== bradstart ===
# SetBackground coffeeshop
Brad: "Thanks for meeting with me. Is there something on your mind?"

Bronislav: "You know my senior, Ivy?"

Brad: "Yeah, I know her -- I’ve seen her around. What about her?"
    *[She's trying to get me to do her a favor.]
        ->bradgoforit
    *[She wants me to add her friend to the paper.]
        ->bradgoforit
        
=== bradgoforit ===

Brad: "Just go for it! I mean, wouldn’t it be good to impress her?"

Bronislav: "She wants me to add Jensen to the paper in exchange for a recommendation for an industry position."

Brad: "Ew, Jensen? They’re the person that brought a shrimp platter to the grad barbecue, even though I’m allergic!"

*[I’m sure that they didn’t know...]
    Brad: "It’s a common allergy, surely they would have known that someone would have it!"
    ->Bradqualms
*[I suppose that was rather lousy of them...]
    Brad:"I know, right?"
    ->Bradqualms
    
=== Bradqualms ===
Brad: "What are some qualms that you have about adding Jensen?"
    *[They only sat in for a couple lab meetings.]
    ->Bradweird
    *[They didn’t even do any research or writing!]
    ->Bradweird
    
=== Bradweird ===
Brad: "That sounds awfully lazy of them."
Brad: "Also, isn’t it kind of weird that Ivy’s offering you this industry position? It sounds like she’s so well connected that she can get anyone to do anything she wants."
    *[Well, she’d be helping me out, and I’m not in a position to say no.]
        Brad: "Fair enough, but don’t you think that there’s something wrong about this?"
        ->Bronislavright
    *[That’s unfair for you to say -- you hardly know her, and that’s a very broad judgement to make.]
        Brad: "Fair enough, but don’t you think that there’s something wrong about this?"
        ->Bronislavright
    *[You're right -- she does have a lot of influence thanks to her connections]
        Brad: "I’m telling you, you’ve got to be careful."
        ->Bronislavright
        
=== Bronislavright ===
 Bronislav: "You’re right, I need to pay closer attention to this. I don’t know exactly what I’m saying 'yes' to."
 
 Brad: "I’m not sure why you’d be adding Jensen in the first place. Sounds like they didn’t do much."
 
 Bronislav: "Brad, the industry position would help me out a lot -- job searching is really tough."
 
 Brad: "I’m sure you can just get more opportunities later! You’re a standout researcher; you’re on good terms with a lot of professors."
        *[I suppose so...you raise a good point. Not to mention, a career in academia wouldn’t be so bad.]
        ->DONE
        *[It’s not that simple, Brad. An industry job would help me save up for my visa fees.]
        ->DONE
        
=== finalstart ===
# SetBackground lab
Ivy: "Hello Bronislav! It's good to see you again."

Ivy: "So, have you made a decision yet?"

Bronislav: "Yes, I have."

Ivy: "Oh, that's great! So, is it alright for you to add Jensen to the paper then?"
    *[Yeah, I guess, it wouldn't be a problem to add them.]
    Ivy: "Perfect! You're really helping me and Jensen out a lot -- I won't forget to contact my uncle to put in a good word for you."
    Your PI, Hendriks, found out that you added Jensen and disapproved strongly. He recommended you to take an ethics classes and threatened you with an Academic Dishonesty Review. He requested Jensen to no longer attend lab meetings.
    ->DONE
    
    *[Actually, I don't think I can.]
        Ivy: "Oh...is there a reason why?"
        **[It wouldn’t be ethical. I can’t add Jensen if they didn’t contribute a substantial amount of work.]
            ->Ivyethical
        **[It's not fair for me to add them if they didn't do anything.] 
            ->Jensenmeetings
        **[Hendriks, our Principal Investigator, wouldn't be okay with it.]           
            ->Ivyask        
                    
                    
 ->DONE                   
=== Ivyethical === 

Ivy: "Look, I know it’s not the most ethical thing  as well. But you’d be missing out on a big opportunity -- industry jobs truly are a rarity."
    *[I’m sorry Ivy, but a no is a no.]   
        Ivy: "I understand. Thanks for telling me, I suppose."
                         
        Jensen isn’t added to your paper. You’re sad that you missed this opportunity but feel reassured that you made the right choice. Ivy seems disappointed, but you feel like she reacted well to your clarity and professionalism.
            -> DONE
    *[I guess you're right -- it wouldn't really be a big deal if I added Jensen.]
        Ivy: "Perfect! You're really helping me and Jensen out a lot -- I won't forget to contact my uncle to put in a good word for you."
                             
        Your PI, Hendriks, found out that you added Jensen and disapproved strongly. He recommended you to take an ethics classes and threatened you with an Academic Dishonesty Review. He requested Jensen to no longer attend lab meetings.
                                ->DONE
    
=== Jensenmeetings ===
        Ivy: "But they did do something -- they sat in at your meetings!"
        *[That's hardly anything!]
        Ivy: "Forget it! You can say goodbye to your chances of getting an industry career in this job market."
            
            Jensen isn’t added to your paper. You’re sad that you missed this opportunity but feel reassured that you made the right choice. Direct, clear, professional communication is best in these situations.
            ->DONE
         *[I'm sorry Ivy, but a no is a no.]                
            Ivy: "I understand. Thanks for telling me, I suppose."
                         
                         Jensen isn’t added to your paper. You’re sad that you missed this opportunity but feel reassured that you made the right choice. Ivy seems disappointed, but you feel like she reacted well to your clarity and professionalism.
                         ->DONE
                         

=== Ivyask ===
            Ivy: "But that means you haven’t asked them yet, right?"
                *[I'm sorry, but a no is a no.]
                    Ivy: "I understand. Thanks for telling me, I suppose."
                         
                         Jensen isn’t added to your paper. You’re sad that you missed this opportunity but feel reassured that you made the right choice. Ivy seems disappointed, but you feel like she reacted well to your clarity and professionalism.
                         ->DONE
                *[Actually, I asked them already, but they said no.]
                    Ivy: "Forget it! You can say goodbye to your chances of getting an industry career in this job market."
                    
                  Jensen isn’t added to your paper. You’re sad that you missed this opportunity but feel reassured that you made the right choice. Direct, clear, professional communication is best in these situations.
            ->DONE  
        ->DONE