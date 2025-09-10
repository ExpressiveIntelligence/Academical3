/*

Helpers
=======

This file contains helper functions and data types to
help writers interface with the social system.  It is
based on the "Mocks.ink" file in our Google Drive.

*/

// Threshold scores for character opinions
// Character opinions are on an interval from [0, 100]
// Splitting the score into thresholds allows writers to
// focus on the general state of the relationship instead
// of the numbers.

CONST THRESH_BAD = 0
CONST THRESH_NEUTRAL = 40
CONST THRESH_GOOD = 60

// Below, we use an Ink list to define the enumeration of possible
// opinion states ranging from terrible to excellent
LIST OpinionState = Terrible, Bad, Neutral, Good, Excellent

// This function returns the opinionState that corresponds to the
// current opinion score tracked within C# and Unity.
=== function GetOpinionState(from, to) ===
    ~ temp score = GetOpinion(from, to)
    {
        - score >= THRESH_GOOD:
            ~ return OpinionState.Good
        - score >= THRESH_NEUTRAL:
            ~ return OpinionState.Neutral
        - else:
            ~ return OpinionState.Bad
    }
