float x1,y1,x2,y2,x3,y3,x4,y4;
int s = 15;
int res = 512;


void setup(){
  size(800,600,P3D);
  x1 = 0;
  y1 = height;
  x2 = width*0.333;
  y2 = height*0.666;
  x3 = width*0.666;
  y3 = height*0.333;
  x4 = width;
  y4 = 0;
  
  smooth(8);
}

void draw(){
  background(255);
  
  stroke(150);
  strokeWeight(5);
  bezier(x1,y1,x2,y2,x3,y3,x4,y4);
  
  x2 = x2+mouseX;
  //y2 = y2+random(-1,1)*10;
  x3 = x3-mouseX;
  //y3 = y3+random(-1,1)*10;
  
  float t = sin(radians(frameCount))/2 + 0.5;
  float x = bezierPoint(x1,x2,x3,x4,t);
  float y = bezierPoint(y1,y2,y3,y4,t);
  //stroke(150);
  strokeWeight(1);
  ellipse(x,y,10,10);
  
  stroke(50);
  for(int i=0;i<res;i=i+1){
    float tempX= bezierPoint(x1,x2,x3,x4,map(i,0,res,0,1));
    float tempY= bezierPoint(y1,y2,y3,y4,map(i,0,res,0,1));
    float tempX_= bezierPoint(x1,x2,x3,x4,map(i+1,0,res,0,1));
    float tempY_= bezierPoint(y1,y2,y3,y4,map(i+1,0,res,0,1));
    line(tempX,tempY,tempX_,tempY_);
    float d = dist(x,y,tempX,tempY);
    strokeWeight(constrain(map(d,0,100,10,0.1),0.1,10));
  }
  
  x2 = width*0.333;
  //y2 = y2+random(-1,1)*10;
  x3 = width*0.666;
  //y3 = y3+random(-1,1)*10;

}
/*
class cambelz{
  PVector begin,control1,control2,end;
  cambelz(PVector begin_,PVector control1_,PVector control2_,PVector end_){
    begin = begin_;
    control1 = control1_;
    control2 = control2_;
    end = end_;
  }
}
*/