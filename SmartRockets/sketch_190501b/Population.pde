class Population {
  float mutationRate;
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  int generations;
  
  void fitness(){}
  void selection(){}
  void reproduction(){}
  
  void live(){
    for(int i=0;i<population.length;i++){
      population[i].run();
    }
  }

}
