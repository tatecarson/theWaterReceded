/*
This processes a recipe for numerical content
The number of ingredients, directions, and verbs from directions
are stored along with their lengths and ascii values
*/

~bananaNutBread = ();

/*
Process ingredients
*/

//list ing
~bananaNutBread[\ing] = ["vegetable oil", "sugar", "eggs", "bananas", "all purpose flour", "baking soda", "powder", "salt", "milk", "vanilla", "chopped nuts"];
~bananaNutBread[\ingl] = 0!~bananaNutBread[\ing].size;
~bananaNutBread[\ingChar] = 0!~bananaNutBread[\ing].size;

//get datia
~bananaNutBread[\ing].size.do{|i|

  //get size of each
  ~bananaNutBread[\ingl][i] = ~bananaNutBread[\ing][i].size;

  //get char ascii value
  ~bananaNutBread[\ingChar][i] = ~bananaNutBread[\ing][i].ascii;
};

/*
Process directions
*/

//get general data
~bananaNutBread[\dir] = ["Beat", "oil", "sugar", "and", "eggs", "bananas", "sift", "dry", "ingredients", "add", "stir", "in", "milk", "vanilla", "and", "nuts", "9", "x", "5", "pan", "350", "1", "hr"];
~bananaNutBread[\dirl] = 0!~bananaNutBread[\dir].size;
~bananaNutBread[\dirChar] = 0!~bananaNutBread[\dir].size;

//get data
~bananaNutBread[\dir].size.do{|i|

  //get size of each
  ~bananaNutBread[\dirl][i] = ~bananaNutBread[\dir][i].size;

  //get char ascii value
  ~bananaNutBread[\dirChar][i] = ~bananaNutBread[\dir][i].ascii;
};

//get verbs in directions, leave action words
~bananaNutBread[\verb] = ["beat", "sift", "add", "stir"];
~bananaNutBread[\verbl] = 0!~bananaNutBread[\verb].size;
~bananaNutBread[\verbChar] = 0!~bananaNutBread[\verb].size;

//get data
~bananaNutBread[\verb].size.do{|i|

  //get size of each
  ~bananaNutBread[\verbl][i] = ~bananaNutBread[\verb][i].size;

  //get char ascii value
  ~bananaNutBread[\verbChar][i] = ~bananaNutBread[\verb][i].ascii;
};
