class Enemy extends GameObject
{
  private PImage img;
  public float xPos;
  public float yPos;
  public float speed = 1;


  public Enemy(String path, int enemyWidth, int enemyHeight)
  {
    
    xPos = random(0,width-100);//width/2 - enemyWidth/2;
    yPos = 0;//enemyHeight*2 + height ;
    
    img = loadImage(path);
    img.resize(enemyWidth,enemyHeight); 
    image(img,xPos, -yPos);
    
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
  
  public void Move()
  {   
    yPos+=speed;
    image(img,xPos, yPos); 
    if(yPos>500)
    {
      Reset();
    }
    x = xPos;
    y = yPos;
  }
  public void Reset()
  {
    yPos = random(-200,-50);
    xPos = random(0,width-100);
  }
  
  public boolean col_check(Collider c, GameObject g)
  {
    if(c.check(this,g) !=null)
    {
      return true;
       
    }
    return false;
  }
}
