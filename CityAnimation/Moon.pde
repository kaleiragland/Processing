float speed = 0;

class Moon{
  float x, y, a, b;
  PVector d;
    color c;
    
  
  Moon(float x, float y, float a, float b, color c){
    this.x = x;
    this.y = y;
    this.a = a;
    this.b = b;
    this.d = new PVector(2, 0);
    this.c = c;
  
}
void display(){
  scale(0.8);
  fill(c);
  noStroke();
  
 
  ellipse(x,y,a,b);
 
  translate(x,y + 20);
  pushMatrix();
  rotate(speed);
  translate(80, 0);
  fill(#F9FADC);
  ellipse(0, 0, 32, 32);
  pushMatrix(); 
  rotate(-speed*4);
  translate(50, 0);
  fill(#E8C8B0);
  ellipse(0, 0, 16, 16);
  popMatrix();


  pushMatrix();
  rotate(speed*2);
  translate(24, 0);
  fill(#E8C8B0);
  ellipse(0, 0, 6, 6);
  popMatrix();

  popMatrix();

  speed += 0.009;
  //
  //speed = 20;
}

void move(){
  if (x + d.x < 600){
    x = x + d.x;
    y = y + d.y;}
  else {
    x=0;
    y=80;
  }
}}
