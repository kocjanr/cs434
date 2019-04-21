import java.util.concurrent.ThreadLocalRandom;

String Word(){
  StringBuilder word = new StringBuilder();
  char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
  
  for(int i=0; i<3;i++){
    int randomNum = ThreadLocalRandom.current().nextInt(0, 23 + 1);
    char letter = alphabet[randomNum];
    
    word.append(letter);
  }
  
  System.out.println(word.toString());
  return word.toString();
}

void setup() {
  Word();
}
