Car a = new Car(400, 300, 70, 10);
Car b = new Car(200, 100, 70, 5);
Car c = new Car(300, 200, 70, 7);
Car d = new Car(100, 50, 70, 7);
Car e = new Car(500, 400, 70, 7);
int frogX = 400;
int frogY = 570;
void setup() {
  size(800, 600);
}
void draw() {
  background(161, 162, 163);
  fill(20, 173, 12);
  ellipse (frogX, frogY, 30, 30);
  frogBoundaries();
  a.display();
  b.display();
  c.display();
  d.display();
  e.display();
  a.carMoveLeft();
  b.carMoveRight();
  c.carMoveLeft();
  d.carMoveRight();
  e.carMoveLeft();
  a.intersects(a);
  b.intersects(b);
  c.intersects(c);
  d.intersects(d);
  e.intersects(e);
  if (a.intersects(a)) {
    frogX = 400;
    frogY = 570;
  }
  if (b.intersects(b)) {
    frogX = 400;
    frogY = 570;
  }
  if (c.intersects(c)) {
    frogX = 400;
    frogY = 570;
  }
  if (d.intersects(d)) {
    frogX = 400;
    frogY = 570;
  }
  if (e.intersects(e)) {
    frogX = 400;
    frogY = 570;
  }
}
void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      frogY -= 15;
    } else if (keyCode == DOWN)
    {
      frogY += 15;
    } else if (keyCode == RIGHT)
    {
      frogX += 15;
    } else if (keyCode == LEFT)
    {
      frogX -= 15;
    }
  }
}
void frogBoundaries() {
  if (frogX >= 800) {
    frogX = 770;
  }
  if (frogX <= 0) {
    frogX = 30;
  }
  if (frogY >= 600) {
    frogY = 570;
  }
  if (frogY <= 0) {
    frogY = 30;
  }
}
class Car {
  int carX;
  int carY;
  int carSize;
  int carSpeed;
  Car(int carX, int carY, int carSize, int carSpeed) {
    this.carX = carX;
    this.carY = carY;
    this.carSize = carSize;
    this.carSpeed = carSpeed;
  }
  void display() {
    fill(255, 0, 0);
    rect(carX, carY, carSize, 50);
  }
  void carMoveRight() {
    carX += carSpeed;
    if (carX > 800) {
      carX = 0;
    }
  }
  void carMoveLeft() {
    carX -= carSpeed;
    if (carX < 0) {
      carX = 800;
    }
  }
  public int getX() {
    return carX;
  }
  public int  getY() {
    return carY;
  }
  public int getSize() {
    return carSize;
  }
  boolean intersects(Car car) {
    if ((frogY > car.getY() && frogY < car.getY()+50) && (frogX > car.getX() && frogX < car.getX()+car.getSize())) {           
      return true;
    } else {
      return false;
    }
  }
}
