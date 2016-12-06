//Minigun is the main user controllable object
class Minigun
{
  PVector location;
  PVector mouse;
  int health;
  int size;
  Minigun()
  {
    location= new PVector(width/2, height);
    size= 50;
    health=100;
  }
  void aim()
  {
    mouse= new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.normalize();
    mouse.mult(80);
   
    pushMatrix();
    strokeWeight(5);
    translate(location.x, location.y);
    stroke(255,255,0);
    line(0,0, mouse.x, mouse.y);
    popMatrix();
  }
  void show()
  {
    fill(255, 255, 0);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(location.x, location.y, size, size);
  }

}