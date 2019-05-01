class Rocket{
PVector location;
PVector velocity;
PVector acceleration;
DNA dna;
float fitness;
PVector target;
int geneCounter = 0;

void applyForce(PVector f){
  acceleration.add(f);
}

void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
}

void fitness(){
  float d = PVector.dist(location,target);
  fitness = 1/d;
}

void run(){
  applyForce(dna.genes[geneCounter]);
  geneCounter++;
  update();
}


}
