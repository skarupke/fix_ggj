Talk to: Deak 1
-> Deak
=== Deak ===
D: "Hey buddy, nice skateboard shoes! Show me a kick flip!"
+  Attempt a flip -> flip
+  Ignore -> ignore
== flip ==
D: "Ouch... you gotta practice that more, kid."
  Don't worry, you'll get it right someday!
  Just like I'll get your mom...
  ...a present! 
    + Why...are you getting my mom a present? -> present
-> done
== present ==
D"Not her, bro. Your dad! It's chubby hubby's birthday!
I'm helping her plan a surprise birthday...
whoops, don't tell her I told you, k?
  + "Whatever, Deak. I'm going home." -> Dad
  + "..." -> Dad
== home ==
-> done
== ignore ==
-> done
Talk to: 1. Deak 2. Dad
=== Dad ===
...dad is scrubbing dishes...very concentrated...is he muttering under his breath? You feel something's not quite right...
  + "Dad, is everything okay?" -> ok
  + "Just talked to Deak, that guy's an asshole." -> asshole
  + "Dad...where's mom?" --> wheres_mom
== wheres_mom ==
--> done
== ok ==
"Everything's fine. How was school today?"
  School was alright. Ran into Deak outside, what's with that guy?
    -> asshole
== asshole ==
SMASH!!! Dad drops a dish
"God dammit!"
   Dad...you're shaking.
   Are you okay?
     "Fucking dammit! These damn dishes! I just..."
        + "Dad, are you crying?" -> crying
        + "Get your act together, Dad." -> act
== crying ==
"I just...I can't take it anymore."
-> done
== act ==
-> done
==done==
->END
