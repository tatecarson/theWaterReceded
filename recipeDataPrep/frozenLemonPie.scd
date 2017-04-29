/*
This processes a recipe for numberical content
The number of ingredients, directions, and verbs from directions
are stored along with their lenghts and ascii values
*/

~frozenLemonPie = ();

/*
Process ingredients
*/

//list ing
~frozenLemonPie[\ing] = ["Egg Yolks", "egg whites", "sugar", "lemon juice", "lemon", "pet milk"];
~frozenLemonPie[\ingl] = 0!~frozenLemonPie[\ing].size;
~frozenLemonPie[\ingChar] = 0!~frozenLemonPie[\ing].size;

//get data
~frozenLemonPie[\ing].size.do{|i|

  //get size of each
  ~frozenLemonPie[\ingl][i] = ~frozenLemonPie[\ing][i].size;

  //get char ascii value
  ~frozenLemonPie[\ingChar][i] = ~frozenLemonPie[\ing][i].ascii;
};

/*
Process directions
*/
//get general data
~frozenLemonPie[\dir] = ["Beat", "egg", "yolks", "add", "1", "4", "cup", "sugar", "and", "cook", "until", "think", "add", "juice", "and", "rind", "cool", "beat", "white", "add", "1", "4", "cup", "sugar", "beat", "chilled", "pet", "milk", "fold", "together", "Graham", "cracker", "crust", "freeze"];
~frozenLemonPie[\dirl] = 0!~frozenLemonPie[\dir].size;
~frozenLemonPie[\dirChar] = 0!~frozenLemonPie[\dir].size;

//get data
~frozenLemonPie[\dir].size.do{|i|

  //get size of each
  ~frozenLemonPie[\dirl][i] = ~frozenLemonPie[\dir][i].size;

  //get char ascii value
  ~frozenLemonPie[\dirChar][i] = ~frozenLemonPie[\dir][i].ascii;
};

//get verbs in directions, leave action words
~frozenLemonPie[\verb] = ["Beat", "add", "cook", "add", "cool", "beat", "beat", "fold", "freeze"];
~frozenLemonPie[\verbl] = 0!~frozenLemonPie[\verb].size;
~frozenLemonPie[\verbChar] = 0!~frozenLemonPie[\verb].size;

//get data
~frozenLemonPie[\verb].size.do{|i|

  //get size of each
  ~frozenLemonPie[\verbl][i] = ~frozenLemonPie[\verb][i].size;

  //get char ascii value
  ~frozenLemonPie[\verbChar][i] = ~frozenLemonPie[\verb][i].ascii;
};
