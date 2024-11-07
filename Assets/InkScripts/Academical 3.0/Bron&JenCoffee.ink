=== bron_jen_coffee ===
# ---
# choiceLabel: Talk to Jensen
# @query
# currentLocation!cafe
# metJensen
# givenQuidProQuo
# @end
# repeatable: false
# tags: action
# ===

// if positive relationship
    // if considered ivy's deal
        //->scenePositiveIvy
    // else
    ->scenePositive
// if neutral relationship
    // if considered ivy's deal
        //->sceneNeutralIvy
    // else
    //->sceneNeutral
// if negative relationship
    // if considered ivy's deal
        //sceneNegativeIvy
    // else
    //->sceneNegative

=== scenePositive ===

Jensen: "Bronislav!" {ShowCharacter("Jensen", "left", "")}

Jensen says as he walks up to you.

Jensen: "I've heard that my feedback on your presentation got me co-authorship."

*["Keep on hustling."]
->KeepOnHustling

*["Here's how you author."]
->HeresHowYouAuthor

*["Only doing it for the job."]
->OnlyDoingItForTheJob

=== scenePositiveIvy ===
Jensen sits down at your table quietly, then eventually speaks up with a smile,

Jensen: "I hope my feedback is helping the paper come along well."

->DONE

=== sceneNeutral ===

Jensen walks up to you happily.

Jensen: "Thank you so much for the advice and opportunity for co-authorship Bronislav. Happy I could help."

*["Keep on hustling."]
->KeepOnHustling

*["Here's how you author."]
->HeresHowYouAuthor

*["Only doing it for the job."]
->OnlyDoingItForTheJob

=== sceneNeutralIvy ===

Jensen: "Hey, Bronislav, I was wondering, am I joining the paper?"

He looks at you with eyes akin to a puppy.

*["Yes, you will be included."]
->YesIncluded

*["No, your feedback wouldn't hold up to review."]
->NoIncluded

=== sceneNegative ===
Jensen sits down across the table from you, setting down his coffee and smiling.

Jensen: "Hey Bronislav, I know we got off on the wrong foot, but I'm happy that you decided to include me as a co-author on your paper."

*["Keep on hustling."]
->KeepOnHustling

*["Here's how you author."]
->HeresHowYouAuthor

*["Only doing it for the job."]
->OnlyDoingItForTheJob

=== KeepOnHustling ===
// + 50 relationshp, Jensen +Hopeful, Bronislav +Bad Advisor
Bronislav: "Keep on hustling Jensen, as long as you put in the work that you have been you'll go far."

*[Shake his hand and leave.]
->ShakeHandLeave


=== HeresHowYouAuthor ===

Bronislav: "Filler text."

->DONE

=== OnlyDoingItForTheJob ===
// +50 relationship, Jensen +Ashamed, Bronislav +Petty
Bronislav: "Look Jensen, you seem like a nice guy so I'll just tell you. Ivy offered me a job opportunity if I put you as a co-author. I'm putting you on here strictly for that job."

*[Get up and leave.]
->GetUpAndLeave

=== YesIncluded ===

Bronislav: "Yes, you will be included."

Jensen's expression shifts to a relieved smile.

Jensen: "Oh, I can't thank you enough."

->DONE

=== NoIncluded ===

Bronislav: "No, your feedback woudln't hold up to review."

His innocent gaze contorts into a naive sadness.

Jensen: "O-Oh, alright. I was really hoping on getting my name on a paper..."

->DONE

=== ShakeHandLeave ===

He shakes your hand with a big smile.

Jensen: "Of course, glad to have a mentor like you Bronislav."

You grab your coffee and leave.

->DONE

=== GetUpAndLeave ===

You abruptly get up and leave after telling Jensen this. He looks deeply ashamed hearing it.

{HideCharacter("Jensen")}

->DONE
