//organize recipe text into short melodies

//oyster patties
~oysterPattiesPat = ~oysterPatties[\ingChar].size.collect{|i|
	Pbind(
		\instrument, [\femsound, \ping].choose,
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~oysterPatties[\ingChar][i], 1),
		\dur, Pseq(~oysterPatties[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[0], ~verbBus[0]])),
		\ing, ~oysterPatties[\ing][i]
	).collect{|event|
		~oysterIng = event;
	}
};

~oysterSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~oysterPatties[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[0], ~verbBus[0]]))
);

~oysterPattiesVerb = ~oysterPatties[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~oysterPatties[\verbChar][i]+30, 1),
		\dur, Pseq(~oysterPatties[\verbl]*0.1, 1),
		// \femadjust, 0.01,
		\out, Pn(Pshuf([~defaultOut, ~distBus[0], ~verbBus[0]])),
		\verb, ~oysterPatties[\verb][i]
	).collect({ |event|
		~lastOysterEvent = event;
	})
};


//banana nut bread
~bananaNutBreadPat = ~bananaNutBread[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~bananaNutBread[\ingChar][i], 1),
		\dur, Pseq(~bananaNutBread[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[1], ~verbBus[1]])),
		\ing, ~bananaNutBread[\ing][i]
	).collect{|event|
		~bananaIng = event;
	}
};

~bananaSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~bananaNutBread[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[1], ~verbBus[1]]))
);

~bananaNutBreadVerb = ~bananaNutBread[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~bananaNutBread[\verbChar][i]+40, 1),
		\dur, Pseq(~bananaNutBread[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[1], ~verbBus[1]])),
		\verb, ~bananaNutBread[\verb][i]
	).collect({ |event|
		~lastBananaEvent = event;
	})
};

//creole bread pudding
~creoleBreadPuddingPat = ~creoleBreadPudding[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~creoleBreadPudding[\ingChar][i], 1),
		\dur, Pseq(~creoleBreadPudding[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[2], ~verbBus[2]])),
		\ing, ~creoleBreadPudding[\ing][i]
	).collect{|event|
		~creoleIng = event;
	}
};

~creoleSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~creoleBreadPudding[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[2], ~verbBus[2]]))
);

~creoleBreadPuddingVerb = ~creoleBreadPudding[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~creoleBreadPudding[\verbChar][i]+20, 1),
		\dur, Pseq(~creoleBreadPudding[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[2], ~verbBus[2]])),
		\verb, ~creoleBreadPudding[\verb][i]
	).collect({ |event|
		~lastCreoleBreadPuddingEvent = event;
	})
};

//frozen lemon pie
~frozenLemonPiePat = ~frozenLemonPie[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~frozenLemonPie[\ingChar][i], 1),
		\dur, Pseq(~frozenLemonPie[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[3], ~verbBus[3]])),
		\ing, ~frozenLemonPie[\ing][i]
	).collect{|event|
		~frozenIng = event;
	}
};

~frozenLemonPieSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~frozenLemonPie[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[3], ~verbBus[3]]))
);

~frozenLemonPieVerb = ~frozenLemonPie[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~frozenLemonPie[\verbChar][i]+40, 1),
		\dur, Pseq(~frozenLemonPie[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[3], ~verbBus[3]])),
		\verb, ~frozenLemonPie[\verb][i]
	).collect({ |event|
		~lastfrozenLemonPieEvent = event;
	})
};

//lemon thins
~lemonThinsPat = ~lemonThins[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~lemonThins[\ingChar][i], 1),
		\dur, Pseq(~lemonThins[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[4], ~verbBus[4]])),
		\ing, ~lemonThins[\ing][i]
	).collect{|event|
		~lemonIng = event;
	}
};

~lemonThinsSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~lemonThins[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[4], ~verbBus[4]]))
);

~lemonThinsVerb = ~lemonThins[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~lemonThins[\verbChar][i]+50, 1),
		\dur, Pseq(~lemonThins[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[4], ~verbBus[4]])),
		\verb, ~lemonThins[\verb][i]
	).collect({ |event|
		~lastLemonThinsEvent = event;
	})
};

//oatmeal cookies
~oatmealCookiesPat = ~oatmealCookies[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~oatmealCookies[\ingChar][i], 1),
		\dur, Pseq(~oatmealCookies[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[5], ~verbBus[5]])),
		\ing, ~oatmealCookies[\ing][i]
	).collect{|event|
		~oatmealIng = event;
	}
};

~oatmealCookiesSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~oatmealCookies[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[5], ~verbBus[5]]))
);

~oatmealCookiesVerb = ~oatmealCookies[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~oatmealCookies[\verbChar][i]+20, 1),
		\dur, Pseq(~oatmealCookies[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[5], ~verbBus[5]])),
		\verb, ~oatmealCookies[\verb][i]
	).collect({ |event|
		~lastOatmealCookiesEvent = event;
	})
};

//pecan pralines
~pecanPralinesPat = ~pecanPralines[\ingChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose.postln}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~pecanPralines[\ingChar][i], 1),
		\dur, Pseq(~pecanPralines[\ingl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[6], ~verbBus[6]])),
		\ing, ~pecanPralines[\ing][i]
	).collect{|event|
		~pecanIng = event;
	}
};

~pecanPralinesSnap = Pbind(
	\instrument, \snap,
	\degree, [2, 7],
	\dur, Pseq(~pecanPralines[\ingl]*0.1, 1),
	\level, Pwhite(0.1, 0.16),
	\im, Pn(Pshuf((1..10), 1)),
	\octave, Pwhite(8, 10),
	\out, Pn(Pshuf([~defaultOut, ~distBus[6], ~verbBus[6]]))
);

~pecanPralinesVerb = ~pecanPralines[\verbChar].size.collect{|i|
	Pbind(
		\instrument, Pfunc({[\femsound, \ping].choose}),
		\amp, Pshuf([ 0.02, 0.03 ].stutter(11) * 0.3) * Pwhite(1.0, 1.5),
		\resonance, Pexprand(0.1, 1.0),
		\midinote, Pseq(~pecanPralines[\verbChar][i]+60, 1),
		\dur, Pseq(~pecanPralines[\verbl]*0.1, 1),
		\out, Pn(Pshuf([~defaultOut, ~distBus[6], ~verbBus[6]])),
		\verb, ~pecanPralines[\verb][i]
	).collect({ |event|
		~lastPecanPralinesEvent = event;
	})
};
