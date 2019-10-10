/*
Description: The concept of the game is to show plastic pullution in the sea. Plastic bags are throwing under the sea. If sunmarine can't destroy the plastics, it will destroy the under sea submarine. 
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

boolean canMove = false; //Initial state player is not moving
boolean shoot = false;  //not shooting bullet
boolean isdead = false; //and alive

Bullet[] b = new Bullet[100] ; //bullet array

PFont font; 
PImage bgImage;

SoundFile shootfile; //initialize bullet shoot and background music 
SoundFile bgMusic;

void setup()  
{ 
  size(700, 700);
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
    PlayerMove(canMove); // at the idle nitial state canMove=false assigned, as plyer is not moving untill move it with mouse 
   Enemy myenemy = myclone.drawEnemy(mycollider, myplayer); //
    myclone.drawBullet(shoot, mouseX, mouseY); //create more copy of bullets with the mouse click and shoot 
     

    if (myenemy!=null) //if there is enemy 
    {
      //e.Reset();
      canMove = false; //player cant move
      isdead = true;  //and die 
    }
    myclone.check_col(mycollider); //check the collision with enemy 
  }
  else //if player is dead
  {
    myplayer.Reset();  // reset the game
    myclone.Reset();
    GameOverPanel();
  }
  ScoreText();  //display updated score when palyer shoot an enemy
  
}
void PlayerMove(boolean doMove) //define how player is moved by the mouse
{
  if (doMove) 
  {
    /*used constrain to control player position with mouse on canvas, position cursour location is the center of the player by default, 
    it can move from the (0,0) location to (600,600) location of the canvas. If the max value is less that player size them some of the portion of the player will go out of the canvas. 
    (e.g. if max=(660,660) then player will go out of canvas from (40,40) of its actual size 700-660=40, (40,40)*/
    
    myplayer.xPos = constrain(mouseX-player_width/2, 0, width-player_width); //(contrain value=50,min=0,max=600)

    myplayer.yPos = constrain(mouseY-player_height/2, 0, height-player_height); //
    myplayer.Idle();
  } 
  else
  {
    myplayer.Idle();
  }
}

void mousePressed() //player can move and shoot only if mouse is clicked and alive
{
  canMove = true;
  shoot = true;
  isdead = false;
}

void mouseReleased() 
{
  shoot = false; //player cant shoot bullet when mouse is not clicked. 
}

void ScoreText()  // dislay score as text at this position
{
   textAlign(CENTER);
   textFont(font,70);
   fill(255);
   text(myplayer.score, width/2, height/2); //call score from which is initialized in Player class
} 
void Score(int i)
{
  myplayer.score += i; //update score
}

void GameOverPanel()  //display the ending text when game is over
{
  textAlign(CENTER);
  textFont(font);
  fill(255);
  text("opps!! Game Over", width/2, height/2-80);
}
