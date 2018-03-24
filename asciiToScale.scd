//rounds ascii value to a given scale
~asciiToScale = {|ascii, scale, length|
	var nearest;

	// function to transform to midi keys
	nearest = { |arr, scale|
		arr.cpsmidi.round.asInteger.collect(_.nearestInScale(scale, length))
	};

	nearest.(ascii, scale);
};

//oyster patties
~oysterPatties[\ingChar].size.do{|i|
	~oysterPatties[\ingChar][i] = ~asciiToScale.
	(~oysterPatties[\ingChar][i], Scale.major, 12);
};

~oysterPatties[\dirChar].size.do{|i|
	~oysterPatties[\dirChar][i] = ~asciiToScale.
	(~oysterPatties[\dirChar][i], Scale.major, 12);
};

~oysterPatties[\verbChar].size.do{|i|
	~oysterPatties[\verbChar][i] = ~asciiToScale.
	(~oysterPatties[\verbChar][i], Scale.major, 12);
};
//banana nut bread
~bananaNutBread[\ingChar].size.do{|i|
	~bananaNutBread[\ingChar][i] = ~asciiToScale.
	(~bananaNutBread[\ingChar][i], Scale.major, 12);
};

~bananaNutBread[\dirChar].size.do{|i|
	~bananaNutBread[\dirChar][i] = ~asciiToScale.
	(~bananaNutBread[\dirChar][i], Scale.major, 12);
};

~bananaNutBread[\verbChar].size.do{|i|
	~bananaNutBread[\verbChar][i] = ~asciiToScale.
	(~bananaNutBread[\verbChar][i], Scale.major, 12);
};

//brownies
~brownies[\ingChar].size.do{|i|
	~brownies[\ingChar][i] = ~asciiToScale.
	(~brownies[\ingChar][i], Scale.major, 12);
};

~brownies[\dirChar].size.do{|i|
	~brownies[\dirChar][i] = ~asciiToScale.
	(~brownies[\dirChar][i], Scale.major, 12);
};

~brownies[\verbChar].size.do{|i|
	~brownies[\verbChar][i] = ~asciiToScale.
	(~brownies[\verbChar][i], Scale.major, 12);
};

//creole bread pudding
~creoleBreadPudding[\ingChar].size.do{|i|
	~creoleBreadPudding[\ingChar][i] = ~asciiToScale.
	(~creoleBreadPudding[\ingChar][i], Scale.major, 12);
};

~creoleBreadPudding[\dirChar].size.do{|i|
	~creoleBreadPudding[\dirChar][i] = ~asciiToScale.
	(~creoleBreadPudding[\dirChar][i], Scale.major, 12);
};

~creoleBreadPudding[\verbChar].size.do{|i|
	~creoleBreadPudding[\verbChar][i] = ~asciiToScale.
	(~creoleBreadPudding[\verbChar][i], Scale.major, 12);
};

//frozen lemon pie
~frozenLemonPie[\ingChar].size.do{|i|
	~frozenLemonPie[\ingChar][i] = ~asciiToScale.
	(~frozenLemonPie[\ingChar][i], Scale.major, 12);
};

~frozenLemonPie[\dirChar].size.do{|i|
	~frozenLemonPie[\dirChar][i] = ~asciiToScale.
	(~frozenLemonPie[\dirChar][i], Scale.major, 12);
};

~frozenLemonPie[\verbChar].size.do{|i|
	~frozenLemonPie[\verbChar][i] = ~asciiToScale.
	(~frozenLemonPie[\verbChar][i], Scale.major, 12);
};

//lemon thins
~lemonThins[\ingChar].size.do{|i|
	~lemonThins[\ingChar][i] = ~asciiToScale.
	(~lemonThins[\ingChar][i], Scale.major, 12);
};

~lemonThins[\dirChar].size.do{|i|
	~lemonThins[\dirChar][i] = ~asciiToScale.
	(~lemonThins[\dirChar][i], Scale.major, 12);
};

~lemonThins[\verbChar].size.do{|i|
	~lemonThins[\verbChar][i] = ~asciiToScale
	.(~lemonThins[\verbChar][i], Scale.major, 12);
};

//oatmeal cookies
~oatmealCookies[\ingChar].size.do{|i|
	~oatmealCookies[\ingChar][i] = ~asciiToScale.
	(~oatmealCookies[\ingChar][i], Scale.major, 12);
};

~oatmealCookies[\dirChar].size.do{|i|
	~oatmealCookies[\dirChar][i] = ~asciiToScale.
	(~oatmealCookies[\dirChar][i], Scale.major, 12);
};

~oatmealCookies[\verbChar].size.do{|i|
	~oatmealCookies[\verbChar][i] = ~asciiToScale.
	(~oatmealCookies[\verbChar][i], Scale.major, 12);
};

//pecan meatballs
~pecanMeatballs[\ingChar].size.do{|i|
	~pecanMeatballs[\ingChar][i] = ~asciiToScale.
	(~pecanMeatballs[\ingChar][i], Scale.major, 12);
};

~pecanMeatballs[\dirChar].size.do{|i|
	~pecanMeatballs[\dirChar][i] = ~asciiToScale.
	(~pecanMeatballs[\dirChar][i], Scale.major, 12);
};

~pecanMeatballs[\verbChar].size.do{|i|
	~pecanMeatballs[\verbChar][i] = ~asciiToScale.
	(~pecanMeatballs[\verbChar][i], Scale.major, 12);
};

//pecan pralines
~pecanPralines[\ingChar].size.do{|i|
	~pecanPralines[\ingChar][i] = ~asciiToScale.
	(~pecanPralines[\ingChar][i], Scale.major, 12);
};

~pecanPralines[\dirChar].size.do{|i|
	~pecanPralines[\dirChar][i] = ~asciiToScale.
	(~pecanPralines[\dirChar][i], Scale.major, 12);
};

~pecanPralines[\verbChar].size.do{|i|
	~pecanPralines[\verbChar][i] = ~asciiToScale.
	(~pecanPralines[\verbChar][i], Scale.major, 12);
};
