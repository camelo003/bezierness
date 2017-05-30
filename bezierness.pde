/*
//TODOS
//[__] 1. Modo interativo;
//[ok] 2. Espessura baseada em imagem;
//[__] 3. Animar!
//[__] 4. "Pulse", geral e individual;
//[__] 5. Importar imagem 'on the fly';
//[__] 6. Exportar 'image only';
//[__] 7. GUI.
*/
float w;
float h;
float x;
float y;

cambelzRepeater r;

PImage photo;

void setup(){
  size(800,600,P2D);
  frameRate(24);
  photo = loadImage("face.jpg");
  w = photo.width;
  h = photo.height;
  x = width/2 - w/2;
  y = height/2 - h/2;
  r = new cambelzRepeater();
  noFill();
  smooth(8);
}

void draw(){
  background(255);
  image(photo,x,y);
  loadPixels();
  background(255);
  r.drawFulls();
  r.editMode();
}

void keyPressed(){
  if(key == 'p'){
    save("export.png");
    println("Saved!");
  }
  if(key == '`'){
    r.edit = !r.edit;
    r.status = 0;
  }
  if("0123456789".indexOf(key)!=-1){
    r.status = "0123456789".indexOf(key);
  }
}