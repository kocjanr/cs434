import java.util.concurrent.ThreadLocalRandom;

String Word(){
  String word= new String();
  char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
  
  for(int i=0; i<3;i++){
    int randomNum = ThreadLocalRandom.current().nextInt(0, 23 + 1);
    char letter = alphabet[randomNum];
    
    
  }
  
  return word;
}
