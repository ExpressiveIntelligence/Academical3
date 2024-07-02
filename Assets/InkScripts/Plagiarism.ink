=== start ===

-> breakfast

-> DONE

=== breakfast ===

It's 8:30 AM.
That's pretty early, even for Ayla. She's about halfway through her morning cup of coffee when her lab partner Matilda joins her for breakfast. She looks awfully bright for someone who went to bed much later than Ayla just to submit their paper on time. 

* [Ask if Matilda slept well] Ayla: "Did you sleep well?" 
    -> slept_well
* [Ask if Matilda turned in the paper] Ayla: "Did you turn in the paper?" 
    -> slept_well

// need to figure out how to indent after option... rn ayla's dialogue is on the same line as matilda's... that being said that's just how it looks in inky rn, so... 

-> DONE


=== slept_well ===

Matilda: "I did! I got the paper in on time, and I slept great."

* [Ask about the paper] -> see

-> DONE


=== see ===

Ayla: "Oh, great! It wasn't too difficult to finish up the rest of the paper without me, was it?"
Matilda: "Nope. It went great! If you want, we can take a look at it later." 
// can add in a small loop here of the two characters eating breakfast and chatting. great opportunity to make references to other characters, but would temporarily move away from main plagiarism plotline. ask about in meeting

* [Head up to the room.] -> look_at

-> DONE

=== brekkie ===

brekkie loop? come from "see" and end up in "look_at"

-> DONE


=== look_at ===

Breakfast was surprisingly nice. Working on this paper with Matilda hadn't been a great experience, but maybe it was just the stress talking. Ayla opens her computer to check the finished paper, and scrolls down to the section Matilda finished last night. She glances over the first couple paragraphs, but then something makes her pause. 

* [Ask Matilda about it] -> hey_wait
* [Look a little closer] -> look_closer
* [Leave it] -> leave_it
-> DONE


=== look_closer ===

Ayla looks a little closer. She rereads the paragraph twice. This... definitely does not sound like Matilda's writing.

* [Ask Matilda about it] -> hey_wait

-> DONE


=== leave_it ===

Ugh, no, it's probably fine. Ayla's probably reading too much into it, and the weird feeling in her throat is probably just because she's too tired. Maybe she should just go downstairs and get another cup of coffee instead. 

-> END


=== hey_wait ===

Ayla: "Hey, Matilda? Isn't this from someone else's paper?" 

Matilda: "Oh, that part? It's just a couple of sentences. I liked how they phrased it, and I was pretty short on time." 

* [Let it go] -> ignore
* [Call Matilda out] -> no

-> DONE


=== ignore ===

Matilda's right, it's just the phrasing of a couple of sentences. It's not like the study itself is plagiarised, so it's probably fine. Ayla shrugs and keeps scrolling. 

-> END


=== no ===

Ayla: "You know that's plagiarism, right?"

Matilda: "But it's just the phrasing! And it's only a couple sentences, I don't get what your problem is." 

* [She's right] -> rip
* [She's wrong] -> good

-> DONE

=== rip ===

Ayla: "You're right, it's probably fine."
Ayla drops the subject and closes her laptop. She can't shake the feeling that maybe Matilda is wrong, but Matilda has more experience than she does. 

-> END


=== good ===

Ayla: "No, you're wrong. Even just that one part constitutes plagiarism. I can see that you didn't credit them in the paper. I really don't think we can submit this in good faith!"  

-> END















