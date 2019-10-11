class Enemy extends GameObject
{
  private PImage img;
  public float xPos;
  public float yPos;
  public float speed = 1;


  public Enemy(String path, int enemyWidth, int enemyHeight)
  {
    
    xPos = random(0,width-100); //come randomly through 0 to 600 location through x axis 
    yPos = 0; //start coming from 0 location of y axis 
    
    img = loadImage(path); // load enemy image
    img.resize(enemyWidth,enemyHeight); //resize to eneymyWidth and enemyHeight value. This is assigned in close class. 
    image(img,xPos, -yPos); //define the image to display which is retrievd from oadImage(path) and default position of it. 
    
    x= xPos;
    y = yPos;
    w = enemyWidth;
    h = enemyHeight;
    tag = "Enemy";
  }

  public void Idle()
  {
    image(img,xPos,yPos);
  } 
  
  public void Move() //define how enemy moves on the canvas
  {   
    yPos+=speed; //enemy moves forward to the y axis with the speed value
    image(img,xPos, yPos); 
    if(yPos>height) //if y position of enemy goes beyond the canvas height then reset
    {
      Reset();
    }
    x = xPos;
    y = yPos;
  }
  public void Reset() //reset enemy loaction randomly for coming again 
  {
    yPos = random(-200,-50); 
    xPos = random(0,width-100);
  }
  
  public boolean col_check(Collider c, GameObject g) //collision occur when enemy and the player touch
  {
    if(c.check(this,g) !=null) // enemy and player touch is not null, they touch, then collision is true otherwise false. 
    {
      return true;
       
    }
    return false;
  }
}
