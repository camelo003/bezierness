float x1 = 0;
float y1 = height;
float x2 = width;
float y2 = height*0.666;
float x3 = 0;
float y3 = height*0.333;
float x4 = width;
float y4 = 0;

int steps = 50; //times 2

size(800,600);
noFill();
noSmooth();
background(50);
stroke(200);
bezier(x1,y1,x2,y2,x3,y3,x4,y4);
for(int i=0;i<steps;i=i+1){
  float _x1 = lerp(0,x1,map(i,0,steps,0,1));
  float _y1 = lerp(0,y1,map(i,0,steps,0,1));
  float _x2 = lerp(0,x2,map(i,0,steps,0,1));
  float _y2 = lerp(0,y2,map(i,0,steps,0,1));
  float _x3 = lerp(0,x3,map(i,0,steps,0,1));
  float _y3 = lerp(0,y3,map(i,0,steps,0,1));
  float _x4 = lerp(0,x4,map(i,0,steps,0,1));
  float _y4 = lerp(0,y4,map(i,0,steps,0,1));
  bezier(_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4);
}
for(int i=1;i<steps;i=i+1){
  float _x1 = lerp(x1,width,map(i,0,steps,0,1));
  float _y1 = lerp(y1,height,map(i,0,steps,0,1));
  float _x2 = lerp(x2,width,map(i,0,steps,0,1));
  float _y2 = lerp(y2,height,map(i,0,steps,0,1));
  float _x3 = lerp(x3,width,map(i,0,steps,0,1));
  float _y3 = lerp(y3,height,map(i,0,steps,0,1));
  float _x4 = lerp(x4,width,map(i,0,steps,0,1));
  float _y4 = lerp(y4,height,map(i,0,steps,0,1));
  bezier(_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4);
}