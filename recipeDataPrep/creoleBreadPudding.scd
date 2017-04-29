/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~creoleBreadPudding = ();

/*
Process ingredients
*/

//list ing
~creoleBreadPudding[\ing] = ["stale french bread", "small cubes", "raisins", "butter", "eggs", "sugar", "milk", "vanilla", "cream tarter", "sugar"];
~creoleBreadPudding[\ingl] = 0!~creoleBreadPudding[\ing].size;
~creoleBreadPudding[\ingChar] = 0!~creoleBreadPudding[\ing].size;

//get data
~creoleBreadPudding[\ing].size.do{|i|

  //get size of each
  ~creoleBreadPudding[\ingl][i] = ~creoleBreadPudding[\ing][i].size;

  //get char ascii value
  ~creoleBreadPudding[\ingChar][i] = ~creoleBreadPudding[\ing][i].ascii;
};

/*
Process directions
*/

//get general data
~creoleBreadPudding[\dir] = ["Moisten", "bread", "cups", "with", "water", "squeeze", "dry", "Mis", "with", "raisins", "and", "butter", "in", "1", "qt", "baking", "dish", "Beat", "egg", "yolds", "with", "6", "tabl", "sugar", "stir", "in", "milk", "Add", "vanilla", "pour", "over", "bread", "bake", "350", "45", "min", "MARINQUE", "Beat", "egg", "whites", "until", "foamy", "add", "cream", "of", "tartar", "gradually", "add", "1", "4", "bup", "sugar", "Beat", "spoon", "on", "top", "of", "pudding", "brown"];
~creoleBreadPudding[\dirl] = 0!~creoleBreadPudding[\dir].size;
~creoleBreadPudding[\dirChar] = 0!~creoleBreadPudding[\dir].size;

//get data
~creoleBreadPudding[\dir].size.do{|i|

  //get size of each
  ~creoleBreadPudding[\dirl][i] = ~creoleBreadPudding[\dir][i].size;

  //get char ascii value
  ~creoleBreadPudding[\dirChar][i] = ~creoleBreadPudding[\dir][i].ascii;
};

//get verbs in directions, leave action words
~creoleBreadPudding[\verb] = ["Moisten", "squeeze", "Mis", "Beat", "stir", "Add", "pour", "bake", "Beat", "add", "add", "Beat"];
~creoleBreadPudding[\verbl] = 0!~creoleBreadPudding[\verb].size;
~creoleBreadPudding[\verbChar] = 0!~creoleBreadPudding[\verb].size;

//get data
~creoleBreadPudding[\verb].size.do{|i|

  //get size of each
  ~creoleBreadPudding[\verbl][i] = ~creoleBreadPudding[\verb][i].size;

  //get char ascii value
  ~creoleBreadPudding[\verbChar][i] = ~creoleBreadPudding[\verb][i].ascii;
};
