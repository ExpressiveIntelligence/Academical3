// The resolution thread content from Academical 2.0
// The content has been modified from its orginal
// form to better fit with Ink/Anansi's writing idioms

=== resolution_intro ===

Brad: "So about the surveys I conducted."

Brad: "We didn't break any laws but I see now that I really messed up."

-> what_is_the_plan

-> DONE

=== what_is_the_plan ===

Ned: "I just want to know that you understand the seriousness of what you've done."

Ned: "What is our plan for proceeding with the project?"

*Show that he has learned
    -> resolution_complete
*Assert understanding
    -> bread_thinks_ready
*Ask more questions
    -> brad_not_ready

-> DONE


=== bread_thinks_ready ===

Brad: "I understand, Ned, the IRB seems pretty important based on what you're saying. I messed up."

* Listen to Ned
    -> try_again

-> DONE

=== brad_not_ready ===

Brad: "This conversation has been useful, but I still have some more questions about the IRB"

* Listen to Ned
    -> try_again

-> DONE

=== try_again ===

Ned: "I think we still have more to discuss"

-> DONE

=== resolution_complete ===

Brad: "Well, it's important that an outside entity, the IRB, has approved that our study is complying with informed consent practices such that it maintains respect for persons, beneficence, and justice."

Brad.confident: "Did I get that right?"

Brad: "We should immediately stop the survey, get rid of any data I already collected, and inform the IRB that I made this mistake."

Brad: "It's going to set us back."

* Fin
    -> END

-> DONE

=== end ===

Ned: "That sounds right to me, I'm glad you listened today Brad."

Ned: "This could have been really bad, but I'm glad we caught it now."

-> DONE
