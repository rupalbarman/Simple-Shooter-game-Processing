//Bullet is just a bullet
class Bullet
{
  PVector location;
  PVector direction;
  PVector speed;
  float attack_power;
  
  Bullet(Minigun mini)
  {
    location=mini.location.copy();
    direction=mini.mouse.copy();
    speed= new PVector(0, 0);
    
    attack_power=25;
  }
  
  Bullet(Aggresive agg)
  {
    location=agg.location.copy();
    direction=agg.direction.copy();
    speed= new PVector(0, 0);
    
    attack_power=25;
  }
  
  void move()
  {
    direction.normalize();
    speed.add(direction);
     
    location.add(speed);
    pushMatrix();
    fill(255,255,100);
    ellipse(location.x, location.y, 10, 10);
    popMatrix();
  }
}