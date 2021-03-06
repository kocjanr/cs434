DNA[] population = new DNA[100];
float mutationRate = 0.01;
int totalPopulation = 150;
String target = "to be or not to be";

void setup(){
  size(800,800);
  background(0);
  
  for(int i=0;i<population.length;++i){
    population[i] = new DNA();
  }
  
}

void draw(){  
  ArrayList<DNA>matingPool = new ArrayList<DNA>();
  
  for(int i=0; i < population.length; i++){
    population[i].fitness();
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
    
    population[i] = child;
    println(population[i].getPhrase());
    if(population[i].getPhrase().equals(target)){
      println(population[i].getPhrase());
      exit();
    }
  }
  
  //background(255);
  //fill(0);
  //frameRate(10);
  //String everything = "";
  //for (int i = 0; i < population.length; i++) {
  //  everything += population[i].getPhrase() + "     ";
  //}
  //textFont(createFont("Courier",12,true),12);
  //text(everything,10,10,width,height);
}
