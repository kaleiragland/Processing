
class Star {
  float x;
  float y;
  float size;
  float speed;
  float kk = 0.0;
  float gg = 0.0;

  
Star (float speed) {
  this.speed = speed;
  x = random(1, 600);
  y = random(1, 75);
  size = random(1,8);
}
  

void display () {
  noStroke();
  fill(248, 255, 183);
  star_func(x, y, size);
}

void star_func (float x, float y, float size) {
  pushMatrix();
  if (x < 100) {
    fill(248, 255, 183);
    scale(0.8);
    ellipse(x, y, size, size);
}
  else{
    fill(248, 255, 183);
    scale(1);
    ellipse(x, y, size, size);
  }
  popMatrix();
}
void move(){

    x -= speed;
    if (x < -size) {
      x = width + size;
  }
  meteorite();
}




void meteorite (){
  pushMatrix();
  
  kk += 0.01;
  gg = cos(kk);
  
  
  translate(width/2, 150);
  scale(gg); 
  fill(255, 147, 41);
  ellipse(30, 30, 30, 30); 
  
  translate(30, 0);
  fill(255, 214, 170);
  scale(kk);
  ellipse(30, 30, 20, 20);
  
  translate(40, 40);
  fill(201, 226, 255);
  scale(kk/5);
  ellipse(15, 15, 10, 10); 
  
  
  translate(50, 0);
  fill(150, 180, 170);
  scale(gg);
  ellipse(30, 30, 10, 10);
  
  
  
  popMatrix();
}

}
