import static javax.swing.JOptionPane.*;

int timeLimit = 3;
int countDown;
boolean timerExec = false;
int pauseTime = 0;
int elapsed;
int remain;
int btnW;
int btnH;
boolean timeUp = false;
boolean pop = false;

void setup() {
  size(400, 300);
  textAlign(CENTER);
  rectMode(CENTER);
  //showMessageDialog(null, "test text");
  countDown = timeLimit;

  btnW = 100;
  btnH = 40;
}

void draw() {
  background(255);
  int timerX = width/2;
  int timerY = 120;
  //elapsed = millis() - countDown;
  //remain = timeLimit - elapsed/1000;

  textSize(70);
  fill(0);
  text("00:0" + remain, timerX, timerY);

  if (timerExec == false) {
    //pauseTime = millis();
    button(width/2 - 70, 210, "PAUSE");
  } else {
    if (pauseTime == 0) {
      //countDown = millis();
    } else {
      //countDown += millis() - pauseTime;
    }
    button(width/2 - 70, 210, "START");
  }
  button(width/2 + 70, 210, "RESET");

  if (remain == 0) {
    timeUp = true;
  }

  if (timeUp == true) {
    pop = true;
    //popUp();
    timeUp = false;
  }
}

void mousePressed() {
  //Start&Pause
  if (width/2-70 - btnW/2 < mouseX && mouseX < width/2-70 +btnW/2) {
    if (210 - btnH/2 < mouseY && mouseY < 210 + btnH/2) {
      if (timerExec == false)  timerExec = true;
      else                     timerExec = false;
    }
  }

  //Reset
  if (width/2+70 - btnW/2 < mouseX && mouseX < width/2+70 +btnW/2) {
    if (210 - btnH/2 < mouseY && mouseY < 210 + btnH/2) {
      timerExec = false;
      elapsed = 0;
      pauseTime = 0;
      remain = 0;
      pop = false;
      timeUp = false;
    }
  }
}

void button(int centerX, int centerY, String label) {
  stroke(0);
  fill(255);
  rect(centerX, centerY, btnW, btnH);
  textSize(20);
  fill(0);
  text(label, centerX, centerY + 8);
}

void pause() {
  pauseTime = millis();
  timerExec = true;
}

void popUp() {
  showMessageDialog(null, "Time UP!", "Alert", ERROR_MESSAGE);
  pop = false;
}
