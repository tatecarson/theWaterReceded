//Sequences both movements and sends data to webservers

~violinTrigger = 0!8;
~celloTrigger = 0!8;
~clarTrigger = 0!8;

Tdef(\addNodes, {

	//series notation allows to count between given numbers
	(~playRange.()[0].linlin(0, 188, 1, 8).round(1)..~playRange.()[1].linlin(0, 188, 1, 8).round(1)).do{|i|

		i.debug("add notes iterated");

		//makes notation density follow range gui start and stop points
		~violinTrigger[((i+1)*2)%8] = 1;
		~celloTrigger[((i+3)*2)%8] = 1;
		~clarTrigger[((i+2)*2)%8]  = 1;

		"Triggers".postln;
		~violinTrigger.debug("violin");
		~celloTrigger.debug("cello");
		~clarTrigger.debug("clarinet");
		"".postln;

		(~onset.sum/4).wait;
	};
});

Tdef(\staggered, {
	(~playRange.()[0]..~playRange.()[1]).do{|i|

		b.sendMsg("/violin", 500, ~latFreq[i], ~amp[i], ~dur[i], ~attack[i], ~release[i], ~violinTrigger[i%7]);
		b.sendMsg("/cello", 500, ~longFreq[i], ~amp[i], ~dur[i], ~attack[i], ~release[i], ~celloTrigger[i%7]);
		b.sendMsg("/clar", 500, ~latFreq[i], ~amp[i], ~dur[i], ~attack[i], ~release[i], ~clarTrigger[i%7]);

		//everything
		b.sendMsg("/sc", 500, ~latFreq[i], ~amp[i], ~dur[i], ~attack[i], ~release[i], 2);
		b.sendMsg("/sc", 500, ~longFreq[i], ~amp[i], ~dur[i], ~attack[i], ~release[i], 1);

		//draw map
		b.sendMsg("/map", 1);

		SystemClock.sched(4.0, {

			Pbindef(\padpat,
				\instrument, \pad,
				\dur, ~dur[i].linlin(130, 450, 1, 8),
				\freq, ~longFreq[i].linlin(60, 500, 1500, 50),
				\kbnmul, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 10.0, 0.065),
				\amp, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 1.0, 0.1),
				\rest, Pif(0.5.coin, \rest),
				\out, ~distBusHur
			).play(quant: 0);

			Pbindef(\kordpat1,
				\instrument, \kords2,
				\dur, ~dur[i].linlin(130, 450, 1, 8),
				\freq, Pshuf([1/1, 3/2, 7/4, 9/4, 13/5].mirror * 100 *
					~longFreq[i].linlin(60, 500, 16, 1)),
				\amp, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 0.8, 0.1),
				\ratio, Pn(Pshuf([13/11, 17/11, 23/11, 29/11], 1), 1),
				\rest, Pif(0.5.coin, \rest),
				\out, ~distBusHur
			).play(quant: 0);

			//bass
			~bass.set(
				\ffreq, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 100.0, 1),
				\trem, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 100.0, 1),
				\osc1, ~longFreq[i].linlin(60, 500, 45, 100),
				\osc2, ~longFreq[i].linlin(60, 500, 1000, 50),
				\amp, ~pressure[i].linexp(~pressure.minItem, ~pressure.maxItem, 0.3, 0.01)
			);

			//fx modulate
			~distFxHur.set(
				\mix, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 1.2, 0.0),
				\knee, ~longFreq[i].linlin(60, 500, -90.dbamp, -30.dbamp)
			);

			~verbFxHur.set(
				\feedback, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 1.0, 0.2),
				\delayTime, ~pressure[i].linlin(~pressure.minItem, ~pressure.maxItem, 10, 1),
			);
		});

		~foaSpread.set(
			\theta, i.linlin(0, 187, 150.degrad, -30.degrad),
			\phi, pi.rand2,
			\rotRate, i.linlin(0, 187, 0, 3)
		);

		if( i > 93,
			{~foaSpread.set(\angle, i.linlin(0, 93, 90.degrad, 0.degrad))},

			//for second half of hurricane move from 0 to 90
			{~foaSpread.set(\angle, i.linlin(93, 187, 0.degrad, 90.degrad))}
		);


		if(i == (~latFreq.size-1),
			{
				{
					5.do{
						Pdef.all.do(_.stop);
						Pbindef(\padpat).stop;
						Pbindef(\kordpat2).stop;
						~bass.free;
						Tdef(\addNodes).stop;
						Tdef(\staggered).stop;
						2.wait;
					};
				}.fork;

				"stopped".postln;

				//start recipe movement
				~clock.clear;
				~clock = SoftClock(0.5);
				~clock.fadeTempo(4, 60*5, 4);

				//sequencing pspawners from recipePatternSeq.scd
				~seq = Pseq([
					Pseq([~oyster], 2),
					Pseq([~bananaNut], 3),
					Pseq([~creoleBread], 4),
					Pseq([~frozenLemon], 5),
					Pseq([~lemonThin], 6),
					Pseq([~oatmeal], 7),
					Pseq([~pecan], 8),
					Pseq([~end], 1)
				], 1).play(~clock);
			}
		);

		~onset[i].wait;
	};
});
