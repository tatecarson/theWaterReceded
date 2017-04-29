/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~brownies = ();

/*
Process ingredients
*/

//list ing
~brownies[\ing] = ["sugar", "eggs", "squre unsweetened chocolate", "oleo", "four", "vanilla", "nuts"];
~brownies[\ingl] = 0!~brownies[\ing].size;
~brownies[\ingChar] = 0!~brownies[\ing].size;

//get data
~brownies[\ing].size.do{|i|

  //get size of each
  ~brownies[\ingl][i] = ~brownies[\ing][i].size;

  //get char ascii value
  ~brownies[\ingChar][i] = ~brownies[\ing][i].ascii;
};

/*
Process directions
*/

//get general data
~brownies[\dir] = ["Add", "sugar", "to", "eggs", "beat", "Melt", "chocolate", "and", "butter", "add", "to", "eggs", "Blend", "in", "flour", "add", "vanilla", "and", "nuts", "Bake", "in", "8", "8", "2", "pan", "350", "25", "30", "min"];
~brownies[\dirl] = 0!~brownies[\dir].size;
~brownies[\dirChar] = 0!~brownies[\dir].size;

//get data
~brownies[\dir].size.do{|i|

  //get size of each
  ~brownies[\dirl][i] = ~brownies[\dir][i].size;

  //get char ascii value
  ~brownies[\dirChar][i] = ~brownies[\dir][i].ascii;
};

//get verbs in directions, leave action words
~brownies[\verb] = ["add", "beat", "melt", "blend", "add", "bake"];
~brownies[\verbl] = 0!~brownies[\verb].size;
~brownies[\verbChar] = 0!~brownies[\verb].size;

//get data
~brownies[\verb].size.do{|i|

  //get size of each
  ~brownies[\verbl][i] = ~brownies[\verb][i].size;

  //get char ascii value
  ~brownies[\verbChar][i] = ~brownies[\verb][i].ascii;
};
