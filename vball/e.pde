//Slime Volleyball
import fisica.*;

//pallete
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//keyboard
boolean air1, air2;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

FBox box1, box2, ground1, ground2;
FCircle circle;
//score
int rightScore, leftScore;

//assets
PImage redBird;

//fisica
FWorld world;

void setup() {

  //make window
  size(1000, 1000);



  //initialize world

  rightScore = 0;
  leftScore = 0;
  makeWorld();
  makeBox1();
  makeBox2();
  makeNet();
  makeLeft();
  makeRight();
  makeBall();
  //add terrain to world
  //makeTopPlatform();
  //makeBottomPlatform();
}



void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}


void makeTopPlatform() {
  FPoly p = new FPoly();

  //plot the vertices of this platform
  p.vertex(-100, height*.1);
  p.vertex(width*0.8, height*0.4);
  p.vertex(width*0.8, height*0.4+100);
  p.vertex(-100, height*0.1+100);

  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0.1);

  //put it in the world
  world.add(p);
}


void makeBottomPlatform() {
  FPoly p = new FPoly();

  //plot the vertices of this platform
  p.vertex(width+100, height*0.6);
  p.vertex(300, height*0.8);
  p.vertex(300, height*0.8+100);
  p.vertex(width+100, height*0.6+100);

  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0);

  //put it in the world
  world.add(p);
}


//=====================================================================================================================================

void draw() {
  background(#FFFFFF);
  println("x: " + mouseX + " y: " + mouseY);

  if (hitGround(ground1)) {
    rightScore++;
    reset1();
  }
  if (hitGround(ground2)) {
    leftScore++;
    reset2();
  }


  handlePlayerInput();
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw

  textSize(65);
  fill(0);
  text(leftScore, 240, 260);

  fill(0);
  text(rightScore, 750, 260);
}


//=====================================================================================================================================

void reset1() {
  int i = 0;
  circle.setPosition(770, 100);



  while (i<100) {
    if ( i < 50) {
      circle.setStatic(true);
    } else if (i >=20) {
      circle.setStatic(false);
    }
     i++;
  }
i = 0;
    circle.adjustVelocity(0, 0.5);
  }


  void reset2() {
    int i = 0;
    circle.setPosition(250, 100);
   // circle.setVelocity(0, 10);


 while (i<100) {
    if ( i < 50) {
      circle.setStatic(true);
    } else if (i >=20) {
      circle.setStatic(false);
    }
     i++;
  }
i = 0;
    circle.adjustVelocity(0, 0.5);
  }

//    if (i<30) {
//      circle.setStatic(true);
//    } else {
//      circle.setStatic(false);
//    }

//    i++;
//    circle.adjustVelocity(0, 0.5);
  //}



  void handlePlayerInput() {
    float left_vx = box1.getVelocityX();
    float left_vy = box1.getVelocityY();

    if (wkey) box1.setVelocity(left_vx, -600);
    if (dkey) box1.setVelocity(350, left_vy);
    if (akey) box1.setVelocity(-350, left_vy);
    if (wkey && dkey) box1.setVelocity(350, -600);
    if (wkey && akey) box1.setVelocity(-350, -600);
    float right_vx = box2.getVelocityX();
    float right_vy = box2.getVelocityY();

    if (upkey) box2.setVelocity(right_vx, -600);
    if (rightkey) box2.setVelocity(350, right_vy);
    if (leftkey) box2.setVelocity(-350, right_vy);
    if (upkey && rightkey) box2.setVelocity(350, -600);
    if (upkey && leftkey) box2.setVelocity(-350, -600);
    ground1.setGrabbable(false);
    ground2.setGrabbable(false);
  }



  void makeLeft() {
    box1 = new FBox(150, 150);
    box1.setPosition(250, 720);
    //set visuals
    box1.setStrokeWeight(0);
    box1.setFillColor(red);
    //set physical properties
    box1.setDensity(20);
    box1.setFriction(1);
    box1.setRestitution(0.25);
    world.add(box1);
  }

  void makeRight() {
    box2 = new FBox(150, 150);
    box2.setPosition(770, 720);
    //set visuals
    box2.setStrokeWeight(0);
    box2.setFillColor(green);
    //set physical properties
    box2.setDensity(20);
    box2.setFriction(1);
    box2.setRestitution(0.25);
    world.add(box2);
  }




  void makeNet() {
    FBox box = new FBox(40, 300);
    box.setPosition(500, 695);
    //set visuals
    box.setStatic(true);
    box.setStrokeWeight(0);
    box.setFillColor(#000000);
    //set physical properties
    box.setDensity(0.5);
    box.setFriction(1);
    box.setRestitution(0.25);
    world.add(box);
  }






  void makeBox1() {
    ground1 = new FBox(494, 150);
    ground1.setPosition(252.5, 920);

    //set visuals
    ground1.setStatic(true);
    ground1.setStrokeWeight(0);
    ground1.setFillColor(red);

    //set physical properties
    ground1.setDensity(8);
    ground1.setFriction(0.2);
    ground1.setRestitution(0.25);
    world.add(ground1);
  }

  void makeBox2() {
    ground2 = new FBox(495, 150);
    ground2.setPosition(747, 920);

    //set visuals
    ground2.setStatic(true);
    ground2.setStrokeWeight(0);
    ground2.setFillColor(green);

    //set physical properties
    ground2.setDensity(8);
    ground2.setFriction(0.2);
    ground2.setRestitution(0.25);
    world.add(ground2);
  }





  void makeBall() {
    circle = new FCircle(50);
    circle.setPosition(250, 500);

    //set visuals
    circle.setStroke(0);
    circle.setStrokeWeight(3);
    circle.setFillColor(#FFFFFF);

    //set physical properties
    circle.setDensity(2);
    circle.setFriction(1);
    circle.setRestitution(0.7);

    //add to world
    world.add(circle);
  }



  void makeBlob() {
    FBlob blob = new FBlob();

    //set visuals
    blob.setAsCircle(random(width), -5, 50);
    blob.setStroke(0);
    blob.setStrokeWeight(2);
    blob.setFillColor(yellow);

    //set physical properties
    blob.setDensity(0.2);
    blob.setFriction(1);
    blob.setRestitution(0.25);

    //add to the world
    world.add(blob);
  }
