float x1,y1,x2,y2,x3,y3,x4,y4;
int s = 15;
int res = 512;

cambelz cb1;

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
  
  cb1 = new cambelz(x1,y1,x2,y2,x3,y3,x4,y4);
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

  cb1.drawFull();
}

class cambelz{
  PVector begin,control1,control2,end;
  float minThick = 0.1;
  float maxThick = 10;
  int res = 512;
  
  cambelz(PVector begin_,PVector control1_,PVector control2_,PVector end_){
    begin = begin_;
    control1 = control1_;
    control2 = control2_;
    end = end_;
  }
  
  cambelz(float beginX,float beginY,float control1X,float control1Y,
          float control2X,float control2Y,float endX,float endY){
    begin = new PVector(beginX,beginY);
    control1 = new PVector(control1X,control1Y);
    control2 = new PVector(control2X,control2Y);
    end = new PVector(endX,endY);
  }
  
  void drawSimple(){
    stroke(100,100);
    strokeWeight(1);
    bezier(begin.x,begin.y,control1.x,control1.y,control2.x,control2.y,end.x,end.y); 
  }
  
  void drawFull(){
    stroke(0);
    for(int i=0;i<this.res;i=i+1){
      float tempX= bezierPoint(begin.x,control1.x,control2.x,end.x,map(i,0,this.res,0,1));
      float tempY= bezierPoint(begin.y,control1.y,control2.y,end.y,map(i,0,this.res,0,1));
      float tempX_= bezierPoint(begin.x,control1.x,control2.x,end.x,map(i+1,0,this.res,0,1));
      float tempY_= bezierPoint(begin.y,control1.y,control2.y,end.y,map(i+1,0,this.res,0,1));;
      strokeWeight(constrain(map(dist(mouseX,mouseY,tempX,tempY),0,100,maxThick,minThick),minThick,maxThick));
      line(tempX,tempY,tempX_,tempY_);
    }
  }
}
