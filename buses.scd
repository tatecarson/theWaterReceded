s.newBusAllocators;

//bus allocation
~foaSpreadBus = Bus.audio(s, 8);
~foaDiffuseBus = Bus.audio(s, 8);
~distBusHur = Bus.audio(s, 2);
~verbBusHur = Bus.audio(s, 2);
~distBus = 7.collect{Bus.audio(s, 2)};
~verbBus = 7.collect{Bus.audio(s, 2)};

//Effects init
~distFxHur = Synth(\satan,
	[mix: 0.3, envTime: 0.0001, knee: -40.dbamp, in:~distBusHur, out: ~verbBusHur],
	addAction: \addToTail);

~verbFxHur = Synth(\reverb,
	[delayTime: 3, damp: 0.2, size: 7, diff: 0.707, feedback: 0.2, in: ~verbBusHur, out: ~foaSpreadBus],
	addAction: \addToTail);

~distFx = 7.collect{|i| Synth(\satan,
	[mix: i.linlin(0, 7, 0.5, 0.2), envTime: 0.0001, knee: -40.dbamp,
		in:~distBus[i], out: ~verbBus[i]],
	addAction: \addToTail)};

~verbFx = 7.collect{|i| Synth(\reverb,
	[delayTime: i.linlin(0, 6, 3, 0.2), damp: 0.2, size: i.linlin(0, 6, 7, 1),
		diff: 0.707, feedback: 0, in: ~verbBus[i], out: ~foaDiffuseBus],
	addAction: \addToTail)};

//Ambisonics init
~foaSpread = Synth(\foaSpread,
	[
		\inBus, ~foaSpreadBus,
		\out, ~defaultOut,
		\angle, 90.degrad,
		\theta, 150.degrad,
		\phi, pi.rand2,
		\rotRate, 0
	],
	addAction: \addToTail);

~foaDiffuse = Synth(\foaDiffuse,
	[
		\inBus, ~foaDiffuseBus,
		\out, ~defaultOut,
		\angle, 0.degrad,
		\theta, 0.degrad,
		\phi, pi.rand2,
		\rotRate, 0
	],
	addAction: \addToTail);
