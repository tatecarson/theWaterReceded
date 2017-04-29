/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~oatmealCookies = ();

/*
Process ingredients
*/

//list ing
~oatmealCookies[\ing] = ["flour", "baking soda", "salt", "cinnamon", "nutmeg", "shortening", "brown sugar", "white sugar", "eggs", "oatmeal", "raisins"];
~oatmealCookies[\ingl] = 0!~oatmealCookies[\ing].size;
~oatmealCookies[\ingChar] = 0!~oatmealCookies[\ing].size;

//get data
~oatmealCookies[\ing].size.do{|i|

  //get size of each
  ~oatmealCookies[\ingl][i] = ~oatmealCookies[\ing][i].size;

  //get char ascii value
  ~oatmealCookies[\ingChar][i] = ~oatmealCookies[\ing][i].ascii;
};

/*
Process directions
*/

//get general data
~oatmealCookies[\dir] = ["Sift", "flour", "salt", "soda", "cinnamon", "and", "nutmeg", "In", "mixing", "bowl", "work", "shortening", "until", "creams", "Stir", "in", "sugars", "beat", "add", "eggs", "beat", "Add", "dry", "ingredients", "oats", "raisins", "nust", "and", "stir", "until", "mixed", "Drop", "on", "greased", "baking", "sheet", "350", "13", "15", "min", "Remove", "and", "cool", "on", "rack"];
~oatmealCookies[\dirl] = 0!~oatmealCookies[\dir].size;
~oatmealCookies[\dirChar] = 0!~oatmealCookies[\dir].size;

//get data
~oatmealCookies[\dir].size.do{|i|

  //get size of each
  ~oatmealCookies[\dirl][i] = ~oatmealCookies[\dir][i].size;

  //get char ascii value
  ~oatmealCookies[\dirChar][i] = ~oatmealCookies[\dir][i].ascii;
};

//get verbs in directions, leave action words
~oatmealCookies[\verb] = ["Sift", "work", "Stir", "beat", "add", "beat", "Add", "stir", "Drop", "Remove", "cool"];
~oatmealCookies[\verbl] = 0!~oatmealCookies[\verb].size;
~oatmealCookies[\verbChar] = 0!~oatmealCookies[\verb].size;

//get data
~oatmealCookies[\verb].size.do{|i|

  //get size of each
  ~oatmealCookies[\verbl][i] = ~oatmealCookies[\verb][i].size;

  //get char ascii value
  ~oatmealCookies[\verbChar][i] = ~oatmealCookies[\verb][i].ascii;
};
