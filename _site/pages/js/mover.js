// The Nature of Code Daniel Shiffman http://natureofcode.com

var Mover = function (onsetx, onsety, attackx, attacky, decayx, decayy, durx, dury, show) {
  this.attack = createVector(attackx, attacky);
  this.decay = createVector(decayx, decayy);
  this.dur = createVector(durx, dury);
  this.onset = createVector(onsetx, onsety);
  this.col = '#70c1b3';
  this.velocity = createVector(-2, 0); //x/y speed

  this.update = function () {
    this
      .attack
      .add(this.velocity);
    this
      .decay
      .add(this.velocity);
    this
      .dur
      .add(this.velocity);
    this
      .onset
      .add(this.velocity);
  };

  this.display = function () {
    stroke(0);
    strokeWeight(2);
    noStroke();

    fill(this.col);
    quad(this.attack.x, this.attack.y, this.decay.x, this.decay.y, this.dur.x, this.dur.y, this.onset.x, this.onset.y);
  };

  this.changeColor = function () {

    if (show === 1) {
      this.col = '#70c1b3';

      if (this.onset.x < 100) {
        this.col = '#ffe066';
      };

      if (this.onset.x == 100) {
        client.send('/trigger', [1])
      }
    } else if (show === 0) {
      this.col = color(255, 0);
    } else if (show === 2) {
      this.col = color(100);
    }
  }
};
