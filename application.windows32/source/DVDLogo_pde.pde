
//void setup() {
//  size(640, 360);
//}

//void draw() {
//  background(127);
//  noStroke();
//  for (int i = 0; i < height; i += 20) {
//    fill(129, 206, 15);
//    rect(0, i, width, 10);
//    fill(255);
//    rect(i, 0, 10, height);
//  }
//}
int s = 3;
DVDLOGO item;

void setup() {
  size(600,600);
  surface.setResizable(true);
  item = new DVDLOGO("dvd_logo.png",s);
}

void draw() {
   background(0);
   item.update();
  
}
  void keyPressed(){
   if(key==CODED){
      if(keyCode==RIGHT){
        item.YSpeed*=1.1;
        item.XSpeed*=1.1;
      }else if(keyCode==LEFT){
        item.YSpeed*=0.9;
        item.XSpeed*=0.9;
      }
    }
  }

class DVDLOGO{
  PImage dvd;
  int w;  
  int h;
  float R, G, B;
  float XSpeed, YSpeed;
  float x, y;
  
  DVDLOGO(String img,int speed) {
     dvd=loadImage(img);
     w=dvd.width;
     h=dvd.height;
     changeColor();
     XSpeed = speed;
     YSpeed = speed;
     x = random(width-w);
     y = random(height-h);
  }
  
  void changeColor() {
    R = random(0, 255);
    G = random(0, 255);
    B = random(0, 255);
  }
  
  void update() {
    tint(R, G, B);
    image(dvd,x,y);
    move();
    detectCollision();
  }
  
  void detectCollision() {
    if (x+w >= width) {
      XSpeed*=-1;
      x = width - w;
      changeColor();
    }
    if (x <= 0) {
      XSpeed*=-1;
      x = 0;
      changeColor();
    }
    if (y+h >= height) {
      YSpeed*=-1;
      y = height -h;
      changeColor();
    }
    if (y <= 0) {
      YSpeed*=-1;
      y = 0;
      changeColor();
    }
  }
  
  void move() {
    x+=XSpeed;
    y+=YSpeed;
  }

}
