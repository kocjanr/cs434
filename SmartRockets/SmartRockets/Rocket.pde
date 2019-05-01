class Rocket{
PVector location;
PVector velocity;
PVector acceleration;

void applyForce(PVector f){
  acceleration.add(f);
}

void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
}

}
