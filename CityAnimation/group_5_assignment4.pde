import processing.sound.*;

SoundFile file;

Car upperCar = new Car(0, 2);
Car lowerCar = new Car(1, 4);

Moon m1;
Moon m2;
Star[] stars = new Star[10];

float divider;

void setup() {
  size(600,600);
 
m1 = new Moon(random(230,70),random(160,210), random(130,160), random(140,150),color(#FAF36D));
m2 = new Moon(random(150,80),random(170,210), random(40,60), random(40,50),color(#FCFCFA));
  
  for (int i = 0; i <stars.length; i++) {
    stars[i] = new Star(1);
 }
 
  divider = 3;
  file = new SoundFile(this,"noise.wav");
  file.play();
  file.amp(1);
  file.loop();
}
void draw() {
  background(49, 61, 180);
 
  for (int i = 0; i < stars.length; i++) {
  stars[i].display(); 
  stars[i].move();
  
}
/*
    for(int x = 0; x <= 250; x++){
      stroke(0, 0, blue);
      line(x1, y1, x2,y2);
      y1++;
      y2++;
      blue ++;
    }
    */
  
  fill(80);
  stroke(80);
  rect(0,500, width, 110);
  fill(247, 225, 97);
  stroke(247, 225, 97);
  rect(0, 550 - divider, width, divider + 2);
  
  upperCar.display();
  upperCar.move();
  lowerCar.display();
  lowerCar.move();
 
  stroke(0);
  fill(44, 33, 10); 
  rect(0, 290, 100, 210);
  rect(120, 200, 100, 300); 
  rect(160, 150, 3, 50);
  rect(250, 250, 140, 250); 
  rect(410, 350, 200, 150); 
  rect(520, 300, 100, 50); 
  
  fill(245, 231, 200);
  windows(0, 290, 100, 31, 4);
  windows(120, 200, 220, 51, 4);
  windows(250, 250, 390, 65, 6);
  windows(410, 350, 530, 29, 5);
  windows(520, 300, 600, 23, 3);
  
  m1.display();
  m2.display();
  m1.move();
  m2.move();

}

void windows(int xPos, int yPos, int end, int per, int columns) {
  int initial = xPos + 15;
  xPos = xPos + 15; 
  yPos = yPos + 20;
for (int i = 0; i <= per; i++) {
  if (xPos >= (end - 10) ||  i == columns) {
    xPos = initial;
    yPos += 20;
  }
  fill(#FFF4D1, 70);
  rect(xPos, yPos, 10, 10);
  xPos += 20; }}
