int lifetime;
int lifeCounter;
Rocket rocket;
final int LIFETIME = 100;
PVector target;
Population population;
  
  void setup() {
    size(800, 800);
    rocket = new Rocket(new PVector(100,200));
    
    lifetime = 500;
    lifeCounter = 0;
  
    float mutationRate = 0.01;
    population = new Population(mutationRate, 50);
  }
  
  void draw() {
    background(255);
    rocket.display();
    rocket.update();
    
    //background(255);
    //if (lifeCounter < lifetime) {
    //  population.live();
    //  lifeCounter++;
    //} else {
    //  population.fitness();
    //  population.selection();
    //  population.reproduction();
    //}
}
