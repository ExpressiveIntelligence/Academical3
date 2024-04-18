=== outside ===

Brad reaches the door of his advisor's office and pauses. 

He wipes the sweat from underneath his glasses and takes a deep breath, trying to calm his racing heart. 

Could he even come clean?

* [Think about meeting with Ned]
    -> grill
* [Think about coming clean]
    -> play_off

-> DONE

=== grill ===


Ned had a reputation for being passionate, but not unfair. He'd always been a bit tough on Brad. He was sharp and wil find out eventually. 
 
But… maybe he doesn’t need to come clean. It's Ned's fault that the approval took so long to submit, and Brad is running out of time.

* [Enter the office] 
    -> enter

-> DONE


=== play_off ===

Brad knows it’s better to come clean about his mistake, but the delay had jeopardized his progress. 

He could lay this down carefully to Ned, and tell him that he was on track, without elaborating on what that meant. 

Brad grips the doorknob a little tighter and makes a decision: he’ll tell the truth, just not the whole truth.

* Enter the office
    -> enter

-> DONE

=== enter ===

Ned clearly hadn’t missed Brad’s late arrival. No more stalling. Brad squares his shoulders and shuts the door behind himself.

* [Greet Ned]
    -> youre_late


=== youre_late ===

// content from the "youre_late" fragment

ned.cheerful: "Ah, there you are!"

ned.cheerful: "I was beginning to wonder if we'd canceled this week."

// content from the "no_worries" fragment

ned.smiling: "It's just us today, but I do have a time limit. I have a lecture right after this, so we’ll have to make this quick."

* [Blame the busses]
    -> doubt
* [Comment on the busses]
    -> relief


-> DONE

=== doubt ===

Brad can't tell if Ned doesn’t care or is just trying to relieve the tension. 
 
brad.uncomfortable: "There was a problem with the buses..."

-> remind

=== relief ===

Ned seems like he's in a good mood. Maybe this will be easier than expected.
 
brad.smiling: "Sorry for being late, Ned, you know those buses never run on time."
 
Ned nods understandingly.
 
ned.smiling: "You're right, they run on wheels"

The tension in the room eases, and Brad feels relieved. 

* [Direct attention to Ned.]
    -> remind

=== remind ===

Ned interrupts Brad's train of thought. 

ned: "Remind me where you're at again? Were you able to start on those surveys yet?"

He pauses, and with some emphasis adds 

ned: "Or are we still sitting on them?" He glances at his stack of notes, possibly annoyed. 

ned: "I think we had decided we wanted to interview the children as well as their parents, is that right?"

* [Move on to the agenda]
    -> agenda_start

-> DONE