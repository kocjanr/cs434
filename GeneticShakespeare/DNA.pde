class DNA {
  char[] genes;
  float fitness;
  
  
  DNA(){
    genes = new char[target.length()];
    
    for(int i=0;i<genes.length; ++i){
      genes[i] = (char)random(32,128);
    }
  }
  
  void fitness(){
    int score = 0;
    for(int i=0;i<genes.length; i++){
      if(genes[i] == target.charAt(i)){
        ++score;
      }
    }
    fitness = float(score)/target.length();
  }
  
  DNA crossover(DNA partner){
    DNA child = new DNA();
    
    int randomChance = int(random(0,1));
    
    for(int i=0;i < genes.length;i++){
      if(randomChance == 0){
        child.genes[i] = genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }
    
    return child;
  }
  
  void mutate(){
     for (int i = 0; i < genes.length; i++) {
       if(random(1) < mutationRate){
         genes[i] = (char)random(32,128);
       }
     }
  }
  
  String getPhrase(){
  return new String(genes);
  }
 
}
