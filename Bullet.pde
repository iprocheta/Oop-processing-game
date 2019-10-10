//shooting bullet for player

import processing.sound.*;

class Bullet extends GameObject // this subclass inherit x,y,w,h,tag attributes from superclass GameObject
{
  float xPos;
  float yPos;

  Bullet(float startPosX, float startPosY) // starting position of bullet
  {
    xPos = startPosX;
    yPos = startPosY;
    
    w = 5; // h=height and w=width of bullet
    h = 5;
    tag = "Bullet";
  }
  void Display()
  {    
    strokeWeight(10);
    stroke(255);
    point(xPos,yPos);    
  }
  void Move() 
  {
    yPos-=20; // define the bullet position towards upwards
    x = xPos;
    y = yPos;
  }
  
  
}
