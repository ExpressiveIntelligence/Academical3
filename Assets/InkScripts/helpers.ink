/*

Helpers
=======

This file contains helper functions and data types to
help writers interface with the social system.  It is
based on the "Mocks.ink" file in our Google Drive.

*/

// Threshold scores for character opinions
// Character opinions are on an interval from [0, 255]
// Splitting the score into thresholds allows writers to
// focus on the general state of the relationship instead
// of the numbers.
CONST THRESH_TERRIBLE = 0
CONST THRESH_BAD = 30
CONST THRESH_NEUTRAL = 90
CONST THRESH_GOOD = 165
CONST THRESH_EXCELLENT = 225

// Below, we use an Ink list to define the enumeration of possible
// opinion states ranging from terrible to excellent
LIST OpinionState = Terrible, Bad, Neutral, Good, Excellent

// This function returns the opinionStat that corresponds to the
// current opinion score tracked within C# and Unity.
=== function GetOpinionState(from, to) ===
    ~ temp score = GetOpinion(from, to)
    {
        - score >= THRESH_EXCELLENT:
            ~ return OpinionState.Excellent
        - score >= THRESH_GOOD:
            ~ return OpinionState.Good
        - score >= THRESH_NEUTRAL:
            ~ return OpinionState.Neutral
        - score >= THRESH_BAD:
            ~ return OpinionState.Bad
        - else:
            ~ return OpinionState.Terrible
    }
