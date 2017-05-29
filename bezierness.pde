//TODOS
//1. modo interativo;
//2.Espessura baseada em imagem;
//3."pulse"

float w;
float h;

cambelzRepeater r;

PImage photo;

void setup(){
  size(932,932,P2D);
  frameRate(24);
  photo = loadImage("face.jpg");
  w = photo.width;
  h = photo.height;
  r = new cambelzRepeater();
  smooth(8);
}

void draw(){
  background(255);
  image(photo,mouseX,mouseY);
  loadPixels();
  background(255);
  r.drawFulls();
}