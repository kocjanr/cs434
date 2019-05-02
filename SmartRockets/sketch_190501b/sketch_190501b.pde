int lifetime;
int lifeCounter;
Population population;

void setup(){
  size(640,480);
  lifetime = 500;
  lifeCounter = 0;
  
  float mutationRate = 0.01;
  population = new Population();
}

void draw(){
background(255);

}
