var mapimg,
    katrina,
    clat = -89,
    clon = 30,
    ww = window.innerWidth,
    hh = window.innerHeight,
    zoom = 4,
    i = 2;

var ing, lifespan;
var ingredients = [];

client.on('message', function(address, args) {
  if (address === '/map') {
    i = i + 1;
  };
});

client.on('message', function(address, args) {
  if (address === '/recipe') {
    ing = args[0];

    if (ing) {
      ingredients.push(
        new Ingredient(ing, 500, random((-ww / 2) + 100, (ww / 2) - 100), random((-hh / 2) + 100, (hh / 2) - 100))
      );
    }
  };
});

function Ingredient(ing, lifespan, x, y){
  this.ing = ing;
  this.lifespan = lifespan;
  this.x = x;
  this.y = y;

  this.display = function() {
    textSize(30);
    textFont("Dawning of a New Day");
    fill(255, 255, 255, this.lifespan);
    text(this.ing, this.x, this.y);
  }

  this.dissolve = function() {
    this.lifespan--;
  }
}

client.on('message', function(address, args) {
  if (address === '/clear') {
    //draw background
    image(mapimg, 0, 0);
  };
});

function preload() {
  mapimg = loadImage('https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/' +
    clat + ',' + clon + ',' + zoom + '/' + ww + 'x' + hh +
    '?access_token=pk.eyJ1IjoidGFjYXJzb24iLCJhIjoiY2l6NHY2dDA5MDR0czMycGd4ajMzdGsxZyJ9.gar4fJVs8Yk8HcRo9oG2ng');

  katrina = loadStrings('data/katrina.csv');
}

//for map projection
function mercX(lon) {
  lon = radians(lon);
  var a = ((ww/4) / PI) * pow(2, zoom),
      b = lon + PI;

  return a * b;
}

function mercY(lat) {
  lat = radians(lat);
  var a = ((ww/4) / PI) * pow(2, zoom),
      b = tan(PI / 4 + lat / 2),
      c = PI - log(b);
  return a * c;
}

function setup() {
  createCanvas(ww, hh);
  image(mapimg, 0, 0);
}

//send i from SC
function draw() {
  translate(width / 2, height / 2);
  imageMode(CENTER);

  if (ingredients.length == 0) {
    var cx = mercX(clon),
        cy = mercY(clat);
        
    var data = katrina[i].split(/,/);

    var lat = data[1],
        lon = -data[2];

    // do projection
    var x = mercX(lon) - cx,
        y = mercY(lat) - cy;

    //offset
    x = x + 3378;
    y = y + 8560;

    //draw
    noStroke();
    fill(255);

    ellipse(x, y, 5, 5);
  }

  if (ingredients.length > 0) {
    image(mapimg, 0, 0);

    for (var j = 0; j < ingredients.length; j++) {
      ingredients[j].display();
      ingredients[j].dissolve();
    }
  }

}
