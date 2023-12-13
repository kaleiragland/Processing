Sprite player, coin, b;

PFont f;
boolean rectPressed = false;
int points = 0;

/* 2. rules of play:
1. objects are either gold coins or bombs
2. objects fall at a given rate from top of the screen
3. objects 'disappear' once they hit player
4. objects go though bottom of the screen to disappear while player cannot breach sides
*/

void setup(){  
  size(800, 600);
  
  f = createFont("Arial",16,true);
  
  //textFont(createFont("Arial",36));
  
  frameRate(20);
  player = new Sprite("c",4, 1);
  player.place(400,450);
 
  b = new Sprite("bomb.jpg", 2);
  b.place(500,0);
  b.setSpeed(0,20);
 
 coin = new Sprite("coin.jpg", 2);
 coin.place(200,0);
 coin.setSpeed(0,30);

}

void draw(){ 
  background(29);
    fill(255);
  text("Lose " ,200+280/3,40); 
  text("Win" , 200+1120/3,40);
  
  //4. SCORE BAR
    if (points >=0){
       text("Current Score (pts): " + points,600,60); 
       text("To win, you need to earn (pts): " + (500-points),550,80);}  
    else  {
       text("Current Score (pts): " + points,600,60); 
       text("You will lose the game, if you lose another (pts): " + (200+points),550,80);}   
 
  fill(255);

 
  //3. 4 keyboard inputs
  if(keyPressed){
    if(keyCode==UP){ 
    player.setSpeed(0,-8); }
   
    if(keyCode==DOWN){ 
    player.setSpeed(0,8); }
    
    if(keyCode==LEFT){ 
    player.setSpeed(-8,0); }
    
    if(keyCode==RIGHT){ 
    player.setSpeed(8,0); }     
  }

  player.display();
  coin.display();  
  b.display();

  if(player.hit(coin)){
    points = points + 100; 
    coin.place((int)random(700),0);
  }

  
  if(player.hit(b)){
    points = points - 100; 
    b.place((int)random(700),0);
  }
  
  //5. Creates a GUI interface
  
  fill(120, 0, 204);
  rect(0, 0, 180, 170);

  textFont(f,35); 
  
  fill(12, 23, 100);
  text("Menu", 50, 50);
  
  
  if (mousePressed && (mouseX>10) && (mouseX<165) && (mouseY>70) && (mouseY<120)) {
    fill(12, 200, 10);
    textFont(f,23); 
    text("Score: " + str(points),50,150);
    fill(123);  
    
  }
  else {
    fill(0);
  }
  rect(10, 70, 155, 50);
  
  textFont(f,16);
  fill(255);
  text("Click to view score",20,100);
  
   
  fill(#F50505);
  stroke(#F5F5F5);
  strokeWeight(3);
  line(200+400/3,20,200+400/3,40);
  line(200+500/3,20,200+500/3,40);
  line(200+600/3,20,200+600/3,40);
  line(200+700/3,20,200+700/3,40);
  line(200+800/3,20,200+800/3,40);
  line(200+900/3,20,200+900/3,40);
  line(200+1000/3,20,200+1000/3,40);
  line(200+1100/3,20,200+1100/3,40);
  line(200+400/3,40,200+1100/3,40);
  line(200+400/3,20,200+1100/3,20);
  if (points<0){
   
   rect(400, 20, (points)/3, 20);
   }
  else {
   fill(#F50505);
   rect(400, 20, points/3, 20);}

   // 6. win or lose conditions that presents player with victory/defeat screen
  if (points >= 500){  
    background(0);
    fill(255);
    text("YOU WIN",350,300);
    text("Total Time = " + frameCount / 20.0,350,350);
    text("Total Score = " + points, 350, 325);
    text("Hit 1 to exit game", 350, 375);
    noLoop();
    keyPressed();
 
  }
  if (points <= -200) {
    background(0);
    fill(255);
    text("YOU LOSE",350,300);
    text("Total Time = " + frameCount / 20.0,350,350);
    text("Total Score = " + points, 350, 325);
    text("Hit 1 to exit game", 350, 375);
    noLoop();
    keyPressed();
  }
//if (points == -200 && mousePressed) 
//{reset();}
}
   void keyPressed() {
  if (key == '1') {
    exit();
  }

   }
/*
void reset() {
 points = 0;
 rectPressed = false;
   player = new Sprite("c",4, 1);
  player.place(400,450);
 
  b = new Sprite("bomb.jpg", 2);
  b.place(500,0);
  b.setSpeed(0,20);
 
 coin = new Sprite("coin.jpg", 2);
 coin.place(200,0);
 coin.setSpeed(0,30);
 
  player.display();
  coin.display();  
  b.display();
}
*/
