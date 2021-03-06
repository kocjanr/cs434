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
  
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
       if(population[i].fitness > record) {
         record = population[i].fitness;
       }
    }
    return record;
  }

  
  void selection(){
    matingPool.clear();
    float maxFitness = getMaxFitness();
    
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].fitness,0,maxFitness,0,1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }
  
  void reproduction(){
    for(int i=0;i<population.length;i++){
      
      int parentA = int(random(matingPool.size()));
      int parentB = int(random(matingPool.size()));
      
      Rocket mom = matingPool.get(parentA);
      Rocket dad = matingPool.get(parentB);
      
      DNA momGenes = mom.dna;
      DNA dadGenes = dad.dna;
      
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
