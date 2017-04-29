/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~oysterPatties = ();

/*
Process ingredients
*/

//list ing
~oysterPatties[\ing] = ["oysters", "lizuor", "butter", "flour", "shallots", "onion", "parsley"];
~oysterPatties[\ingl] = 0!~oysterPatties[\ing].size;
~oysterPatties[\ingChar] = 0!~oysterPatties[\ing].size;

//get data
~oysterPatties[\ing].size.do{|i|

  //get size of each
  ~oysterPatties[\ingl][i] = ~oysterPatties[\ing][i].size;

  //get char ascii value
  ~oysterPatties[\ingChar][i] = ~oysterPatties[\ing][i].ascii;
};

/*
Process directions
*/
//get general data
~oysterPatties[\dir] = ["Saute", "onion", "in", "butter", "until", "soft", "add", "shallots", "and", "parsley", "Add", "flour", "and", "stir", "well", "Add", "oyster", "liquor", "intul", "mixture", "is", "very", "thick", "Add", "oysters", "cook", "about", "15", "minutes", "Add", "salt", "if", "necessary", "Put", "into", "shells", "and", "bake", "at", "370"];
~oysterPatties[\dirl] = 0!~oysterPatties[\dir].size;
~oysterPatties[\dirChar] = 0!~oysterPatties[\dir].size;

//get data
~oysterPatties[\dir].size.do{|i|

  //get size of each
  ~oysterPatties[\dirl][i] = ~oysterPatties[\dir][i].size;

  //get char ascii value
  ~oysterPatties[\dirChar][i] = ~oysterPatties[\dir][i].ascii;
};

//get verbs in directions, leave action words
~oysterPatties[\verb] = ["Saute", "add","Add", "stir", "Add", "Add", "cook", "Add", "Put", "bake"];
~oysterPatties[\verbl] = 0!~oysterPatties[\verb].size;
~oysterPatties[\verbChar] = 0!~oysterPatties[\verb].size;

//get data
~oysterPatties[\verb].size.do{|i|

  //get size of each
  ~oysterPatties[\verbl][i] = ~oysterPatties[\verb][i].size;

  //get char ascii value
  ~oysterPatties[\verbChar][i] = ~oysterPatties[\verb][i].ascii;
};
