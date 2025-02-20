// Author: Ivy Dudzik
=== BHS2_sceneStart ===
# ---
# choiceLabel: Meet with Hendricks.
# @query
# Seen_BHS1
# @end
# tags: action, library, auxiliary
# repeatable: false
# ===

Hendricks lets out a sigh as she sits next to you, surely coming from a boring meeting or a long talk with a student. 

She smiles gently as she turns her full attention to you.

// {DbInsert("Seen_BHS2")}

// {ShowCharacter("Hendricks", "left", "")}

*[""]
->BHS2_2

=== BHS2_2 ===


// {HideCharacter("Hendricks")}

->DONE
