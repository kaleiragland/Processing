class Moon {
  float radius;
  float distance;
  Moon[] planets;
  float angle;
  float orbitspeed;
  PVector v;
  
  PShape globe;
  
  Moon(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    noStroke();
    fill(255);
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
    //angle = angle + 2 *orbitspeed;
    angle = angle + orbitspeed - 0.001;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    } 
  }
  void createPlanets(int total, int level) {
    planets = new Moon[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*1.5);
      float d = random((radius + 1), (radius + r) * 2);
      float o = random(-0.1, 0.01);
      int index = int(random(0,textures.length));
     // planets[i] = new Planet2(r, d, o, textures[0]);
      planets[i] = new Moon(r, d, o, textures[index]);
      if (level < 2) {
        int num = int(random(0,4));
        planets[i].createPlanets(num, level + 1);
      }
    }
  }
  void show() {
    pushMatrix();
     fill(255);
    noStroke();
    PVector v2 = new PVector(4,0,1);
    PVector p = v.cross(v2);
    rotate(angle, p.x - 50, p.y - 50, p.z - 50);
    stroke(255);

    //translate(v.x * -1.5, v.y, v.z);

     pushMatrix();
     translate(50, -200, 150);
    noStroke();
    shape(globe);
    //sphere(radius);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
   popMatrix();
    popMatrix();
  }
}
