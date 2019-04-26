DNA[] population = new DNA[100];

void setup(){
  size(800,800);
  
  for(int i=0;i<population.length;++i){
    population[i] = new DNA();
  }
  
  //for(DNA dna: population){
  //  dna.fitness();
  //  println(dna.fitness);
  //}
  
  //for(DNA d:population){
  //  for(char c : d.genes){
  //  print(c);
  //  }
  //  println();
  //}
  
}

void draw(){
  background(255);
  
  ArrayList<DNA>matingPool = new ArrayList<DNA>();
  
  for(int i=0;i<population.length;i++){
    int n = int(population[i].fitness * 100);
    
    for(int j=0;j<n;j++){
      matingPool.add(population[i]);
    }
  }
}
