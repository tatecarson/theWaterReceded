//send data from recipe synthesis to players

//oyster patties
~oysterPattiesNotation = Pbind(
	\dur,Pn( Plazy{~lastOysterEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastOysterEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastOysterEvent[\midinote].linlin(66, 75, 500, 400);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)
			}
		);
	})
	)
);

//banana nut bread
~bananaNutBreadNotation = Pbind(
	\dur,Pn( Plazy{~lastBananaEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastBananaEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastBananaEvent[\midinote].linlin(66, 77, 450, 350);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);

//creole bread pudding
~creoleBreadPuddingNotation = Pbind(
	\dur,Pn( Plazy{~lastCreoleBreadPuddingEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastCreoleBreadPuddingEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastCreoleBreadPuddingEvent[\midinote].linlin(56, 70, 425, 325);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);

//frozen lemon pie
~frozenLemonPieNotation = Pbind(
	\dur,Pn( Plazy{~lastfrozenLemonPieEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastfrozenLemonPieEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastfrozenLemonPieEvent[\midinote].linlin(76, 90, 375, 250);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);

//lemon thins
~lemonThinsNotation = Pbind(
	\dur,Pn( Plazy{~lastLemonThinsEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastLemonThinsEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastLemonThinsEvent[\midinote].linlin(86, 97, 300, 175);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);

//oatmeal cookies
~oatmealCookiesNotation = Pbind(
	\dur,Pn( Plazy{~lastOatmealCookiesEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastOatmealCookiesEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastOatmealCookiesEvent[\midinote].linlin(60, 70, 275, 130);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1); },
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1); },
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1); },
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);

//pecan pralines
~pecanPralinesNotation = Pbind(
	\dur,Pn( Plazy{~lastPecanPralinesEvent[\dur]; }),
	\amp, 0,
	\sendMsg, Pn( Plazy({|ev|

		var amp = ~lastPecanPralinesEvent[\amp].linlin(0.007, 0.01, 25, 75);
		var freq = ~lastPecanPralinesEvent[\midinote].linlin(96, 107, 250, 100);

		switch ([1, 2, 3, 4].choose,
			1, { b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1)},
			2, { b.sendMsg("/celloRecipe", 500, freq, amp, -6, 1)},
			3, { b.sendMsg("/clarRecipe", 500, freq, amp, -6, 1)},
			4, {b.sendMsg("/violinRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/celloRecipe", 500, freq,  amp, -6, 1);
				b.sendMsg("/clarRecipe", 500, freq,  amp, -6, 1)}
		);
	})
	)
);
