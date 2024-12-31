Server.default.options.device_("Scarlett Solo USB");
("Setup/Setup.scd").loadRelative;

~sin = {SinOsc.ar([80, 82],mul: 0.1)}
~sin.play
~sin.stop

~grain = {GrainIn.ar(2, Dust.kr(15), LFNoise1.kr(0.1).range(0.025, 0.25), ~sin, LFNoise1.kr(10))}
~grain.play
~grain.stop

~soundin = {SoundIn.ar(mul:0.25)}

~soundin2 = {Pan2.ar(~soundin)}
~soundin2.play
~soundin2.stop

~grainin = {GrainIn.ar(2, Dust.kr(15), LFNoise1.kr(0.2).range(0.025, 0.25), ~soundin , LFNoise1.kr(10))}
~grainin.play
~grainin.stop