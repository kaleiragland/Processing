class Car {
  float x;
  float y;
  float z; 
  float level;
  float size1;
  float size2;
  float r;
  float g;
  float b;
  float speed;



Car(float level, float speed) {
  this.level = level;
  this.speed = speed;
    x = 0;
    if (level == 0) {
    y = random(510, 516);
    }
    else {
      y = random(560, 570);
    }
  z = 1;
  size1 = 40;
  size2 = 20;
  r = random(255);
  g = random(255);
  b = random(255);
}

void display() {
  noStroke();
  fill(r,g,b);
  rect(x, y, size1, size2);



}
void move(){
  if(level == 1) {
    x += speed;
    leftWheel(1);
    rightWheel(1);
    if (x> width+size1) {
      x = -size1;
    }
  }
  else{
    leftWheel(-1);
    rightWheel(-1);
    x -= speed;
    if (x < -size1) {
      x = width + size1;
  }
}
}
void rightWheel(float d) {
  pushMatrix();
  fill(0);
  ellipse(x + 37, y + 20, 15, 15);
  translate(x + 37, y + 20);
  rotate(radians(z * d));
  fill(155);
  ellipse(-2, -2, 5, 5);
 z += speed;
  popMatrix();
}
void leftWheel(float d) {
  fill(0);
  pushMatrix();
  translate(x,y + 20);
  rotate(radians(z * d));
  ellipse(0, 0, 15, 15);
  fill(155);
  ellipse(-2, -2, 5, 5);
  z += speed;
  popMatrix();
}
}
