/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~pecanPralines = ();

/*
Process ingredients
*/

//list ing
~pecanPralines[\ing] = ["white sugar", "brown sugar", "cold water", "vanilla", "butter", "pecans"];
~pecanPralines[\ingl] = 0!~pecanPralines[\ing].size;
~pecanPralines[\ingChar] = 0!~pecanPralines[\ing].size;

//get data
~pecanPralines[\ing].size.do{|i|

  //get size of each
  ~pecanPralines[\ingl][i] = ~pecanPralines[\ing][i].size;

  //get char ascii value
  ~pecanPralines[\ingChar][i] = ~pecanPralines[\ing][i].ascii;
};

/*
Process directions
*/


//get general data
~pecanPralines[\dir] = ["Cook", "to", "soft", "bal", "Add", "butter", "vanilla", "and", "pecans", "Beat", "until", "thick", "drop", "on", "wax", "paper"];
~pecanPralines[\dirl] = 0!~pecanPralines[\dir].size;
~pecanPralines[\dirChar] = 0!~pecanPralines[\dir].size;

//get data
~pecanPralines[\dir].size.do{|i|

  //get size of each
  ~pecanPralines[\dirl][i] = ~pecanPralines[\dir][i].size;

  //get char ascii value
  ~pecanPralines[\dirChar][i] = ~pecanPralines[\dir][i].ascii;
};

//get verbs in directions, leave action words
~pecanPralines[\verb] = ["Cook", "Add", "Beat", "drop"];
~pecanPralines[\verbl] = 0!~pecanPralines[\verb].size;
~pecanPralines[\verbChar] = 0!~pecanPralines[\verb].size;

//get data
~pecanPralines[\verb].size.do{|i|

  //get size of each
  ~pecanPralines[\verbl][i] = ~pecanPralines[\verb][i].size;

  //get char ascii value
  ~pecanPralines[\verbChar][i] = ~pecanPralines[\verb][i].ascii;
};
