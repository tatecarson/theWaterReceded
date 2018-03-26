
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

var Recipe = function(attackx, attacky, amp, velocity, show) {
  this.attack = createVector(attackx, attacky);
  // this.decay = createVector(decayx, decayy);
  // this.dur = createVector(durx, dury);
  // this.onset = createVector(onsetx, onsety);
  this.col = 51;
  this.velocity = createVector(velocity, 0); //x/y speed
  this.amp = amp; 

  this.update = function() {
    this.attack.add(this.velocity);
    // this.decay.add(this.velocity);
    // this.dur.add(this.velocity);
    // this.onset.add(this.velocity);
  };

  this.display = function() {
    stroke(0);
    strokeWeight(2);
    noStroke();

    fill(this.col);
    ellipse(this.attack.x, this.attack.y, this.amp, this.amp);
    // quad(this.attack.x, this.attack.y, this.decay.x, this.decay.y, this.dur.x, this.dur.y, this.onset.x, this.onset.y);
  };

  this.changeColor = function() {

    if (show === 1) {
      this.col = color(255);

      if (this.attack.x < 100) {
        this.col = color(4, 255, 0);
      };

      if(this.attack.x == 100) {
        client.send('/trigger', [1])
      }
    } else if (show === 0) {
      this.col = color(255, 0);
    } else if (show === 2) {
      this.col = color(100);
    }
  }
};
