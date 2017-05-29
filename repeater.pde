class cambelzRepeater{
  cambelz cb1;
  cambelz cb2;
  ArrayList<cambelz> cbList = new ArrayList<cambelz>();
  int steps = 100;
  
  cambelzRepeater(){
    PVector beginA = new PVector(-50,0);
    PVector ctrl1A = new PVector(0,h*0.333);
    PVector ctrl2A = new PVector(-100,h*0.666);
    PVector endA = new PVector(-50,h);
    PVector beginB = new PVector(w+50,0);
    PVector ctrl1B = new PVector(w+100,h*0.333);
    PVector ctrl2B = new PVector(w-50,h*0.666);
    PVector endB = new PVector(w+50,h);
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
}