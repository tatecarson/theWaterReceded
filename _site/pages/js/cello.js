var movers = [];
var recipes = [];

//set these with sc and map values
var onset = 500;
var freq = 200;
var amp = 40;
var dur = 50;
var attack = 10;
var release = 25;
var show;
var working = false;
var recipeName;
var repititions;

//colors
var bg = '#50514F'
var play
var off = '#70c1b3'

client.on('message', function (address, args) {
  if (address === '/cello') {
    console.log(args);
    freq = args[1];
    amp = args[2];
    dur = args[3];
    attack = args[4];
    release = args[5];
    show = args[6];

    //onset, attack, decay, dur
    movers.push(new Mover(onset, freq, onset + attack, freq - amp, onset + dur - release, freq - amp, onset + dur, freq, show));
  }
})

client.on('message', function (address, args) {
  if (address === '/celloRecipe') {
    console.log(args);
    freq = args[1];
    amp = args[2];
    velocity = args[3];
    show = args[4];
    //attackx, attacky, amp, velocity, show
    recipes.push(new Recipe(onset, freq, amp, velocity, show));
  };
});

client.on('message', function (address, args) {
  if (address === '/working') {
    if (args[0] == 1) {
      console.log("i'm working")
      working = true;
    } else {
      working = false;
    }
  }
});

client.on('message', function (address, args) {
  if (address === '/recipeName') {
    recipeName = args[0];
    repetitions = args[1];
  };
});

function setup() {
  var cnv = createCanvas(windowWidth, windowHeight);
  cnv.style('display', 'block');
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function draw() {
  background(bg);
  strokeWeight(2);

  //boundary
  stroke(255)
  line(100, 20, 100, 700);

  for (var i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
    movers[i].changeColor();
  }

  for (var i = 0; i < recipes.length; i++) {
    recipes[i].update();
    recipes[i].display();
    recipes[i].changeColor();
  }

  //title
  fill(255);
  text("Player Two", 25, 25);

  //recipe name
  textSize(18);
  if (recipeName) { //to handle null
    text(recipeName, 200, 25);
    text(repetitions, 200, 50);
  }

  //post green dot
  if (working) {
    fill(0, 255, 0);
    ellipse(25, 50, 25, 25);

  }
}
