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
    matingPool = new ArrayList<Rocket>();
    
    for (int i = 0; i < population.length; i++) {
      PVector position = new PVector(width/2,height+20);
      population[i] = new Rocket(position, new DNA());
    }
   
  }
  
  void fitness(){
    for(int i=0;i<population.length;i++){
      population[i].fitness();
    }
  }
  
  void selection(){
    float bestFitness = 0;
    
    for (int i=0;i<population.length;i++){
      population[i].fitness();
      bestFitness = population[i].fitness;
      if(population[i].fitness >bestFitness ){
        matingPool.add(population[i]);        
      }
    }
  }
  
  void reproduction(){
    for(int i=0;i<population.length;i++){
      
      println(matingPool.size());
      int parentA = int(random(matingPool.size()));
      int parentB = int(random(matingPool.size()));
      
      Rocket mom = matingPool.get(parentA);
      Rocket dad = matingPool.get(parentB);
      
      DNA momGenes = mom.getDNA();
      DNA dadGenes = dad.getDNA();
      
      DNA child = momGenes.crossover(dadGenes);
      
      PVector startingPosition = new PVector(width/2,height);
      population[i] = new Rocket(startingPosition,child); 
    }
    generations++;
  }
  
  void live(){
    for(int i=0;i<population.length;i++){
      population[i].run();
    }
  }

}
