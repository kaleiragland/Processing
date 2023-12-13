class Sprite {
  PImage[] images;
  int imageCount;
  int frame = 0;
  int x = 0;
  int y = 0;
  int xspeed = 0;
  int yspeed = 0;
  int sides = 0;  
  int slowdown = 0;
  int slowcount = 0;
  boolean freeze = false;
  boolean hiding = false;
  int xmin = 0;
  int xmax = width;
  int ymin = 0;
  int ymax = height;
  
  boolean continuous = false;
   
  Sprite(String name, String extension, int count) 
  {
     createSprite( name, extension, count);
  }
  
  void createSprite(String imagePrefix, String extension, int count)
  {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + "." + extension ;
      images[i] = loadImage(filename);
    }
  }
  
  Sprite(String name, int count, int sides)
  {
     createSprite(name,"jpg",count);
     this.sides = sides;
  }
  
  Sprite(String name, int sides)
  {
     imageCount = 1;
     images = new PImage[1];
     images[0] = loadImage(name);
     this.sides = sides;
  }

  void display() {
    if (hiding){ 
    return; }
    boolean done = false;
    if (!freeze) { 
      if (slowcount < slowdown){ 
          slowcount++; }
      else {
        frame = (frameCount +1) % imageCount; 
        slowcount = 0;
      }
    }
    
    image(images[frame], x, y);
    int tx = x+xspeed; 
    int ty = y+yspeed; 
    if (sides==1) { 
       if (ty+getHeight()>=ymax ||
          tx+getWidth()>=xmax ||
          tx<xmin || ty < ymin) { 
          return; 
        }
    }
    else if (sides == 2){  
      if (tx>=xmax){ 
       x = xmin;  done = true; 
     }
       if (ty>=ymax){ 
       y = ymin;  done = true; 
     }
       if (tx+getWidth()<xmin){ 
       x = xmax-1; done = true; 
     }
       if (ty + getHeight()<ymin) { 
       y = ymax-1; done = true; 
     } 
       if (done){ 
       return; 
     }
    }
    
    x = x+xspeed;
    y = y+yspeed;   
    
    if (!continuous){ 
    xspeed = 0; 
    yspeed = 0; 
}
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeight() {
    return images[0].height;
  }
  
  void setSpeed(int xs,int ys) {
    xspeed = xs; yspeed = ys;
    continuous = true; 
  }
   
  void move(int xd, int yd){
    x = x+xd; y = y+yd; 
  }
  
  void place(int xg, int yg){
    x = xg; y = yg;
  }
  boolean hit(Sprite bomb){     
     if (this.hiding || bomb.hiding){  
     return false; 
   }
     if (bomb.x>this.x-bomb.getWidth() &&
        bomb.x<this.x+this.getWidth() &&
        bomb.y>this.y-bomb.getHeight() &&
        bomb.y<this.y+this.getHeight()){ 
        return true; 
      } 
     else { 
     return false; 
   }
  }    

  
  
}
