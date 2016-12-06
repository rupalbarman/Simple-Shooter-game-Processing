/*
  keep fastest time based highscore         (NOT IN THIS VERSION)
  multiple mover balls to hit               (NOT IN THIS VERSION)
  multiple aggresive enemies                (NOT IN THIS VERSION)
  make aggresive enemy aim at minigun only  (DONE)
  make enemy bullets have effect on minigun (DONE)
  make enemy bullets hit minigun only       (DONE)
  make enemy bullet fire automatic          (DONE)
  make a health bar over objects            (DONE)
  make the minigun horizintally movable     (PENDING)
*/

Mover m;
Minigun mini;
Bullet bullet;
Bullet enemy_bullet;
Aggresive agg;

int timer;

void setup()
{
  size(640, 480);
  m= new Mover();
  mini= new Minigun();
  agg= new Aggresive();
}

void draw()
{
  background(0);
  
  m.move();
  mini.aim();
  mini.show();
  
  display_health_minigun();
  display_health_mover();
  
  agg.counter_attack(mini);
  agg.checkBounds();
  agg.move();
  agg.aim_show();
  
  if(millis()-timer>=2000) //agg fires at an interval of 2 seconds.
  {
    enemy_bullet= new Bullet(agg); 
    timer= millis();
  }
  if(enemy_bullet!=null)
  {
    enemy_bullet.move();
    minigun_gets_hit();
  }
  
  if(mousePressed)
  {
    bullet= new Bullet(mini);
  }
  
  if(bullet!=null)
  {
    bullet.move();
    mover_gets_hit();
  }
  
  if(m.health<=0)
  {
    textSize(40);
    text("YOU WIN", width/2 -100, height/2);
    return;
  }
  
  if((mini.health<=0)&&(m.health>0))
  {
    textSize(40);
    text("YOU LOSE", width/2 -100, height/2);
    stop();
    //exit(); //exits whole window
  }

  m.checkBounds();
  m.show();
}

void mousePressed()
{
  pushMatrix();
  stroke(255);
  mini.mouse.mult(5);
  translate(mini.location.x, mini.location.y);
  line(0,0, mini.mouse.x, mini.mouse.y);  
  popMatrix();
}

void minigun_gets_hit()
{
  if(dist(enemy_bullet.location.x, enemy_bullet.location.y, mini.location.x, mini.location.y)<mini.size)
    {
      pushMatrix();
      fill(255,0,0,100);
      ellipse(mini.location.x, mini.location.y, 200, 200);
      popMatrix();
      
      mini.health-=enemy_bullet.attack_power;
      enemy_bullet=null;
    }
}

void mover_gets_hit()
{
  if(dist(bullet.location.x, bullet.location.y, m.location.x, m.location.y)<m.radius)
    {
      pushMatrix();
      fill(255,0,0,100);
      ellipse(m.location.x, m.location.y, 200, 200);
      popMatrix();
      
      m.health-=bullet.attack_power;
      bullet=null;
    }
}

void display_health_minigun()
{
  pushMatrix();
  textSize(14);
  fill(255,255,0);
  text("Health", 10,20);
  noFill();
  popMatrix();
  
  pushMatrix();
  fill(0, 255, 0);
  rectMode(1); //1 means non centered
  rect(10, 30, mini.health, 40);
  popMatrix();
}

void display_health_mover()
{
  pushMatrix();
  textSize(14);
  fill(255,255,0);
  text("Mover Health", width-100,20);
  noFill();
  popMatrix();
  
  pushMatrix();
  fill(0, 255, 0);
  rectMode(1); //1 means non centered
  rect(width-30, 30, width-m.health, 40);
  popMatrix();
}