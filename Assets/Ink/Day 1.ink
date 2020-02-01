VAR dad_score = 0

-> Map

=== Map ===
(YOU ARE AT THE MAP.)
* [Deak the Neighbor] -> Deak
* [Mom] -> Mom
* [Dad] -> Dad
* [END GAME] -> done




=== Deak ===
{
    -Dad==1:
        ~dad_score++
}
D: "Hey kiddo, nice skateboard shoes! Show me a kick flip!"

+  [Attempt a flip] -> flip
+  [Ignore] -> Map
+ {crying == 1} [Piece of shit, are you messing around with my mom?] -> sleep

== sleep ==
"Whoa, buddy! Hey, calm down! What are you talking about??" 
+ [My dad's seen you sneaking around with her!] ->sneak_around
+ [Don't lie to me, asshole.] -> lie

== lie ==
"You need to watch what you say, kid. Get outta here."
-> Map

== sneak_around ==
"You mean our early-morning meetups? That's just, well, can you keep a secret?"
+ [Get lost, Deak.] -> lie
+ [Tell me what's going on.] -> going_on

== going_on ==
"Your mom and I have been meeting up all this week to plan your dad's birthday surprise party -- we've got guests coming in, and I gotta drive this UHAUL all the way to Jersey City to pick up the centerpiece! Wait till your dad sees his big gift!"
-> Map


== flip ==
D: "Oof... needs some practice, kid."
  Don't worry, you'll get it right someday!
  So anyways, don't tell your dad, but your mom and I are planning a secret surprise for your dad!"
    + [What's the surprise?] -> present

-> done

== present ==
D: "It's a vintage arcade machine! We've been planning in secret for weeks."
"And today's finally the day! I'm driving my truck over to pick it up right now."
"Anyways, don't tell her I told you, k?"
  + ["My lips are sealed."] -> Map
  + ["Yeah, if you give me 5 bucks."] -> fiver
  
== fiver ==
"Does your mother know she raised a con artist? Get outta here."
-> Map








=== Dad ===
~dad_score++
...dad is scrubbing dishes...
Is there a tension in the room?...
+ ["Dad, is everything okay?"] -> ok
+ {Deak == 1} ["I just ran into Deak outside."] -> asshole
+ {Mom == 0} ["Dad...where's mom?"] -> wheres_mom
+ [Happy Birthday!] -> asshole
  
== wheres_mom ==
Dad turns around, with a crazy look.
--> asshole

== ok ==
"Everything's fine. How was school today?"
  School was alright. Hey, happy birthd --
    -> asshole
    

== asshole ==
SMASH!!!
"God dammit!"
   Dad...
   Are you okay?
     "I'm fine! I dropped a dish. I'm fine..."
        + ["Dad, what's wrong?"] -> crying
        + ["Get your act together, Dad."] -> act

== crying ==
D: "I just...I can't stop thinking about it."
"I saw your mother sneaking out of the house this morning."
"I watched her. She went to Deak's house."
"I just, is this crazy? Is something going on? My wife and my best friend? Is it..."
+ {explain == 1} [Wait Dad, it's all a misunderstanding.] -> wait
+ [It's okay. It's probably nothing.] -> too_late
+ [Yeah, I always thought mom and Deak were...off.] -> off


== off ==
"No...oh no...this isn't happening."
"I'm sorry, son. I think I need some space." 
-> Map

== wait ==
Mom was getting you a birthday gift!
  "I don't believe you. Why doesn't mom tell me herself? Where is she?"
-> too_late

== act ==
-> Map

== too_late ==
Sigh.
"I don't know, son. I think I need some space."
-> Map




== Mom ==
"Honey! You're home! Wait till you see the BIRTHDAY SURPRISE I've planned for your father."
+ {Dad == 1} [Dad's really upset, Mom...] -> mad
+ [Oooh, what surprise?] -> what_surprise
+ [I don't care, Mom. Where's my new skateboard?] -> skateboard
+ {present == 1} [Deak said something about an arcade machine?] -> machine
->done

== machine ==
"Deak told you?! That dummy! Never shuts up his big mouth."
-> explain

== mad ==
"Upset? What on earth could he upset about?" 
+ [He saw you sneaking out this morning.] -> sneak
+ [Are you having an affair?] -> affair
-> done

== what_surprise ==
"Just wait till you see! It's big, it's rare, your dad's gonna love it. My my, sometimes I'm such a good gifter I impress myself."
-> Map

== skateboard ==
"Honey...no one will like you if you talk that way. Anyways, it's not your birthday. Now run along... "
-> Map

== sneak ==
"Oh honey, you've got it all wrong. It's not that."
"I was going to Deak's to ask him to pick up your dad's birthday present for me"
-> explain

== explain ==
"Can you keep a secret?"
...
"Deak and I got your father an arcade machine! Not just any machine, a First Edition Street Fighter! Deak knows this vintage game dealer, so he helped me cut a deal. It's all very hush hush."
+ {Dad == 1} [You should talk to Dad.] 
  { dad_score == 2:
        It's too late. Your dad has left the house in a fit of rage.
        -> done
  - else:
        -> win
  }
+ {Dad == 1} [Mom...he thinks you're having an affair.]
    { dad_score == 2:
        It's too late. Your dad has left the house in a fit of rage.
        -> done
    - else:
        -> win
    }
+ [That's crazy...how expensive was that?] -> expensive
+ [Really thoughtful gift, Mom.] -> thoughtful

== expensive ==
Oh, I had to sell his favorite original First Edition Mrs Pac Man to pay for it. You don't think he'll be upset, do you?
+ [...] -> Map

== thoughtful ==
"I know, honey. Sometimes I impress myself." -> Map

== affair ==
"HA! Me, an affair? A woman my age, honey you flatter me."
+ [Then why are you sneaking around?] -> sneak
+ [Aw, you're not that old...] -> sneak

== win ==
"HA! Your dad's such a sensitive soul. All these crazy ideas. Let me go talk to him, it'll clear it all up. Now you go change into your birthday suit."
+ [That's not what that word means, Mom.] -> END
+ [...you're welcome for saving this family, everyone.] -> END





==done==
GAME OVER
+ [RESET] -> Map
+ [END GAME] ->END