int lifeCounter;
Rocket rocket;
final int LIFETIME = 100;
PVector target;
Population population;
  
  void setup() {
    size(800, 800);
    rocket = new Rocket(new PVector(100,200));
    target = new PVector(width/2,50);
    lifeCounter = 0;  
    float mutationRate = 0.01;
    population = new Population(mutationRate, 50);
  }
  
  void draw() {
    background(255);
    //rocket.display();
    //rocket.update();
    
    ellipse(target.x,target.y,50,50);


    if (lifeCounter < LIFETIME) {
      population.live();
      lifeCounter++;
    } else {
      lifeCounter = 0;
      population.fitness();
      population.selection();
      population.reproduction();
    }
}
