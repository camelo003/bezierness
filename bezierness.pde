float w = 400;
float h = 300;
float x1,y1,x2,y2,x3,y3,x4,y4;
int s = 15;
int res = 512;

cambelzRepeater r = new cambelzRepeater();

void setup(){
  size(800,600,P3D);
  smooth(8);
}

void draw(){
  background(255);
  pushMatrix();
  translate(200,150);
  r.drawFulls();
  popMatrix();
}