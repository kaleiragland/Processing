import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
//import peasy.test.*;

Planet[] planets = new Planet[4];
float distance = 30;

float sb_size = 70;
SpaceBox sb = new SpaceBox(sb_size);


Moon moon;
PImage moonTexture;
PImage[] textures = new PImage[7];

PeasyCam cam;
float between;

void setup() {
  size(800,800, P3D);
   moonTexture = loadImage("11.jpg");
  textures[0] = loadImage("22.jpg");
  textures[1] = loadImage("33.jpg");
  textures[2] = loadImage("44.jpg");
  textures[3] = loadImage("66.jpg");
  textures[4] = loadImage("77.jpg");
   cam = new PeasyCam(this, 700);
  moon = new Moon(50, 50, 0.009, moonTexture);
  moon.createPlanets(4, 1);
  
  for (int i = 0; i < planets.length; i++) {
    between = 60;
    distance += between;
    
    color c = color(random(0,255), random(0,255), random(0, 255));
    planets[i] = new Planet(random(0.01, 0.05), distance, between, 2, c);
    
  }
}

void draw() {
  background(0);
  lights();
  pointLight(255, 255, 255, 0, 0, 0);

  noStroke();
  fill(255,193, 36);
  sphere(30);
  
  //rotateX(-mouseY*PI/(2*height));
  
  for (int i = 0; i < planets.length; i ++) {
   planets[i].display();
  }
  pushMatrix();
  sb.display();
  sb.space_box(150);
  sb.space_ball(200);
  popMatrix();
  
  pointLight(255, 255, 255, 400, 200, 600);
  moon.show();
  moon.orbit();

}
