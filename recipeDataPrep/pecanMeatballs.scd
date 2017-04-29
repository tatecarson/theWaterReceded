/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~pecanMeatballs = ();

/*
Process ingredients
*/

//list ing
~pecanMeatballs[\ing] = ["Parmesan Romano cheese",  "Onion", "garlic", "Pecans", "eggs", "Pet cream", "Bread Crumbs"];
~pecanMeatballs[\ingl] = 0!~pecanMeatballs[\ing].size;
~pecanMeatballs[\ingChar] = 0!~pecanMeatballs[\ing].size;

//get data
~pecanMeatballs[\ing].size.do{|i|

  //get size of each
  ~pecanMeatballs[\ingl][i] = ~pecanMeatballs[\ing][i].size;

  //get char ascii value
  ~pecanMeatballs[\ingChar][i] = ~pecanMeatballs[\ing][i].ascii;
};

/*//now we have the ammount of ingredients
~pecanMeatballs[\ing].size

//length of ingredients
~pecanMeatballs[\ingl]

//ascii value of ingredients
~pecanMeatballs[\ingChar][0]*/


/*
Process directions
*/

//get general data
~pecanMeatballs[\dir] = ["Use", "your", "judgement", "mix", "all", "together", "put", "in", "regrigerator", "one", "nite", "Use", "a", "spoon", "and", "drop", "mixture", "in", "frying", "pan", "they", "will", "cook", "fast", "so", "watch", "them", "If", "you", "put", "them", "in", "gravy", "do", "so", "10", "minute", "before", "serving", "or", "else", "put", "meatballs", "over", "spagetti", "then", "put", "hot", "sauce", "on", "top", "a"];
~pecanMeatballs[\dirl] = 0!~pecanMeatballs[\dir].size;
~pecanMeatballs[\dirChar] = 0!~pecanMeatballs[\dir].size;

//get data
~pecanMeatballs[\dir].size.do{|i|

  //get size of each
  ~pecanMeatballs[\dirl][i] = ~pecanMeatballs[\dir][i].size;

  //get char ascii value
  ~pecanMeatballs[\dirChar][i] = ~pecanMeatballs[\dir][i].ascii;
};

//get verbs in directions, leave action words
~pecanMeatballs[\verb] = ["Use", "mix", "put", "Use", "drop", "watch", "put", "do", "put", "put"];
~pecanMeatballs[\verbl] = 0!~pecanMeatballs[\verb].size;
~pecanMeatballs[\verbChar] = 0!~pecanMeatballs[\verb].size;

//get data
~pecanMeatballs[\verb].size.do{|i|

  //get size of each
  ~pecanMeatballs[\verbl][i] = ~pecanMeatballs[\verb][i].size;

  //get char ascii value
  ~pecanMeatballs[\verbChar][i] = ~pecanMeatballs[\verb][i].ascii;
};
