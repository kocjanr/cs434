class Population {
  float mutationRate;
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  int generations;
  PVector target;
  float fitness;
  
  Population(float rate, int pop){
    mutationRate = rate;
    population = new Rocket[pop];
    generations = 0;
  
  }
  
  void fitness(){
    for(int i=0;i<population.length;i++){
      population[i].fitness();
    }
  }
  void selection(){}
  void reproduction(){}
  
  void live(){
    for(int i=0;i<population.length;i++){
      population[i].run();
    }
  }

}
