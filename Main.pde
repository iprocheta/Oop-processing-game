/*
instruction: click on the submarine to start the game. click mouse cursor to shot bullet on enemy-plastic bag, otherwise plastic bag will grab the submarine and game will over. 
*/

import processing.sound.*;  
//initialize classes to main class 
Asset myasset;  
Player myplayer;
Clone myclone;
Collider mycollider;

int player_width = 100; // to be used in the myplayer
int player_height = 100;

boolean canMove = false;
boolean shoot = false;
boolean isdead = false;

Bullet[] b = new Bullet[100] ; //bullet arraw 

PFont font; 
PImage bgImage;

SoundFile shootfile; //initialize bullet shoot and background music 
SoundFile bgMusic;

void setup()  
{ 
  size(500, 500);
  myasset = new Asset();  //Asset class object
  myplayer= new Player(myasset.playerPath, player_width, player_height); // parameter value of the Player constructor, pass player image path from Asset class, playerWidth and playerHeight value assigned at the beginnig at 100.
  myclone=new Clone(); // Clone class object
  mycollider = new Collider(); // Collider  class object 

  shootfile = new SoundFile(this, myasset.shootAudioPath); //,this- referred as parent in the method, call shooting sound file from Asset class by its object 
  shootfile.amp(0.2); //amp defines volume level of the sound 

  font = createFont("lato", 25, true);
  bgImage = loadImage(myasset.bgPath); //call background image from Asset class
  bgImage.resize(1000, 800);  //resize this 
  bgMusic = new SoundFile(this, myasset.bgMusicPath); //this- referred as parent in the method, call background music file from Asset class 
  bgMusic.loop(); //continue the background music till canvas window is open 
} 
void draw()
{
  noStroke();
  fill(0);
  rect(0, 0, width, height);  //draw rectangle to hide the override image of the player moving with mouse, otherwise canvas shows each movement overrriding  

  if (!isdead) //when player is not dead do these 
  {
    noStroke();
    fill(1, 100);  
    image(bgImage, 0, 0); //display background image
    PlayerMove(canMove); // 
    Enemy e = myclone.drawEnemy(mycollider, myplayer);
    myclone.drawBullet(shoot, mouseX, mouseY);
      ScoreText();

    if (e!=null)
    {
      //e.Reset();
      canMove = false;
      isdead = true;
    }
    myclone.check_col(mycollider);
  }
  //if dead
  else
  {
    myplayer.Reset();
    myclone.Reset();
    GameOverPanel();
  }
  
}
void PlayerMove(boolean doMove)
{
  if (doMove) 
  {
    myplayer.xPos = constrain(mouseX-player_width/2, 0, width-player_width);
    //println(myplayer.xPos);
    myplayer.yPos = constrain(mouseY-player_height/2, 0, height-player_height);
    myplayer.Idle();
  } else
  {
    myplayer.Idle();
  }
}

void mousePressed()
{
  canMove = true;
  shoot = true;
  isdead = false;
}

void mouseReleased() 
{
  shoot = false;
}


void GameOverPanel()
{
  textAlign(CENTER);
  textFont(font);
  fill(255);
  text("opps!! Game Over", width/2, height/2-10);
}
void ScoreText()
{
   textAlign(CENTER);
   textFont(font,70);
   fill(255);
   text(myplayer.score, width/2, height/2-10);
} 
