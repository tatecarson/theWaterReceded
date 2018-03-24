//Synthesizers
SynthDef(\pad, {
	|dur = 1, envgendivisor = 8, freq = 512, gate = 1,
	kbnmul = 0.005, peak = 1, boost = 3, amp = 1, out|

	var env			=	Env.sine(dur, peak);
	var envgen	    =	EnvGen.kr(env, gate, doneAction: 2);
	var kbn1		=	LFBrownNoise0.kr(freq, mul: kbnmul, add: 1);
	var saw1		=	LFSaw.ar(freq * kbn1, mul: (envgen / envgendivisor));
	var kbn2		=	LFBrownNoise0.kr(freq, mul: kbnmul, add: 1);
	var saw2		=	LFSaw.ar((freq + 0.1) * kbn2, mul: (envgen / envgendivisor));
	var kbn3		=	LFBrownNoise0.kr(freq, mul: kbnmul, add: 1);
	var saw3		=	LFSaw.ar((freq - 0.1) * kbn3, mul: (envgen / envgendivisor));
	var rlpf		=	RLPF.ar(saw1 + saw2 + saw3, freq * 1.5, 0.5, mul: envgen / 2);
	var deci		=	Decimator.ar(saw1 + saw2 + saw3, rate: 12000, bits: 8, mul: envgen);
	var kbn4		=	LFBrownNoise0.kr(mul: 0.5, add: 1);
	var hpffrq		=	(freq * 1 * kbn4).clip(100, SampleRate.ir / 3);
	var kbn5		=	LFBrownNoise0.kr(mul: 0.75, add: 1).clip(0.01, 1);
	var rhpf		=	RHPF.ar(deci, hpffrq, kbn5, mul: envgen * 0.2);
	Out.ar(out, rlpf + (rhpf * 0.2) * boost * amp);
}).add;

SynthDef(\kords2, { | freq = 512, gate = 1, level = 0.1, ratio = 1.125, dur = 1, out, amp = 1|
	/*var env		= 	Env.asr(attackTime: 0.5, sustainLevel: level, releaseTime: 0.5, curve: 0);*/
	var env			=	Env.sine(dur, 1);
	var envgen	=	EnvGen.kr(env, gate, doneAction: 2);
	var sfreqs	=	[freq, freq + 0.2];
	var bn		=	LFBrownNoise0.ar(sfreqs, mul: envgen / 2);
	var kbnf	=	LFBrownNoise0.kr([freq, freq], mul: 0, add: 1);
	var kbna	=	LFBrownNoise0.kr([freq, freq] / 16, mul: [0.75, 0.75], add: 1);
	var layers	=	16;
	var frqs	=	Array.fill(layers, { arg i; (sfreqs * kbnf) + (sfreqs * i * ratio * kbnf) });
	var amps	=	Array.fill(layers, { arg i; (1 / (((i + 1) * ratio) * 32)) * kbna });
	var rt		=	Array.fill(layers, { 0.3 });
	var klank	=	DynKlank.ar(`[frqs, amps, rt], bn);
	Out.ar(out, klank * amp).clip(-0.9, 0.9);
}).add;

SynthDef(\ping, { |a = 1, amp = 0.2, ampmodfreq = 50, dur = 1, freq = 440, out|
    var env     = Env.new([0, amp, amp * 0.5, 0], [0.0001, 0.05, dur - 0.0001 - 0.05], \sine);
    var envgen  = EnvGen.kr(env, doneAction: 2);
    var sin     = SinOsc.ar(freq ! 2, mul: envgen);
    var noiz    = Gendy2.ar(minfreq: freq * 0.5, maxfreq: freq, mul: envgen).fold2(amp);
    var filter1 = RHPF.ar(sin, (freq * 2).clip(50, 44100 / 2.5), 0.25);
    Out.ar(out, filter1 * 24);
}).add;


SynthDef(\bass, {|ffreq = 0.3, osc1 = 50, osc2 = 100, trem = 5, amp = 0.0, out|
	var env, sig, pan;

	env = LFPar.ar(ffreq,add:1);
	sig = Mix.new([SinOsc.ar(osc1)*env,SinOsc.ar(osc2)*env])*Saw.ar(trem)*0.5;
	pan = Pan2.ar(sig, 0);
	Out.ar(out, pan*amp)
}).add;


SynthDef(\femsound,{|out=0, pan=0.0, amp=0.05, freq=440, dur= 0.1, resonance=0.5, original=0.0,
                    curve = 1, ffreq = 440, bwr = 1, femadjust = 1|
	var sound,env, filter;
	sound = VarSaw.ar(freq)*Line.kr(1,0,0.1);
	sound = sound + Blip.ar(freq,XLine.kr(1,100,0.03))*Line.kr(1,0,0.1);
	sound = (original*sound)+ LPF.ar(Klank.ar(`[freq*[1,2.1,3.3,5,6.7],0.2!5,[1.0,0.6,0.7,0.2,0.5]*resonance],
           sound),2000+(amp*18000));
	env = EnvGen.ar(Env([0,1,0.2,1,0],[0.001,0.003,0.001,dur], curve),doneAction:2);
    filter = Resonz.ar(sound, ffreq, bwr, 1);
	Out.ar(out, Pan2.ar(filter*env*amp*femadjust,pan))
}).add;

SynthDef(\snap, { | curve = -512, dur = 1, freq = 400, im = 1, level = 0.2, out, rt = 0.1 |
	var env				=	Env.new([0, level, level / 40, 0], [0.005, 0.005, dur], curve: 'cubed');
	var envgen			=	EnvGen.kr(env, doneAction: 2);
	var fbs				=	FBSineC.ar(freq: freq, im: [im, im + 1], mul: envgen);
	var flt				=	RHPF.ar(fbs, 2000, 0.5);
	Out.ar(out, flt);
}).add;

//Effects
SynthDef(\satan, {
	arg envTime = 1.0e-3, knee = -10.dbamp, out, in, mix = 1, amp = 0.1;
	var sig, inSig = In.ar(in, 2);
	sig = DelayC.ar(inSig, 0.01, envTime * 0.5) *
				EnvFollow.ar(inSig, 1 - (envTime * SampleRate.ir).reciprocal).max(knee).reciprocal;
	sig = sig * amp;
	Out.ar(out, (1 - mix) * inSig + (sig * mix));
}).add;

SynthDef(\reverb, { |out, in, damp = 0.5,
	delayTime = 10, size = 1, diff = 0.2, feedback = 0.2|
	var sig, inSig = In.ar(in, 2);
	Out.ar(out, Greyhole.ar(inSig, delayTime, damp, size, diff, feedback));
}).add;

//Ambisonics
{
	~spreadEncoder = FoaEncoderKernel.newSpread;
	~diffuseEncoder = FoaEncoderKernel.newDiffuse;
	2.wait;
    s.sync;

	//coordinates for speakers
	~azArray = [-0.454,0.454,0,0,-1.047,1.047,-2.39,2.39]; // angles
	~elArray = [0.088,0.088,0,1.22,0.35,0.35,0.524,0.524]; // elev


	// specify 1/2 the desired directions

	//setup for ATK
	//combine az and el array
	~hall = [~azArray, ~elArray];

	//lace together
	~directions = ~hall.lace(16);

	//combine
	~directions = ~directions.clump(2);

	~directions = [[-0.454, 0.088], [0.454, 0.088], [0, 0], [0.35, 0.35]];

	//concerthall decoder
	~decoder = FoaDecoderMatrix.newDiametric(~directions[(0..3)]);

  SynthDef(\foaSpread, {
    arg inBus, angle = 0, theta = 0, phi = 0, rotRate, out;
		var src, foa, rotAngle, tilAngle, tumAngle, decoderMatrix, sig;

		rotAngle = LFNoise2.kr(rotRate, 2pi);
		tilAngle = LFNoise2.kr(rotRate, 2pi);
		tumAngle = LFNoise2.kr(rotRate, 2pi);

		src = In.ar(inBus, 8);
    foa = FoaEncode.ar(src, ~spreadEncoder);

		foa = FoaRTT.ar(foa, rotAngle, tilAngle, tumAngle);
		foa = FoaTransform.ar(foa, 'press', angle, theta, phi);

    sig = FoaDecode.ar(foa, ~decoder);
    Out.ar(out, sig);
  }).add;

  SynthDef(\foaDiffuse, {
      arg inBus, rotRate = 1.0, angle = 0, theta = 0, phi = 0, gain, distance,
					out;
      var src, foa, rotAngle, tilAngle, tumAngle, decoderMatrix, sig;

      src = In.ar(inBus, 8);
      foa = FoaEncode.ar(src, ~diffuseEncoder);

			foa = FoaTransform.ar(foa, 'focus', angle, theta, phi);

			foa = FoaTransform.ar(foa, 'rtt',
					LFNoise2.ar(rotRate, pi, add: pi),
					LFNoise2.ar(rotRate**(1/3), pi, add: pi),
					LFNoise2.ar(rotRate**(2/3), pi, add: pi)
			);

      sig = FoaDecode.ar(foa,~decoder);
      Out.ar(out, sig);
  }).add;
}.fork;
