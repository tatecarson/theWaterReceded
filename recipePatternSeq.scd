//sequence the short melodies from recipePatterns.scd into longer phrases


//oyster patties
~oysterSeq = Pspawner({ arg maestro, i;

	//clear map background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 0.5
	).debug("diffuse set");

	//GUI notification
	{~recipeGui.string = "7. Oyster Patties"}.defer;

	//Cell phone notification
	b.sendMsg("/recipeName", "7. Oyster Patties", 2 + "repititions");


	maestro.par(~oysterSnap);
	maestro.par(~oysterPattiesPat[rrand(0, 6)]);
	maestro.wait(0.001); //to wait for pattern to produce output

	maestro.wait(rrand(4.0, 6.0));

	//send recipes to map
	b.sendMsg("/recipe", ~oysterIng[\ing]);
	maestro.seq(~oysterPattiesPat[rrand(0, 6)]);

	maestro.wait(rrand(4.0, 6.0));

	//send recipes to map
	b.sendMsg("/recipe", ~oysterIng[\ing]);
	maestro.par(~oysterPattiesPat[rrand(0, 6)]);

	maestro.wait(1);

	//send recipes to map
	b.sendMsg("/recipe", ~oysterIng[\ing]);
	maestro.par(~oysterPattiesPat[rrand(0, 6)]);

	maestro.wait(rrand(4.0, 6.0));

	//send recipes to map
	b.sendMsg("/recipe", ~oysterIng[\ing]);
	maestro.seq(Ppar([~oysterPattiesPat[rrand(0, 6)], ~oysterPattiesPat[rrand(0, 6)]]));
});

~oysterVerbSeq = Pspawner({ arg maestro, notation;

	notation = ~oysterPattiesNotation.play;

	maestro.seq(~oysterPattiesVerb[rrand(0, 9)]);

	//send recipes to map
	b.sendMsg("/recipe", ~lastOysterEvent[\verb]);

	maestro.wait(0.001); //to wait for pattern to produce output

	notation.stop;
	maestro.wait(rrand(4.0, 6.0));

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastOysterEvent[\verb]);
	maestro.seq(~oysterPattiesVerb[rrand(0, 9)]);

	notation.stop;

	maestro.wait(rrand(4.0, 6.0));

	//send recipes to map
	b.sendMsg("/recipe", ~lastOysterEvent[\verb]);
	notation.play;
	maestro.par(~oysterPattiesVerb[rrand(0, 9)]);

	maestro.par(~oysterPattiesVerb[rrand(0, 9)]);

	notation.stop;
	maestro.wait(rrand(4.0, 6.0));

	//send recipes to map
	b.sendMsg("/recipe", ~lastOysterEvent[\verb]);
	notation.play;
	maestro.seq(Ppar([~oysterPattiesVerb[rrand(0, 9)], ~oysterPattiesVerb[rrand(0, 9)]]));

	notation.stop;
});

//banana nut bread
~bananaNutBreadIngSeq = Pspawner({ arg maestro;
	//clear background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 2
	).debug("diffuse set");

	{~recipeGui.string = "6. Banana Nut Bread"}.defer;
	b.sendMsg("/recipeName", "6. Banana Nut Bread", 3 + "repititions");

	maestro.par(~bananaSnap);

	maestro.par(~bananaNutBreadPat[rrand(0, 10)]);

	maestro.wait(0.001); //to wait for pattern to produce output

	maestro.seq(~bananaNutBreadPat[rrand(0, 10)]);
	//send recipes to map
	b.sendMsg("/recipe", ~bananaIng[\ing]);

	maestro.wait(rrand(3.0, 5.0));

	maestro.par(~bananaNutBreadPat[rrand(0, 10)]);
	//send recipes to map
	b.sendMsg("/recipe", ~bananaIng[\ing]);

	maestro.wait(1);
	maestro.par(~bananaNutBreadPat[rrand(0, 10)]);
	//send recipes to map
	b.sendMsg("/recipe", ~bananaIng[\ing]);

	maestro.seq(Ppar([~bananaNutBreadPat[rrand(0, 10)], ~bananaNutBreadPat[rrand(0, 10)]]));

});

~bananaNutBreadVerbSeq = Pspawner({ arg maestro, notation;

	notation = ~bananaNutBreadNotation.play;
	maestro.seq(~bananaNutBreadVerb[0]);

	notation.stop;
	maestro.wait(0.001); //to wait for pattern to produce output


	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastBananaEvent[\verb]);
	maestro.seq(~bananaNutBreadVerb[1]);
	notation.stop;


	maestro.wait(rrand(3.0, 5.0));

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastBananaEvent[\verb]);
	maestro.par(~bananaNutBreadVerb[2]);

	maestro.par(~bananaNutBreadVerb[3]);


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastBananaEvent[\verb]);
	maestro.seq(Ppar([~bananaNutBreadVerb[0], ~bananaNutBreadVerb[2]]));


	notation.stop;

});

//creole bread pudding
~creoleBreadPuddingIngSeq = Pspawner({ arg maestro;
	//clear background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 3
	).debug("diffuse set");

	{~recipeGui.string = "5. Bread Pudding"}.defer;
	b.sendMsg("/recipeName", "5. Bread Pudding", 4 + "repititions");

	maestro.par(~creoleSnap);


	maestro.par(~creoleBreadPuddingPat[rrand(0, 9)]);

	maestro.wait(0.001); //to wait for pattern to produce output


	maestro.seq(~creoleBreadPuddingPat[rrand(0, 9)]);
	//send recipes to map
	b.sendMsg("/recipe", ~creoleIng[\ing]);

	maestro.wait(rrand(2.0, 4.0));


	maestro.par(~creoleBreadPuddingPat[rrand(0, 9)]);
	maestro.wait(1);


	maestro.par(~creoleBreadPuddingPat[rrand(0, 9)]);

	//send recipes to map
	b.sendMsg("/recipe", ~creoleIng[\ing]);

	maestro.seq(Ppar([~creoleBreadPuddingPat[rrand(0, 9)], ~creoleBreadPuddingPat[rrand(0, 9)]]));

});

~creoleBreadPuddingVerbSeq = Pspawner({ arg maestro, notation;

	notation = ~creoleBreadPuddingNotation.play;
	maestro.seq(~creoleBreadPuddingVerb[rrand(0, 11)]);
	notation.stop;
	maestro.wait(0.001); //to wait for pattern to produce output

	notation.play;

	maestro.seq(~creoleBreadPuddingVerb[rrand(0, 11)]);


	notation.stop;

	maestro.wait(rrand(2.0, 4.0));

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastCreoleBreadPuddingEvent[\verb]);
	maestro.par(~creoleBreadPuddingVerb[rrand(0, 11)]);


	maestro.par(~creoleBreadPuddingVerb[rrand(0, 11)]);

	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastCreoleBreadPuddingEvent[\verb]);
	maestro.seq(Ppar([~creoleBreadPuddingVerb[rrand(0, 11)], ~creoleBreadPuddingVerb[rrand(0, 11)]]));


	notation.stop;

});

//frozen lemon pie
~frozenLemonPieIngSeq = Pspawner({ arg maestro;

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 4
	).debug("diffuse set");

	//for gui
	{~recipeGui.string = "4. Frozen Lemon Pie"}.defer;
	b.sendMsg("/recipeName", "4. Frozen Lemon Pie", 5 + "repititions");

	maestro.par(~frozenLemonPieSnap);

	maestro.par(~frozenLemonPiePat[rrand(0, 5)]);

	//send recipes to map
	b.sendMsg("/recipe", ~frozenIng[\ing]);

	maestro.wait(0.001); //to wait for pattern to produce output

	maestro.seq(~frozenLemonPiePat[rrand(0, 5)]);

	//send recipes to map
	b.sendMsg("/recipe", ~frozenIng[\ing]);


	maestro.wait(rrand(1.0, 3.0));

	maestro.par(~frozenLemonPiePat[rrand(0, 5)]);
	//send recipes to map
	b.sendMsg("/recipe", ~frozenIng[\ing]);

	maestro.wait(1);
	maestro.par(~frozenLemonPiePat[rrand(0, 5)]);
	//send recipes to map
	b.sendMsg("/recipe", ~frozenIng[\ing]);

	maestro.seq(Ppar([~frozenLemonPiePat[rrand(0, 5)], ~frozenLemonPiePat[rrand(0, 5)]]));

});

~frozenLemonPieVerbSeq = Pspawner({ arg maestro, notation;
	//clear background
	b.sendMsg("/clear");

	notation = ~frozenLemonPieNotation.play;
	maestro.seq(~frozenLemonPieVerb[rrand(0, 8)]);

	//send recipes to map
	b.sendMsg("/recipe", ~lastfrozenLemonPieEvent[\verb]);
	maestro.wait(0.001); //to wait for pattern to produce output

	notation.stop;


	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastfrozenLemonPieEvent[\verb]);
	maestro.seq(~frozenLemonPieVerb[rrand(0, 8)]);


	notation.stop;


	maestro.wait(rrand(1.0, 3.0));

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastfrozenLemonPieEvent[\verb]);
	maestro.par(~frozenLemonPieVerb[rrand(0, 8)]);


	maestro.par(~frozenLemonPieVerb[rrand(0, 8)]);


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastfrozenLemonPieEvent[\verb]);
	maestro.seq(Ppar([~frozenLemonPieVerb[rrand(0, 8)], ~frozenLemonPieVerb[rrand(0, 8)]]));


	notation.stop;
});

//lemon thins
~lemonThinsIngSeq = Pspawner({ arg maestro;
	//clear background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 5
	).debug("diffuse set");

	{~recipeGui.string = "3. Lemon Thins"}.defer;
	b.sendMsg("/recipeName", "3. Lemon Thins", 6 + "repititions");

	maestro.par(~lemonThinsSnap);


	maestro.par(~lemonThinsPat[rrand(0, 8)]);

	//send recipes to map
	b.sendMsg("/recipe", ~lemonIng[\ing]);

	maestro.wait(0.01); //to wait for pattern to produce output


	maestro.seq(~lemonThinsPat[rrand(0, 8)]);
	//send recipes to map
	b.sendMsg("/recipe", ~lemonIng[\ing]);

	maestro.par(~lemonThinsPat[rrand(0, 8)]);


	maestro.wait(rrand(0.1, 1));
	maestro.par(~lemonThinsPat[rrand(0, 8)]);
	//send recipes to map
	b.sendMsg("/recipe", ~lemonIng[\ing]);

	maestro.par(~lemonThinsSnap);
	maestro.seq(Ppar([~lemonThinsPat[rrand(0, 8)], ~lemonThinsPat[rrand(0, 8)]]));

});

~lemonThinsVerbSeq = Pspawner({ arg maestro, notation;
	notation = ~lemonThinsNotation.play;

	maestro.seq(~lemonThinsVerb[rrand(0, 5)]);

	//send recipes to map
	b.sendMsg("/recipe", ~lastLemonThinsEvent[\verb]);

	maestro.wait(0.001); //to wait for pattern to produce output

	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastLemonThinsEvent[\verb]);
	maestro.seq(~lemonThinsVerb[rrand(0, 5)]);


	notation.stop;

	maestro.wait(2.5);

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastLemonThinsEvent[\verb]);
	maestro.par(~lemonThinsVerb[rrand(0, 5)]);


	maestro.par(~lemonThinsVerb[rrand(0, 5)]);


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastLemonThinsEvent[\verb]);
	maestro.seq(Ppar([~lemonThinsVerb[rrand(0, 5)], ~lemonThinsVerb[rrand(0, 5)]]));


	notation.stop;

});

//oatmeal cookies
~oatmealCookiesIngSeq = Pspawner({ arg maestro;

	//clear background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 6
	).debug("diffuse set");

	{~recipeGui.string = "2. Oatmeal Cookies"}.defer;
	b.sendMsg("/recipeName", "2. Oatmeal Cookies", 7 + "repititions");

	maestro.par(~oatmealCookiesSnap);

	maestro.par(~oatmealCookiesPat[rrand(0, 10)]);

	//send recipes to map
	b.sendMsg("/recipe", ~oatmealIng[\ing]);

	maestro.wait(0.01); //to wait for pattern to produce output


	maestro.seq(~oatmealCookiesPat[rrand(0, 10)]);
	//send recipes to map
	b.sendMsg("/recipe", ~oatmealIng[\ing]);

	maestro.par(~oatmealCookiesPat[rrand(0, 10)]);


	maestro.wait(1);

	//send recipes to map
	b.sendMsg("/recipe", ~oatmealIng[\ing]);
	maestro.par(~oatmealCookiesPat[rrand(0, 10)]);


	maestro.par(~oatmealCookiesSnap);
	//send recipes to map
	b.sendMsg("/recipe", ~oatmealIng[\ing]);
	maestro.seq(Ppar([~oatmealCookiesPat[rrand(0, 10)], ~oatmealCookiesPat[rrand(0, 10)]]));

});

~oatmealCookiesVerbSeq = Pspawner({ arg maestro, notation;

	notation = ~oatmealCookiesNotation.play;
	maestro.seq(~oatmealCookiesVerb[0]);

	//send recipes to map
	b.sendMsg("/recipe", ~lastOatmealCookiesEvent[\verb]);
	maestro.wait(0.001); //to wait for pattern to produce output


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastOatmealCookiesEvent[\verb]);
	maestro.seq(~oatmealCookiesVerb[1]);


	notation.stop;

	maestro.wait(2.5);

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastOatmealCookiesEvent[\verb]);
	maestro.par(~oatmealCookiesVerb[2]);


	maestro.par(~oatmealCookiesVerb[3]);


	notation.stop;
});


//pecan pralines
~pecanPralinesIngSeq = Pspawner({ arg maestro;
	//clear background
	b.sendMsg("/clear");

	~foaDiffuse.set(
		\angle, (pi/2).rand2,
		\theta, pi.rand2,
		\phi, pi.rand2,
		\rotRate, 7
	).debug("diffuse set");

	{~recipeGui.string = "1. Pecan Pralines"}.defer;
	b.sendMsg("/recipeName", "1. Pecan Pralines", 8 + "repititions");

	maestro.par(~pecanPralinesSnap);

	maestro.seq(~pecanPralinesPat[0]);

	//send recipes to map
	b.sendMsg("/recipe", ~pecanIng[\ing]);

	maestro.wait(0.01); //to wait for pattern to produce output


	maestro.seq(~pecanPralinesPat[1]);
	//send recipes to map
	b.sendMsg("/recipe", ~pecanIng[\ing]);

	maestro.seq(~pecanPralinesPat[2]);
	//send recipes to map
	b.sendMsg("/recipe", ~pecanIng[\ing]);

	maestro.seq(~pecanPralinesPat[3]);


	maestro.seq(Ppar([~pecanPralinesPat[3], ~pecanPralinesPat[2]]));

	//send recipes to map
	b.sendMsg("/recipe", ~pecanIng[\ing]);

	maestro.seq(Ppar([~pecanPralinesPat[1], ~pecanPralinesPat[0]]));

});

~pecanPralinesVerbSeq = Pspawner({ arg maestro, notation;
	notation = ~pecanPralinesNotation.play;

	maestro.seq(~pecanPralinesVerb[rrand(0, 3)]);

	//send recipes to map
	b.sendMsg("/recipe", ~lastPecanPralinesEvent[\verb]);

	maestro.wait(0.001); //to wait for pattern to produce output


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastPecanPralinesEvent[\verb]);
	maestro.seq(~pecanPralinesVerb[rrand(0, 3)]);


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastPecanPralinesEvent[\verb]);
	maestro.par(~pecanPralinesVerb[rrand(0, 3)]);


	maestro.par(~pecanPralinesVerb[rrand(0, 3)]);


	notation.stop;

	notation.play;

	//send recipes to map
	b.sendMsg("/recipe", ~lastPecanPralinesEvent[\verb]);
	maestro.seq(Ppar([~pecanPralinesVerb[rrand(0, 3)], ~pecanPralinesVerb[rrand(0, 3)]]));


	notation.stop;
});

//to tell everyone it's over
/*~end = Plazy({
	//clear background
	b.sendMsg("/clear");
	{~recipeGui.string = "THE END"}.defer;
	b.sendMsg("/recipeName", "THE END");
});*/
~end = Pfunc({
	//clear background
	b.sendMsg("/clear");
	{~recipeGui.string = "THE END"}.defer;
	b.sendMsg("/recipeName", "THE END");
}).asStream;

//play the synth and notation at the same time
~oyster = Ppar([~oysterSeq, ~oysterVerbSeq]);
~bananaNut = Ppar([~bananaNutBreadIngSeq, ~bananaNutBreadVerbSeq]);
~creoleBread = Ppar([~creoleBreadPuddingIngSeq, ~creoleBreadPuddingVerbSeq]);
~frozenLemon = Ppar([~frozenLemonPieIngSeq, ~frozenLemonPieVerbSeq]);
~lemonThin = Ppar([~lemonThinsIngSeq, ~lemonThinsVerbSeq]);
~oatmeal = Ppar([~oatmealCookiesIngSeq, ~oatmealCookiesVerbSeq]);
~pecan = Ppar([~pecanPralinesIngSeq, ~pecanPralinesVerbSeq]);
