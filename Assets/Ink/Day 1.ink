-> Map

=== Map ===
* [Deak] -> Deak
* [Mom] -> Mom
* [Dad] -> Dad
* [END GAME] -> done




=== Deak ===
D: "Hey buddy, nice skateboard shoes! Show me a kick flip!"

+  [Attempt a flip] -> flip
+  [Ignore] -> Map
+ {crying == 1} [Piece of shit, are you messing around with my mom?] -> sleep

== sleep ==
I wish, buddy. Haha, just kidding! Whoa, just kidding. 
Anways dude, I gotta run.
Your mom came over early this morning to plan your dad's birthday surprise -- I gotta drive this UHAUL all the way to Jersey City to pick it up!
-> done


== flip ==
D: "Ouch... you gotta practice that more, kid."
  Don't worry, you'll get it right someday!
  Just like I'll get your mom...
  ...whoa, chill out! I mean I'll get your mom the game machine thingy
    + [You're getting my mom what?] -> present

-> done

== present ==
D: "You tell me! I don't know anything about nerd things.
She said something about surprising your daddy.
I guess it's chubby hubby's birthday tomorrow?
Whoops, don't tell her I told you, k?
  + ["Whatever, Deak. I'm going home."] -> Map
  + ["..."] -> Map







=== Dad ===
...dad is scrubbing dishes...
Is there a tension in the room?...
+ ["Dad, is everything okay?"] -> ok
+ {Deak == 1} ["Just talked to Deak, that guy's an asshole."] -> asshole
+ {Mom == 0} ["Dad...where's mom?"] -> wheres_mom
+ Happy Birthday! -> asshole
  
== wheres_mom ==
Dad turns around, with a crazy look.
Don't ask me where that lying, cheating wh--
--> asshole

== ok ==
"Everything's fine. How was school today?"
  School was alright. Hey, happy birthd --
    -> asshole
    

== asshole ==
SMASH!!!
"God dammit!"
   Dad...you're shaking.
   Are you okay?
     "Fucking dammit! These damn dishes! I just..."
        + ["Dad, are you crying?"] -> crying
        + ["Get your act together, Dad."] -> act

== crying ==
D: "I just...I can't take it anymore."
I saw your mother sneaking out of the house this morning.
She was going to that ASSHOLE's house.
I can't do this. I can't be around her right now. -> Map

== act ==
-> Map




== Mom ==
Honey! You're home! Wait till you see the BIRTHDAY SURPRISE I've planned for your father.
+ {Dad == 1} [Dad's really upset, Mom...] -> mad
+ [Another boring tie, huh.] -> tie
+ [I don't care, Mom. Where's my new skateboard?] -> skateboard
+ {present == 1} [Deak said something about a game machine?] -> machine
->done

== machine ==
Deak told you?! That silly man. Good looks are wasted on him, anyways...
-> explain

== mad ==
Mad at me? What on earth could he mad about? 
+ [He saw you sneaking out this morning.] -> sneak
+ [Are you having an affair?] -> affair
-> done

== tie ==
Of course not! It's wayyyyy bigger than that. Huge, actually. My my, sometimes I'm such a good gifter I impress myself.
  What are you standing there for? 
-> Map

== skateboard ==
Honey...no one will like you if you talk that way. Anyways, it's not your birthday. Now run along... -> Map

== sneak ==
Oh honey, you've got it all wrong. It's not that.
I was going to Deak's to ask him to pick up your dad's birthday present for me
-> explain

== explain ==
Can you keep a secret?
...
I got your dad an arcade machine! Not just any machine, a First Edition Street Fighter, your dad's favorite! You don't know how hard it was to find a seller.
+ {Dad == 1} [You should talk to Dad.] -> win
+ {Dad == 1} [Mom...he found out and he thinks you're having an affair.] -> win
+ [That's crazy...how expensive was that?] -> expensive
+ [Huh, surprisingly thoughtful gift, Mom.] -> thoughtful

== expensive ==
Oh, I had to sell his favorite original First Edition Mrs Pac Man to pay for it. You don't think he'll be upset, do you?
+ [...] -> Map

== thoughtful ==
Thank you, I agree. Sometimes I impress myself. -> Map

== affair ==
HA! Me, an affair? A woman my age, honey you flatter me.
+ [Then why are you sneaking around?] -> sneak
+ [Aw, you're not that old...] -> sneak

== win ==
HA! Your dad's such a sensitive soul. All these crazy ideas. Let me go talk to him, it'll clear it all up. Now you go change into your birthday suit.
+ [That's not what that word means, Mom.] -> END
+ [...you're welcome for saving this family, everyone.] -> END





==done==
->END