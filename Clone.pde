//make copy of enemy

class Clone
{
  Enemy[] myenemy = new Enemy[100] ;
  Bullet[] bullets = new Bullet[100];
  float timer=0;
  float bulletTimer = 0;
  int i=0;
  float speed = 1;
  
  Enemy drawEnemy(Collider c, GameObject g) //create more enemies
  {
    speed = speed + 0.0005;
    timer++;
    if (timer>250)
    {
      println(speed);

      if (i>=100) i = 0;
      myenemy[i] = new Enemy(myasset.enemyPath, 70, 70);
      myenemy[i].speed = speed;
      //myenemy.move();
      i++;
      timer=0;
    }
    for (int i = 0; i<100; i++)
    {
      if (myenemy[i]!=null)
      {
        myenemy[i].Move();
        if (c.check(myenemy[i], g)!=null)
        {
          return myenemy[i];
        }
        // if (myenemy[i].col_check(c,g)) return myenemy[i];
      }
    }
    return null;
  }

  void drawBullet(boolean canshoot, float x, float y)
  {
    if (canshoot)
    {
      bulletTimer++;

      if (bulletTimer>10)
      {
        if (i>=100) i = 0;
        bullets[i] = new Bullet(x, y);
        shootfile.play();
        //myenemy.move();
        i++;     
        bulletTimer=0;
      }
      for (int i = 0; i<100; i++)
      {
        if (bullets[i]!=null)
        {
          bullets[i].Display();
          bullets[i].Move();
        }
      }
    }
  }
  void check_col(Collider c)
  {
    for (int i = 0; i<100; i++)
    {
      for (int j = 0; j<100; j++)
      {
        if (bullets[i] != null && myenemy[j]!=null)
        {
          GameObject g = c.check(bullets[i], myenemy[j]);
          if (g!=null)
          {
            myenemy[j].Reset();
          }
        }
      }
    }
  }
  void Reset()
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
