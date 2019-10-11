//make copies of enemy and bullet 

class Clone
{
  Enemy[] myenemy = new Enemy[100] ;  //arrays of enemy and bullet
  Bullet[] bullets = new Bullet[100];
  float timer=0; //timer=delay time of drawing another enemy
  float bulletTimer = 0; //bulletTimer=delay time of drawing another bullet
  int i=0;
  float speed = 1;

  Enemy drawEnemy(Collider c, GameObject g) //create more enemies
  {
    speed = speed + 0.0005; //control speed of enemy
    timer++; // continue the timer for ecah upcoming enemy copy
    if (timer>100) //create a copy of enemy after ecah 100sec
    {
      if (i>=100) i = 0;
      myenemy[i] = new Enemy(myasset.enemyPath, 70, 70); //call the enemy image from Asset class and define image size 
      myenemy[i].speed = speed; //assign speed to the copies
      i++;
      timer=0;
    }
    for (int i = 0; i<100; i++)
    {
      if (myenemy[i]!=null)
      {
        myenemy[i].Move();
        if (c.check(myenemy[i], g)!=null) //check collison between object and any one the enemy from the arraylist 
        {
          return myenemy[i];
        }
      }
    }
    return null;
  }

  void drawBullet(boolean canshoot, float x, float y) //create more bullets
  {
    if (canshoot) // if its true 
    {
      bulletTimer++; //in what time copy of another bullet will be drawn

      if (bulletTimer>10) //control the delay time of drawing another bullet, create copies after each 10sec
      {
        if (i>=100) 
          i = 0;
        bullets[i] = new Bullet(x, y); //call bullet position from Bullet class constructor 
        shootfile.play(); //play shoot audio with each bullet 
        //myenemy.move();
        i++;     
        bulletTimer=0;
      }
      for (int i = 0; i<100; i++)
      {
        if (bullets[i]!=null) //display and move bullet when there is bullet in the array 
        {
          bullets[i].Display(); 
          bullets[i].Move();
        }
      }
    }
  }
  void check_col(Collider c) //check collsion by using Collider class formula 
  {
    for (int i = 0; i<100; i++) //continue the loop 100 times as defined at the begining bullet and enemy array 100
    {
      for (int j = 0; j<100; j++)
      {
        if (bullets[i] != null && myenemy[j]!=null) // bullet and enemy both exist in the canvas
        {
          GameObject g = c.check(bullets[i], myenemy[j]); //check collision between bullet and enemy 
          if (g!=null) // if collision occurs 
          {
            myenemy[j].Reset(); //remove the enemy from screen
            Score(1); //add one 1 score for each collision between bullet and enemy
          }
        }
      }
    }
  }
  void Reset() //make bullet and enemy disppear from canvas 
  {
    for (int i = 0; i<100; i++)
    {
      if (myenemy[i]!=null)
      {
        myenemy[i] = null;
      }
      if (bullets[i]!=null)
      {
        bullets[i]=null;
      }
      //myenemy[i] = null;
      speed = 1;
    }
  }
}
