class SpaceBox {
  float x;
  float y;
  float z;
  float size;
  float speed;
  float angle;
  

SpaceBox (float size) {
  this.size = size;
  speed = 0;
  angle = 0;
  x = 40;
  y = 40;
  z = 40;
}
  

void display () {
  //noStroke();
  //fill(248, 255, 183);
  space_box(size);
  //space_ball(size);
}

void space_box (float size) {
  translate(200, 200, 200);
  //translate(mouseX, mouseY, 100);
  stroke(250);
  strokeWeight(4);
  noFill();
  rotateX(speed);
  rotateY(speed * 2);
  rotateZ(speed * 3);
  box(size);
  
  speed += 0.002;
}

void space_ball (float size) {
  //translate(50, 50, 50);
  //translate(mouseX, mouseY, 100);
  //stroke(250);
  //strokeWeight(4);
  //noFill();
  //pushMatrix();
  translate(x, y, z);
  //rotateX(angle);
  //rotateY(angle * 2);
  //rotateZ(angle * 3);
  //popMatrix();
  fill(120);
  sphere(size);
  
  //angle += 0.01;
  x += 0.7;
  y -= 1;
  z += 0.05;
  
  /*
  x ++;
  y --;
  //z ++;
  */
}
}
