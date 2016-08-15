rhizome.on('message', function(address, args) {
  if (address === '/sc') {
    console.log(args);
    x = args[0];
    y = args[1];
  }
})

var x = 500, y = 500;

function setup() {
	createCanvas(displayWidth, displayHeight);
}

function draw() {
	background(0, 0, 255);
	fill(0, 255, 0);
	ellipse(x, y, 100, 100);
	fill(0);
	text("I'm p5.js", x-25, y);
}
