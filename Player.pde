class Player extends GameObject //inherit x,y,w,h from GameObject class 
{
  private PImage img;
  public float xPos;
  public float yPos;

  int score = 0 ;
  public Player(String path, int playerWidth, int playerHeight) //create player constructor 
  {
    xPos = width/2 - playerWidth/2;  //define the opening position of player, playerWidth and playerHeight are initialized in main class as 100. 
    yPos = height-playerHeight*2 ;
    
    w = playerWidth;  //width and heigth of player 
    h = playerHeight;
    
    img = loadImage(path);  //load player image from the destined folder by path parameter
    img.resize(playerWidth,playerHeight); // resize the player image size with fixed value of the parameters so that it remains constant in canvas for any size of image
    image(img,xPos, -yPos); // image function take location and display of the image   
    tag ="Player";
    
    
  }

  public void Idle()  //idle state location of the player 
  {
    image(img,xPos,yPos);
    x = xPos;
    y = yPos;
  }
  
  public void Reset()
  {
    xPos = width/2 - w/2;
    yPos = height-h*2 ;
    image(img,xPos,yPos);
  }

}
