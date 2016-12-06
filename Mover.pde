// Stuff you need to shoot down
class Mover
{
  PVector location;
  PVector speed;
  PVector acceleration;
  float radius;
  float maxspeed;
  int health;
  
  Mover()
  {
    location= new PVector(random(width), random(height));
    speed= new PVector(4.5, 4.5);
    acceleration= new PVector(0, 0);
    maxspeed=10;
    radius=50;
    health=100;
  }
  void move()
  {
    speed.add(acceleration);
    speed.limit(maxspeed);
    location.add(speed);
  }
  void checkBounds()
  {
    if(location.x>width || location.x<0)
    {
      speed.x*=-1;
    }
    if(location.y>height || location.y<0)
    {
      speed.y*=-1;
    }
  }
  void show()
  {
    pushMatrix();
    noStroke();
    fill(255,0,0);
    strokeWeight(2);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
}