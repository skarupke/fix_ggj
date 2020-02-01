-> Map

=== Map ===
+ Deak -> Deak
+ Mom -> Mom
+ Dad -> Dad





=== Deak ===
D: "Hey buddy, nice skateboard shoes! Show me a kick flip!"

+  Attempt a flip -> flip
+  Ignore -> Map
+ {crying == 1} Piece of shit, are you messing around with my mom? -> sleep

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
    + Why...are you getting my mom a game machine? -> present

-> done

== present ==
D: "You tell me, kid! I don't know anything about nerd things.
She said something about surprising your daddy.
I guess it's chubby hubby's birthday tomorrow?
Whoops, don't tell her I told you, k?
  + "Whatever, Deak. I'm going home." -> Map
  + "..." -> Map







=== Dad ===
Home
...dad is scrubbing dishes...
Is there a tension in the room?...
+ "Dad, is everything okay?" -> ok
+ {Deak == 1}"Just talked to Deak, that guy's an asshole." -> asshole
+ "Dad...where's mom?" -> wheres_mom
  
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
        + "Dad, are you crying?" -> crying
        + "Get your act together, Dad." -> act

== crying ==
D: "I just...I can't take it anymore."
I saw your mother sneaking out of the house this morning.
She was going to that ASSHOLE's house.
I can't do this. I'm leaving. I'm sorry, your mother brought this on us. She's broken this family.
-> Map

== act ==
-> Map




== Mom ==
Honey! You're home! Wait till you see the SURPRISE I've planned for your father.
+ {Dad == 1} Mom, I think Dad's mad at you... -> mad
+ It better not be another boring tie. -> tie
+ I don't care, Mom. Where's my new skateboard? -> skateboard
->done

== mad ==
Mad at me? What on earth could he mad about? 
+ He saw you sneaking out this morning. -> sneak
+ Are you having an affair? -> affair
-> done

== tie ==
Of course not! It's wayyyyy bigger than that. Huge, in fact. Oh, sometimes I wonder if I get too carried away with these things.
  What are you standing there for? 
-> Map

== skateboard ==
Honey...no one will like you if you talk that way. Anyways, it's not your birthday. Now run along... -> Map

== sneak ==
Oh honey, it's not that. You know, I was going to Deak's to ask him to pick up your dad's birthday present for me! Can you keep a secret?
...
It's an arcade game! The original 1988 version of Street Fighter, your dad's favorite! You don't know how hard it was to find a seller.
+ You should talk to Dad. -> win
+ Mom...he found out and he thinks you're having an affair. -> win
-> done

== affair ==
HA! Me, an affair? A woman my age, honey you flatter me.
+ Why are you sneaking around? -> sneak
+ You're not that old, mom. -> sneak

== win ==
HA! Your dad's such a sensitive soul. All these crazy ideas. Let me go talk to him, it'll clear it all up. Now you go change into your birthday suit.
+ That's not what that word means, Mom. -> END
+ ...you're welcome for saving this family. -> END





==done==
->END