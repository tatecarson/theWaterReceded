function setup() {
  createCanvas(800,800);
  stroke(255, 40);
  noLoop();
}

function draw() {
  background(0);

  var p1 = [random(width), random(height)];
  var p2 = [random(width), random(height)];
  var q1 = [random(width), random(height)];
  var q2 = [random(width), random(height)];
  for (var i = 0; i < 2000; i++) {
    var t = i / 2000;
    var p = [lerp(p1[0], p2[0], t), lerp(p1[1], p2[1], t)];
    var q = [lerp(q1[0], q2[0], t), lerp(q1[1], q2[1], t)];
    line(p[0] + 80*noise(0.015*i), p[1]+80*noise(0.012*i+5), q[0]+80*noise(0.011*i+10), q[1]+80*noise(0.013*i+15));
  }
}
