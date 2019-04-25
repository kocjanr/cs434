import java.util.concurrent.ThreadLocalRandom;
int count = 0;

public static String Word(){
  StringBuilder word = new StringBuilder();
  char[] alphabet = "abcdefghijklmnopqrstuvwxyz".toCharArray();
  
  for(int i=0; i<3;i++){
    int randomNum = ThreadLocalRandom.current().nextInt(0, 23 + 1);
    char letter = alphabet[randomNum];
    
    word.append(letter);
  }
  
  return word.toString();
}

void setup() {
  size(800,800);
  background(0);
}

void draw(){
  String rando = Word();

  
  textSize(100);
  fill(random(0,255));
  text(rando,random(0,width),random(0,height));
  
  ++count;
  
  if ("cat".equals(rando)){
    System.out.println(count);
    exit();
    
  }
}
