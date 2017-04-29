/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~lemonThins = ();

/*
Process ingredients
*/

//list ing
~lemonThins[\ing] = ["shortening", "brown sugar", "white sugar", "lemon juice", "egg", "flour", "salt", "soda", "lemon rind"];
~lemonThins[\ingl] = 0!~lemonThins[\ing].size;
~lemonThins[\ingChar] = 0!~lemonThins[\ing].size;

//get data
~lemonThins[\ing].size.do{|i|

  //get size of each
  ~lemonThins[\ingl][i] = ~lemonThins[\ing][i].size;

  //get char ascii value
  ~lemonThins[\ingChar][i] = ~lemonThins[\ing][i].ascii;
};

/*
Process directions
*/

//get general data
~lemonThins[\dir] = ["Cream", "shortening", "sugars", "add", "egg", "and", "lemon", "juice", "sift", "flour", "salt", "and", "soda", "together", "add", "to", "mixture", "add", "lemon", "rind", "put", "through", "cookie", "press", "onto", "ungreased", "cookie", "sheets", "400", "degrees", "about", "10", "minutes"];
~lemonThins[\dirl] = 0!~lemonThins[\dir].size;
~lemonThins[\dirChar] = 0!~lemonThins[\dir].size;

//get data
~lemonThins[\dir].size.do{|i|

  //get size of each
  ~lemonThins[\dirl][i] = ~lemonThins[\dir][i].size;

  //get char ascii value
  ~lemonThins[\dirChar][i] = ~lemonThins[\dir][i].ascii;
};

//get verbs in directions, leave action words
~lemonThins[\verb] = ["Cream", "add", "sift", "add", "add", "put"];
~lemonThins[\verbl] = 0!~lemonThins[\verb].size;
~lemonThins[\verbChar] = 0!~lemonThins[\verb].size;

//get data
~lemonThins[\verb].size.do{|i|

  //get size of each
  ~lemonThins[\verbl][i] = ~lemonThins[\verb][i].size;

  //get char ascii value
  ~lemonThins[\verbChar][i] = ~lemonThins[\verb][i].ascii;
};
