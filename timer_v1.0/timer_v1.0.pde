import static javax.swing.JOptionPane.*;

int timeLimit = 3;
int countDown;
boolean timerExec = false;

void setup(){
  size(400, 300);
  textAlign(CENTER);
  textSize(50);
  //showMessageDialog(null, "test text");
}

void draw(){
  int timerX = width/2;
  int timerY = height/2;
  
  background(255);
  
  int ms = millis()/1000;
  
  countDown = timeLimit - ms;
  
  fill(0);
  if(0 < countDown){
    text("00:0" + countDown, timerX, timerY);
  }else{
    text("00:00", timerX, timerY);
    showMessageDialog(null, "TIME UP!", "Alert", ERROR_MESSAGE);
    noLoop();
  }
}
