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
  
  void reproduction(){
    for(int i=0;i<population.length;i++){
      int parentA = int(random(matingPool.size()));
      int parentB = int(random(matingPool.size()));
      
      Rocket mom = matingPool.get(parentA);
      Rocket dad = matingPool.get(parentB);
      
      DNA momGenes = mom.getDNA();
      DNA dadGenes = dad.getDNA();
      
      DNA child = momGenes.crossover(dadGenes);
      
      PVector startingPosition = new PVector(width/2,height+20);
      population[i] = new Rocket(startingPosition); 
    }
    generations++;
  }
  
  void live(){
    for(int i=0;i<population.length;i++){
      population[i].run();
    }
  }

}
