DNA[] population = new DNA[100];
float mutationRate = 0.01;
int totalPopulation = 150;
String target = "to be or not to be";
int generations;
float fitness;
String best;
String allPhrases;

void setup(){
  size(800,200);
  generations = 0;
  allPhrases = "";

  
  for(int i=0;i<population.length;++i){
    population[i] = new DNA();
  }
  
}

void draw(){  
  background(150);
  ArrayList<DNA>matingPool = new ArrayList<DNA>();
  
  for(int i=0; i < population.length; i++){
     population[i].fitness();
     fitness = population[i].fitness;
  }
  
  for(int i=0;i<population.length;i++){
    int n = int(population[i].fitness * 100);
    
      for(int j=0;j<n;j++){
      matingPool.add(population[i]);
    }
  }
  
  for (int i = 0; i < population.length; i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    
    DNA parentA = matingPool.get(a);
    DNA parentB = matingPool.get(b);
    
    DNA child = parentA.crossover(parentB);
    child.mutate();
     best = child.getPhrase();
    generations++;
    
    population[i] = child;
    //println(population[i].getPhrase());
    if(population[i].getPhrase().equals(target)){
      println(population[i].getPhrase());
      exit();
    }
  }
  

  fill(0);
  //frameRate(10);
  //String everything = "";
  //for (int i = 0; i < population.length; i++) {
  //  everything += population[i].getPhrase() + "     ";
  //}
  
  
  text("Best Phrase:",10,20);
   text(best,10,50);
  
  text("Total generations:",10,100);
  text(generations,125,100);
  
  text("average fitness:",10,125);
  text(fitness,125,125);
  
  text("Total population:",10,150);
  text(totalPopulation,125,150);
  
  text("mutation rate:",10,175);
  text(mutationRate,125,175);
  
  for (int i = 0; i < population.length; i++) {
    allPhrases += population[i].getPhrase() + "     ";
  }

  text(allPhrases,200,10,width,height);
  
}
