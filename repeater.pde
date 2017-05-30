class cambelzRepeater{
  cambelz cb1;
  cambelz cb2;
  ArrayList<cambelz> cbList = new ArrayList<cambelz>();
  int steps = 110;
  boolean edit = false;
  int status = 0;
  
  cambelzRepeater(){
    PVector beginA = new PVector(x-50,y);
    PVector ctrl1A = new PVector(x,y+h*0.333);
    PVector ctrl2A = new PVector(x-100,y+h*0.666);
    PVector endA = new PVector(x-50,y+h);
    PVector beginB = new PVector(x+w+50,y);
    PVector ctrl1B = new PVector(x+w+100,y+h*0.333);
    PVector ctrl2B = new PVector(x+w-50,y+h*0.666);
    PVector endB = new PVector(x+w+50,y+h);
    cb1 = new cambelz(beginA.x,beginA.y,ctrl1A.x,ctrl1A.y,ctrl2A.x,ctrl2A.y,endA.x,endA.y);
    cb2 = new cambelz(beginB.x,beginB.y,ctrl1B.x,ctrl1B.y,ctrl2B.x,ctrl2B.y,endB.x,endB.y);
    for(int i=1;i<this.steps;i=i+1){
      float step = map(i,0,steps,0,1);
      PVector begin_ = PVector.lerp(this.cb1.begin,this.cb2.begin,step);
      PVector ctrl1_ = PVector.lerp(this.cb1.control1,this.cb2.control1,step);
      PVector ctrl2_ = PVector.lerp(this.cb1.control2,this.cb2.control2,step);
      PVector end_ = PVector.lerp(this.cb1.end,this.cb2.end,step);
      this.cbList.add(new cambelz(begin_.x,begin_.y,ctrl1_.x,ctrl1_.y,ctrl2_.x,ctrl2_.y,end_.x,end_.y));
    }
  }
  
  void drawSimples(){
    this.cb1.drawSimple();
    for(int i=0;i<this.steps-1;i=i+1){
      cambelz tempCb = this.cbList.get(i);
      tempCb.drawSimple();
    }
    this.cb2.drawSimple();
  }
  
  void drawFulls(){
    this.cb1.drawFull();
    for(int i=0;i<this.steps-1;i=i+1){
      cambelz tempCb = this.cbList.get(i);
      tempCb.drawFull();
    }
    this.cb2.drawFull();
  }
  
  void updatePoints(){
    for(int i=1;i<this.steps;i=i+1){
      float step = map(i,0,steps,0,1);
      PVector begin_ = PVector.lerp(this.cb1.begin,this.cb2.begin,step);
      PVector ctrl1_ = PVector.lerp(this.cb1.control1,this.cb2.control1,step);
      PVector ctrl2_ = PVector.lerp(this.cb1.control2,this.cb2.control2,step);
      PVector end_ = PVector.lerp(this.cb1.end,this.cb2.end,step);
      cambelz tempCb = this.cbList.get(i-1);
      tempCb.begin.set(begin_);
      tempCb.control1.set(ctrl1_);
      tempCb.control2.set(ctrl2_);
      tempCb.end.set(end_);
    }
  }
  
  void editMode(){
    if(this.edit){
      stroke(255,0,0);
      ellipse(this.cb1.begin.x,this.cb1.begin.y,10,10);
      ellipse(this.cb1.control1.x,this.cb1.control1.y,10,10);
      line(this.cb1.begin.x,this.cb1.begin.y,this.cb1.control1.x,this.cb1.control1.y);
      ellipse(this.cb1.control2.x,this.cb1.control2.y,10,10);
      ellipse(this.cb1.end.x,this.cb1.end.y,10,10);
      line(this.cb1.control2.x,this.cb1.control2.y,this.cb1.end.x,this.cb1.end.y);
      
      ellipse(this.cb2.begin.x,this.cb2.begin.y,10,10);
      ellipse(this.cb2.control1.x,this.cb2.control1.y,10,10);
      line(this.cb2.begin.x,this.cb2.begin.y,this.cb2.control1.x,this.cb2.control1.y);
      ellipse(this.cb2.control2.x,this.cb2.control2.y,10,10);
      ellipse(this.cb2.end.x,this.cb2.end.y,10,10);
      line(this.cb2.control2.x,this.cb2.control2.y,this.cb2.end.x,this.cb2.end.y);
      
      switch(this.status){
        case 1:
          this.cb1.begin.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb1.begin.x,this.cb1.begin.y,15,15);
          break;
        case 2:
          this.cb1.control1.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb1.control1.x,this.cb1.control1.y,15,15);
          break;
        case 3:
          this.cb1.control2.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb1.control2.x,this.cb1.control2.y,15,15);
          break;
        case 4:
          this.cb1.end.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb1.end.x,this.cb1.end.y,15,15);
          break;
        case 5:
          this.cb2.begin.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb2.begin.x,this.cb2.begin.y,15,15);
          break;
        case 6:
          this.cb2.control1.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb2.control1.x,this.cb2.control1.y,15,15);
          break;
        case 7:
          this.cb2.control2.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb2.control2.x,this.cb2.control2.y,15,15);
          break;
        case 8:
          this.cb2.end.set(mouseX,mouseY);
          this.updatePoints();
          ellipse(this.cb2.end.x,this.cb2.end.y,15,15);
          break;
        case 9:
          
          break;
      }
    }
  }
}