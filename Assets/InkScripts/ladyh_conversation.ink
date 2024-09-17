
VAR sheHasDrink = false
VAR iWantDrink = 0
VAR iHaveDrink =  false

VAR chattishness = 0

LIST LadyHConversationFlags = INSULTED_LADY_H, TOLD_LADY_M_WAS_MISSING, LADY_WAS_MARRIED_ONCE

=== start ===
# ---
# ===

-> drink_with_lady_h -> END 



=== drink_with_lady_h
    LADY:   A drink?
    *      V:  Thank you. 
            LADY:   Steward! Two martinis, please. 
            
            ~ iWantDrink = TURNS()
            LADY:  Make mine filthy.
            
            -> first_order
        
    *      V:  Not for me. 
            LADY:   Well, I'm having one.
        - - (how_i_like_them)   
            LADY:   Steward! You know how I like them! 
            LADY:   As dirty as it comes, please!
        - - (first_order)   
            STEWARD:    Yes, Ma'am!
            
    *       V:      At lunch time?
            LADY:   What? It isn't breakfast. 
            -> how_i_like_them
            
    -   -> start_loop
    
= start_loop
    
    {    
    - not sheHasDrink && not came_from(-> she_sips) && not came_from(-> first_order):
        -> get_a_drink -> 
        
    
    - TURNS() >= iWantDrink + 3 && not iHaveDrink && iWantDrink:
        // if the Steward comes along, it breaks the current conversation 
        
         ~ iWantDrink = 0
        STEWARD:    Here you are, Mrs Villensey. Straight up, with a twist.
        ~ iHaveDrink = true  
        
    - came_from(-> acted): 
        // if you did a physical action, Lady H attempts to continue the previous conversation 
        
        -> she_reacts ->
        
    - else: 
        // otherwise, Lady H tries to say something herself 
        
         -> she_says ->
    }
    
    -> top 
    
= get_a_drink 
    STEWARD:    Here you are, Ma'am. Just as you like it. 
    ~ sheHasDrink = true 
    ->->
        

= top
    
    // conversation options that react to the last thing you talked about come first 
    <- React_opts
     
    {limitToThree():
        // physical actions come second 
        <- main_acts
    }
    
    {limitToThree():
        // other conversation comes in if you've not talked a lot recently, or there's no options yet
        { chattishness < 2 || CHOICE_COUNT() == 0:
            <- Conv_opts 
        }
    }

    // fallback options fill up the slate, and allow us to leave the scene!
    +  {iWantDrink}  { not iHaveDrink}  {limitToThree()}
        [ Wait for my drink ] 
        {shuffle:
        -   V:   Slow, aren't they?
            LADY: Not usually, no.
        -   I drum my fingers on the tabletop.
            Lady H raises an eyebrow.
            I stop. 
        -   V:  I'm so thirsty.
            LADY:   I'm sure it'll be worth the wait, dear. 
        }
           
     
     +  {iHaveDrink} {limitToThree()}
        [ Finish my drink and go ] 
        V:      I need to be going now. 
             I lift my glass and drain it.
        -> bye
        
    
    +   {limitToThree()} 
        [ Leave ] 
        V:  Good bye, Lady H.
        
        {
        
        - iHaveDrink:
            LADY:   You're not finishing your drink? 
            LADY:   ... I really don't blame you. 
        - iWantDrink:
            LADY:   Aren't you waiting for your drink? 
            LADY:   Or I suppose you think I'll want to drink that one too, is that it? 
            ~ reach(INSULTED_LADY_H)

        }
        -> bye 
        
        
    -   -> start_loop        

 
    

 
= she_says 
    // She initiates dialogue using default options
    // Default options have no choice text and are taken automatically by the game when there are no player-facing choices. 
    // The game uses the first valid default choice.

    *   { reached(TOLD_LADY_M_WAS_MISSING) } -> 
        LADY:  You've not found your man, I suppose? 
        * * V:  No. 
            LADY:  How strange. 
            LADY:  I take it you've checked the smoking room?
            * * *   V:    I have. 
            * * *   V:  I'll try that. 
            * * *   V:  No one's seen him. 
            
                
        * * V:  I think he's avoiding me. 
        * * V:  I'm rather worried. 
        - - LADY:  Yes, well. 
            LADY:  It doesn't look good. 
    
    // etc. other things she might say go here 

    // a "sticky fallback" at the end to make sure the flow doesn't die here.
    +   -> 
    
    -   ->->

= she_reacts

    // She reacts using default options
    // these are all designed to fire if you started a conversation in the last-choice-but-one, hence the "one_turn_after" test 

    
    *   { one_turn_after(-> childs)}  -> 
        LADY:   But if I'd had a child I would have called it Marmaduke. 
        LADY:   Marmalade duck for cuddles. 
        
  
    *   (cupboard) {one_turn_after(-> youdont) || one_turn_after(-> dontknowhere) } -> 
        LADY:   He's a lovely young man, he really is. 
        LADY:   If I was twenty years younger, I'd corner him in a cupboard.
               She turns to gulp another eyeful of the young man.

    *   {one_turn_after(-> findoutsoon)} -> 
        LADY:   Just eat a lot of dark fruit. That's my advice.
        
    *   {one_turn_after(-> canihave)} -> 
        LADY:   I'd be gentle with him, you know.
        LADY:   I've got a lot of kindness in me.
        LADY:    People don't always see that.
        
    *   {one_turn_after(-> looker    )} ->
        LADY:   I wasted it all, of course. 
        LADY:   You never know what you've got until it's withered away!
    
    // sticky fallback to make sure we don't get stuck 
    +   -> 
    -   ->-> 
    
= React_opts 
    // Choices for V to respond to the last thing Lady H said 
    // This covers both her spontaneous remarks, and our last conversation

    *   { came_from(-> cupboard)} 
        V:  I don't think that's the done thing? 
        LADY:   Oh, it was in my day, I assure you. 
        LADY:   We had a big house in the country... 
        LADY:   Everyone would come up, and we'd play hide-and-go-seek all day. 
        LADY: Cupboards and tongues from morning till tea-time. 
        LADY: We all went home with the most dreadful 'flus.
        -> drinkie
        
    
    *   (canihave) {came_from(-> lovelyhubby)} 
        V:  Oh, he's not that lovely. 
        LADY:   Well, then, dear, can I have him? 
        
    *   {came_from(-> childs)} 
        V:  But you'd have liked children? 
        LADY:   Well, I don't know, really. 
        LADY:   I like the idea of children. 
        LADY:   The real thing is a bit messy, isn't it? 
        LADY:   Half of them die when they're small... 
        LADY:   ... and the other half belittle you till you die. 
        
   
        
    *   {came_from(-> canihave)} 
        V:  No. As it happens, you can't. 
        LADY:   Suit yourself. 
        LADY:   And really, do, that's my advice. 
        
    *   (youdont)  { came_from(-> get_a_drink) && not she_sips} 
        V:  Did you just wink at him? 
        LADY:   You know, sometimes I even slap him on the behind.
        
     
    
    *   (dontknowhere) {came_from(-> youdont)} 
        V:  You don't! 
        LADY:   I absolutely do. 
        LADY:   He takes it with good grace, I think.
        - - (drinkie)
        { sheHasDrink:
            { shuffle:
            -           She sips her drink oh-so delicately.
            -            She grins and takes a big swig from her glass.
            }
            -> she_sips -> 
        }
        
    *   (myage) {came_from(-> dontknowhere)} 
        V:      That's awful.
        LADY:   You get to my age, my dear, you have to enjoy every second. 
        LADY:   Because the next thing you know, you're stuck for half an hour in the you-know-where. 
        
     
    *   (findoutsoon) {came_from(-> myage) } 
        V:  I'm sure I don't know where. 
        LADY:   Oh, well. You'll find out, soon enough.
        -> drinkie
        
        
    *   {  came_from(-> how_i_like_them) }
        V:  Dirty? 
        LADY:   Oh, filthy. They mix it with brine straight from the sea. 
        
    
    *   {came_from  (-> looker)} 
        V:  You must have had men lining up! 
        LADY:   Oh, yes. The old dance card was always full. 
        LADY:   But one day - poof! None of that seems to matter. 
        LADY:   You pick one, whichever, doesn't matter...
        LADY:   You settle down...
        LADY:   And then ten years later, you come to your senses and it's too late to do a damn thing about it.
       
    -   -> donechat
    
        
= Conv_opts
    // Let's start a conversation. 
    // This scene has two types of conversation: 'sad' questions designed to play on Lady H's feelings; and 'normal' questions that have no emotional affect. 
    // We aim to pick one of each 
    // To mix things up, we make sure they come out in different orders 
    
    { shuffle:
    -   <- sad_qn 
        <- normal_qn
    
    -   <- normal_qn
        <- sad_qn 
    
    }
     
    -> DONE 
    
 = donechat
    // we just spoke. Eventually conversation will take a break. 
    ~ chattishness++
    -> start_loop      
    
     
= sad_qn
    // we want to only pick one choice here. So we record the current choice count and pass this into the 'ranLim' function, which will return false if the CHOICE_COUNT() has changed. 
    ~ temp cnt = CHOICE_COUNT()
    
    // since we're picking at random, we run the conversation block multiple times, to hopefully get a line if there is one! 
    // if this gets slow, we could check 'cnt == CHOICE_COUNT()' before each one. 
    <- sad_questions
    <- sad_questions
    <- sad_questions
    -> DONE
    
- (sad_questions)

    *   (hbb) {ranLim(cnt)}  { not reached(LADY_WAS_MARRIED_ONCE)} 
        V:  Are you married[?], Lady H?
        ~ reach(LADY_WAS_MARRIED_ONCE)
        LADY:  No. Not any more. 
        LADY:  But I rather liked it when I was. 
       
    *   (childs){ranLim(cnt)} 
        V:  Do you have any children[?], Lady H?
        
        LADY:  Do you know, my dear, but I never did?
        LADY:  I meant to, but somehow the moment never arose...
        LADY:  ... and then, of course, it was too late. 
        
        
    *  (looker) {ranLim(cnt)} 
        V:  You must have been stunning in your youth. 
        LADY:   What a mean-spirited thing to say! 
        LADY:   But yes, I was rather a _looker._
            
    
    // etc.
        
        
-  (quizzed) 
    // in the real game, we alter her emotional state a little here. 
    ->  donechat
    

= normal_qn
    // Normal questions use the same system as the sad questions 
    
    ~ temp cnt = CHOICE_COUNT()
        
    <- normal_questions
    <- normal_questions
    <- normal_questions
    -> DONE
    
- (normal_questions)
    
    *   { sheHasDrink} { not iHaveDrink } {ranLim(cnt)} 
        { not she_sips } { iWantDrink } 
        V:  Please, don't wait for me. 
                She doesn't.
        -> she_sips -> 
       
    *   {ranLim(cnt)} 
        V:  Have you made this crossing before?
        LADY:  Oh, yes. 
        LADY:  My fourth or fifth time. 
        LADY:  I can simply never decide where I want to be! 
    
    *   {ranLim(cnt)}  V:  Do you work[?], Lady H?
        LADY:  My goodness me, no. 
        LADY:  I sometimes think it might have been fun if I had...
        LADY:   But all these young people are so busy. 
        LADY: It seems a shame to take that from them.
    
    // etc. 
        
    -   ->  donechat 
 

= main_acts 

    // Physical actions. In the main game, there's a whole plot here but for this example 
    // let's keep it simple. 
    
    // again, we only want to pick one option
    ~ temp cnt = CHOICE_COUNT()
   
    *  {iHaveDrink} {oneChoice(cnt)}  
        [ Stir my drink ] 
        I push the olive around my glass. 
    
    *   {oneChoice(cnt)}  [ Look around ] 
        I glance around the restaurant. There's no one else here. 
    
    *   {oneChoice(cnt)}  [ Flip a coaster ] 
        I put a coast on the edge of the table, and flip it. 
        LADY:   Well, really!

    *   {iHaveDrink} {sheHasDrink}  { not sipdrink } {oneChoice(cnt)} 
        V:   Cheers!
        LADY:   Your very good health. 
        -> sipdrink
        
    *   { not iHaveDrink} { not iWantDrink  } 
        V:  Maybe I will have that drink. 
        ~ iWantDrink = TURNS() 
        LADY:   Steward! One for indecisive the young lady!
        
    *   {iHaveDrink} {sheHasDrink}   {oneChoice(cnt)}
        V:  Well. Bottom's up!
        -> sip_mine -> 
        
    +   (sipdrink) {iHaveDrink} { sipdrink || not sheHasDrink}
        {oneChoice(cnt)}  { not seen_very_recently(-> sip_mine)} 
        [ Sip my drink ] 
        -> sip_mine ->
        
    -   -> acted 
    
= acted 
    // Physical actions reset our desire to talk
    ~ chattishness -= 2
    -> start_loop
    
= sip_mine 
    { not sheHasDrink:
        { stopping:
        -           I sip my drink while Lady H watches thirstily. 
        -   V:      Delicious. 
        -           I take a sip. 
        }
    - else: 
        { cycle:
        -           I take a sip, and Lady H sips hers.
        -           We clink our glasses and sip.
        }
        -> she_sips 
    }
    ->->
    
    
= she_sips 
    
    { shuffle:
    -   LADY: Chin chin.
    -   LADY:   Your health, dear.
    -   { stopping:
        -   -> lovelyhubby ->  
        -   LADY:    Here's looking at you. 
        }
    -   LADY:   {~Ducks a-dabbling!|Owls in the hole!}
    }

    ->->

// break this out so we test for saying it, and react to it 
= lovelyhubby 
    LADY:   Here's to you and that lovely husband of yours, anyway. 
    ->->
    
= bye 
    { reached(INSULTED_LADY_H):
        LADY:  Well, I don't care what you think of me!
    - else:
        
        LADY:  Good bye, Mrs Villensey. 
    }
    
    ->->

    
 
/*-------------------------------------
 
    Systems 
 
------------------------------------*/

// FLOW QUERIES 
// What did we just say? 

=== function seen_ever(->x)
    // has this piece of content ever been seen?
    ~ return TURNS_SINCE(x) >= 0 

=== function came_from(-> x) 
    // were you at "x" during this turn
    ~ return TURNS_SINCE(x) == 0
    
=== function one_turn_after(-> x) 
    // were you at "x" during the last turn (or this one)
    ~ return TURNS_SINCE(x) <= 1 && seen_ever(x)
    
=== function seen_very_recently(-> x)
    // did we see this line recently?
    ~ return TURNS_SINCE(x) <= 3 && seen_ever(x)
    
// DISTRIBUTION 
// We often want to pick dialogue lines a bit randomly, but without getting too many of them 
// We build a few convenience functions for this:

// Return a probability of 33%
=== function maybe() 
    ~ return RANDOM(1, 3) == 1
    
// don't allow this choice if we've got other choices from this section    
=== function oneChoice(choiceCount) 
    ~ return choiceCount == CHOICE_COUNT()
    
// Used to randomly pick one choice from a block of options
=== function ranLim(choiceCount)  
    ~ return oneChoice(choiceCount) && maybe()

=== function limitToThree() 
    // Overboard's house style is to limit every moment to 3 choices maximum 
    // We actually do this in the UI, but you can do it in inky if you want to
    ~ return CHOICE_COUNT() < 3 


// KNOWLEDGE TRACKING
// Overboard uses a knowledge tracking system 
// built on two core tests, "reached" and "between"
// This isn't the place to detail the system fully, but here's a basic version of the code, to allow the above example to work!

VAR allTrueStates = () 
=== function reach(x) 
    ~ allTrueStates += x
=== function between(x, y) 
    ~ return reached(x) && not reached(y) 
=== function reached(x) 
    ~ return allTrueStates ? x 

