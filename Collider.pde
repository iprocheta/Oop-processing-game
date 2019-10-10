class Collider
{
  GameObject check(GameObject a, GameObject b)
  {
    if(a.x < b.x + b.w &&
        a.x + a.w > b.x &&
        a.y < b.y + b.h &&
        a.y + a.h > b.y)
        {
          return b;
        }
    return null;
  }
}
