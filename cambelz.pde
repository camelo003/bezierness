class cambelz{
  PVector begin,control1,control2,end;
  float minThick = 0.5;
  float maxThick = 7.5;
  int res = 128;
  
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
      float tempY_= bezierPoint(begin.y,control1.y,control2.y,end.y,map(i+1,0,this.res,0,1));
      //Mouse distance based
      //strokeWeight(constrain(map(dist(mouseX,mouseY,tempX,tempY),0,100,maxThick,minThick),minThick,maxThick));
      int c = int(tempY)*width+int(tempX);
      
      //bg brightness based
      if(c<0 || c>pixels.length){
        //strokeWeight(minThick);
        //line(tempX,tempY,tempX_,tempY_);
      }else{
        float b = brightness(pixels[c]);
        strokeWeight(map(b,255,0,minThick,maxThick));
        line(tempX,tempY,tempX_,tempY_);
      }
    }
  }
}