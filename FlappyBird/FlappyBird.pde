int upperPipeHeight = (int) random(50, 105);
boolean gameOver = false;
int lowerPipeTop = 200;
int pipeWidth = 25;
int pipeX = 299;
//int pipeX2 = 200;
int birdY = 150;
int birdX = 20;
int birdYVelocity = 30;
int gravity = 1;
int score = 0;
void setup() {
  size(300, 300);
}
void draw() {
  if (gameOver == false) {
    background(137, 215, 237);
    fill(237, 205, 23);
    ellipse(birdX, birdY, 25, 25);
    fill(0, 255, 0);
    rect(pipeX, 0, pipeWidth, upperPipeHeight);
    birdY += gravity;
    pipeX -= 1;
    // pipeX2 -= 1;
    teleportPipes();
    fill(0, 255, 0);
    rect(pipeX, 200, pipeWidth, lowerPipeTop);
    fill(0, 255, 0);
    //rect(pipeX2, 220, pipeWidth, 80);
    fill(0, 255, 0);
    //rect(pipeX2, 0, pipeWidth, upperPipeHeight);
    fill(80, 180, 0);
    rect(-1, 290, 301, 10);
    textSize(32);
    fill(255, 255);
    text(score, 10, 30);
  }

  if (intersectsPipes() || birdY > 290) {
    gameOver = true;
    clear();
    background(0, 0, 0);
    textSize(50);
    fill(255, 255, 255);
    text("Game over!", 19, 155);
  } else if (birdX > pipeX) {
    score += 1;
  }
}
void mousePressed() {
  birdY -= birdYVelocity;
}
void teleportPipes() {

  if (pipeX == -25) {
    pipeX = 299;
    upperPipeHeight = (int) random(50, 105);
  }
  //if (pipeX2 == -25) {
  //  pipeX2 = 299;
  //  upperPipeHeight = (int) random(50, 155);
  //}
}
boolean intersectsPipes() { 
  if (birdY < upperPipeHeight && birdX > pipeX && birdX < (pipeX+pipeWidth)) {
    return true;
  } else if (birdY>lowerPipeTop && birdX > pipeX && birdX < (pipeX+pipeWidth)) {
    return true;
  } else { 
    return false;
  }
}
