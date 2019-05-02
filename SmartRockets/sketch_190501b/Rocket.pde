class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  float fitness;
  DNA dna;
  int geneCounter = 0;

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void fitness() {
    float d = PVector.dist(location, target);
    fitness = pow(1/d, 2);
  }

  void run() {
    applyForce(dna.genes[geneCounter]);
    geneCounter++;
    update();
  }
}
