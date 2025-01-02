Server.default.options.device_("Scarlett Solo USB");
("Setup/Setup.scd").loadRelative;


~soundin = {SoundIn.ar(0,mul:0.5)}

~soundin2 = {Pan2.ar(~soundin)}
~soundin.play
~soundin2.stop

~soundin3 = {SoundIn.ar(1,mul:0.5)}

~soundin4 = {Pan2.ar(~soundin3)}
~soundin4.play
~soundin4.stop

~verb = {FreeVerb.ar(~soundin4.ar)}
~verb.play


~grainin = {GrainIn.ar(2, Dust.kr(20), LFNoise1.kr(0.2).range(0.0025, 0.25), ~soundin4.ar + ~panalan.ar*0.75, LFNoise1.kr(10),mul: 1.1)}
~grainin.play
~grainin.stop



~sin = {SinOsc.ar([80,82],0,0.25)}
//a pulse wave
~pulse = {Pulse.ar([20,21],SinOsc.kr(0.1).range(0.01,1),0.25)}
//a new proxy multiplying sine and pulse waves
~sinpulse = {~sin.ar * ~pulse.ar}
~sinpulse.play

~sin.play
~sin.stop

~sinpulse.stop

//~delay2 = {CombC.ar(~sinpulse.ar + ~panalan.ar*0.5,1,LFNoise1.kr(0.1).range(0.1,0.3),4)}
~delay2.play
~delay2.stop

~pulse2 = {Pulse.ar([40,41],SinOsc.kr(0.1).range(0.001,0.1),0.25)}
~pulse2.play;
~pulse2.stop

(
~pulse2.stop;
~delay2 = {CombC.ar(Mix.ar([~sinpulse.ar, ~sin.ar, ~soundin2.ar, ~soundin4.ar]),1,LFNoise1.kr(0.1).range(0.1,0.3),4,1)};
)

b = Buffer.read(s, "/Users/aaronbrown/Downloads/Alan Watts - What Is Reality?.mp3");

~alan = {PlayBuf.ar(2, b, SinOsc.kr(0.5).range(BufRateScale.kr(b)), loop: 1.0)}
~alan.play
~alan.stop

~panalan = {Pan2.ar(~alan.ar, LFSaw.kr(0.1),1.5)}
~panalan.play
~panalan.stop



