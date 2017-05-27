int steps = 100;
int status = 0;
float w = 400;
float h = 400;
PVector beginA = new PVector(-50,0);
PVector ctrl1A = new PVector(0,h*0.333);
PVector ctrl2A = new PVector(-100,h*0.666);
PVector endA = new PVector(-50,h);
PVector beginB = new PVector(w+50,0);
PVector ctrl1B = new PVector(w+100,h*0.333);
PVector ctrl2B = new PVector(w-50,h*0.666);
PVector endB = new PVector(w+50,h);

void setup(){
  size(800,800);
  noFill();
  smooth(8);
  stroke(100);  
}

void draw(){
  pushMatrix();
  translate(200,200);
  background(200);
  stroke(100);
  rect(0,0,400,400);
  stroke(255,0,0);
  bezier(beginA.x,beginA.y,ctrl1A.x,ctrl1A.y,ctrl2A.x,ctrl2A.y,endA.x,endA.y);
  bezier(beginB.x,beginB.y,ctrl1B.x,ctrl1B.y,ctrl2B.x,ctrl2B.y,endB.x,endB.y);

  stroke(50,100);
  for(int i=1;i<steps;i=i+1){
    float step = map(i,0,steps,0,1);
    PVector begin_ = PVector.lerp(beginA,beginB,step);
    PVector ctrl1_ = PVector.lerp(ctrl1A,ctrl1B,step);
    PVector ctrl2_ = PVector.lerp(ctrl2A,ctrl2B,step);
    PVector end_ = PVector.lerp(endA,endB,step);
    bezier(begin_.x,begin_.y,ctrl1_.x,ctrl1_.y,ctrl2_.x,ctrl2_.y,end_.x,end_.y);
  }
  
  stroke(255,0,0);
  
  switch(status) {
  case 1: 
    beginA.set(mouseX-200,mouseY-200);
    ellipse(beginA.x,beginA.y,15,15);
    break;
  case 2: 
    ctrl1A.set(mouseX-200,mouseY-200);
    ellipse(ctrl1A.x,ctrl1A.y,15,15);
    line(beginA.x,beginA.y,ctrl1A.x,ctrl1A.y);
    break;
  case 3:
    ctrl2A.set(mouseX-200,mouseY-200);
    ellipse(ctrl2A.x,ctrl2A.y,15,15);
    line(endA.x,endA.y,ctrl2A.x,ctrl2A.y);
    break;
  case 4:
    endA.set(mouseX-200,mouseY-200);
    ellipse(endA.x,endA.y,15,15);
    break;
  case 5: 
    beginB.set(mouseX-200,mouseY-200);
    ellipse(beginB.x,beginB.y,15,15);
    break;
  case 6: 
    ctrl1B.set(mouseX-200,mouseY-200);
    ellipse(ctrl1B.x,ctrl1B.y,15,15);
    line(beginB.x,beginB.y,ctrl1B.x,ctrl1B.y);
    break;
  case 7: 
    ctrl2B.set(mouseX-200,mouseY-200);
    ellipse(ctrl2B.x,ctrl2B.y,15,15);
    line(endB.x,endB.y,ctrl2B.x,ctrl2B.y);
    break;
  case 8: 
    endB.set(mouseX-200,mouseY-200);
    ellipse(endB.x,endB.y,15,15);
    break;
  case 9:
    ellipse(beginA.x,beginA.y,15,15);
    ellipse(ctrl1A.x,ctrl1A.y,15,15);
    line(beginA.x,beginA.y,ctrl1A.x,ctrl1A.y);
    ellipse(ctrl2A.x,ctrl2A.y,15,15);
    line(endA.x,endA.y,ctrl2A.x,ctrl2A.y);
    ellipse(endA.x,endA.y,15,15);
    ellipse(beginB.x,beginB.y,15,15);
    ellipse(ctrl1B.x,ctrl1B.y,15,15);
    line(beginB.x,beginB.y,ctrl1B.x,ctrl1B.y);
    ellipse(ctrl2B.x,ctrl2B.y,15,15);
    line(endB.x,endB.y,ctrl2B.x,ctrl2B.y);
    ellipse(endB.x,endB.y,15,15);
    break;
}
  
  popMatrix();
}

void keyPressed(){
  if(key=='1'){
    status = 1;
  }else if(key=='2'){
    status = 2;
  }else if(key=='3'){
    status = 3;
  }else if(key=='4'){
    status = 4;
  }else if(key=='5'){
    status = 5;
  }else if(key=='6'){
    status = 6;
  }else if(key=='7'){
    status = 7;
  }else if(key=='8'){
    status = 8;
  }else if(key=='9'){
    status = 9;
  }else if(key=='0'){
    status = 0;
  }
  if(key==CODED){
    if(keyCode==UP){
      steps = steps + 1;
    }else if(keyCode==DOWN){
      steps = steps - 1;
    }
  }
}
