color lblue  = #8ecae6;
color blue   = #219ebc;
color dblue  = #023047;
color yellow = #ffb703;
color orange = #fb8500;
color red    = #d00000;
color white  = #ffffff;

//keyboard 
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

float a;


void draw() {
  size(800, 600);
  createWorld();
  createBodies();
}

void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}


void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void mousePressed() {
  setup();
}

void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (wkey) leftPlayer.setVelocity(left_vx, -100); // -100 is number of jump height
  
}
