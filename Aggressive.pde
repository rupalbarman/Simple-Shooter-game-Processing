//Aggresive object aims at minigun and shoots it.
class Aggresive
{
  PVector location;
  PVector speed;
  PVector direction;
  float attack_power;
  
  Aggresive()
  {
    location= new PVector(width/2, height/2);
    speed= new PVector(2.0, 2.0);
    attack_power=10;
  }
  void counter_attack(Minigun mini)
  {
    direction= mini.location.copy();
    direction.sub(location);
    
    direction.normalize();
    direction.mult(100);
  }
  void move()
  {
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
  void aim_show()
  {
    pushMatrix();
    fill(255,0,255);
    ellipse(location.x, location.y, 50,50);
    translate(location.x, location.y);
    stroke(255);
    line(0,0, direction.x, direction.y);
    popMatrix();
  }
}