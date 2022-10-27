Planet [] moons;
class Planet{
  float v;
  float velocity;
  float dist, dist2;
  float w;
  float flipcoin;
  color c;
  int direction;
  int moonNum;
  
  Planet(float velocity, float dist, float w, int moonNum, color c) {
    flipcoin = random(0,1);
    v = 0; 
    this.velocity = velocity;
    this.dist = dist;
    this.w = w/4;
    this.c = c;
    if (flipcoin >= 0.5) {
      direction = -1;
    }
    else{
      direction = 1;
    }
    this.moonNum = moonNum;
      if (moonNum >0) {
      moons = new Planet[moonNum];
      for (int i = 0; i < moons.length; i++) {
        float between = 20;
        dist2 += between;
        color gray = color(100,100,100);
        moons[i] = new Planet(random(0.015,0.02), dist2, between, 0, gray); } }

  }
  void display() {
    drawnPath();
    drawnPlanets();
    drawnMoons();
    
    popMatrix();
    popMatrix();
    v += velocity;
  }

  void drawnPath() {
    pushMatrix();
    rotateX(PI/2);
    stroke(c);
   strokeWeight(1);
   noFill();
   ellipse(0,0,2*dist, 2*dist);
    popMatrix();
  }
  
  void drawnPlanets() {
    noStroke();
    pushMatrix();
    rotateY(v * direction);
    pushMatrix();
    translate(dist,0,0);
    fill(c);
    sphere(w*4/5.0);
    fill(155,50);
  }
  void drawnMoons() {
        if(moonNum > 0) {
      sphere(w + (2*sin(radians(v*1000))));
      for(int i = 0; i < moons.length; i++) {
        moons[i].display();
      }
    }
        
      }
    }
 
