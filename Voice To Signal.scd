Server.default.options.device_("Scarlett Solo USB");
("Setup/Setup.scd").loadRelative;
s.record;

(
b = Buffer.read(s, "/Users/aaronbrown/Documents/GitHub/Voice-To-Signal/Alan Watts - What Is Reality?.mp3");
~alan = {PlayBuf.ar(2, b, SinOsc.kr(0.05).range(BufRateScale.kr(b)/1.1), loop: 1.0)};
~panalan = {Pan2.ar(~alan.ar, SinOsc.kr(0.05),2.25)};
)

(
~soundin = {SoundIn.ar(1,mul:0.5)};
~mic = {Pan2.ar(~soundin.ar,0)};
~verb = {FreeVerb.ar(~mic.ar)};
~grainin = {GrainIn.ar(2, Dust.kr(20), LFNoise1.kr(0.2).range(0.0025, 0.25), ~mic.ar + ~panalan.ar*0.25, LFNoise1.kr(10).range(-0.75,0.75),mul: 1.1,)};
~sin = {SinOsc.ar([80,82],0,0.25)};
~pulse = {Pulse.ar([20,21],SinOsc.kr(0.1).range(0.01,1),0.25)};
~sinpulse = {~sin.ar * ~pulse.ar};
~pulse2 = {Pulse.ar([40,41],SinOsc.kr(0.1).range(0.001,0.1),0.25)};
~delay = {CombC.ar(Mix.ar([~sinpulse.ar, ~pulse2.ar, ~sin.ar]),1,LFNoise1.kr(0.1).range(0.1,0.3),4,0.5)};
~delay2 = {CombC.ar(Mix.ar([~grainin.ar, ~verb.ar]),1,LFNoise1.kr(0.1).range(0.1,0.3),4,0.5)};
)


(
~verb.play;
~grainin.play;
~sin.play;
~delay.play;
~delay2.play;
~panalan.play;
)

s.freeAll;






