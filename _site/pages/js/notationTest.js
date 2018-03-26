var recipes = [];

//set these with sc and map values
var onset = 500;
var freq = 200;
var amp = 40;
var dur = 50;
var attack = 10;
var release = 25;
var show;
var velocity;
var working = false;

client.on('message', function(address, args) {
  if (address === '/recipe') {
    console.log(args);
    freq = args[1];
    amp = args[2];
    dur = args[3];
    attack = args[4];
    release = args[5];
    show = args[6];
    velocity = args[7];

    //onset, attack, decay, dur
    recipes.push(new Recipe(onset, freq, onset+attack, freq-amp, onset+dur-release,
      freq-amp, onset+dur, freq, show, velocity));
  };
});

client.on('message', function(address, args) {
  if (address === '/working') {
    if (args[0] == 1) {
      console.log("i'm working")
      working = true;
    } else {
      working = false;
    }
  }
});


function setup() {
  createCanvas(displayWidth, displayHeight);
}

function draw() {
  background(51);
  strokeWeight(2);
  line(100, 20, 100, 700);

  for (var i = 0; i < recipes.length; i++) {
    recipes[i].update();
    recipes[i].display();
    recipes[i].changeColor();
  }

  //title
  fill(255);
  text("Violin", 25, 25);

  //post green dot
  if (working) {
    fill(0, 255, 0);
    ellipse(25,50,25,25);

  } else {}
}
