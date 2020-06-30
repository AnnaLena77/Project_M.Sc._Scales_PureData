import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//int durchmesserBreite = 5;
//int durchmesserHoehe = 5;
float positionX = 50;
float positionY = 250;

float rectW = 20;
float rectH = 25;

//Variablen von C-Ton
float xPositionC = 200;
float yPositionC = 400;
float left = xPositionC - (rectW/2);
float right = xPositionC + (rectW/2) ;
float top = yPositionC - (rectH/2);
float bottom = yPositionC + (rectH/2);

void setup(){
  size(1000,500);
  oscP5 = new OscP5(this, 9001);
  myRemoteLocation = new NetAddress("192.168.178.36", 9002);
  //OscMessage myMessage = new OscMessage("/test");
  //myMessage.add("");
  //oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent(OscMessage osgMsg){
  println(osgMsg.get(0).floatValue());
  float value = osgMsg.get(0).floatValue();
  positionY = ((500.0/12 * (value-72))*-1);
  //durchmesserBreite = osgMsg.get(0).intValue();
  //durchmesserHoehe = osgMsg.get(0).intValue();
}

void draw(){
  background(0);
  //ellipse(250, 250, durchmesserBreite, durchmesserHoehe);
  fill(255);
  ellipse(positionX, positionY, 20, 20);
  positionX= positionX + 0.7f;
  
  // collision detection erstes rect
  fill(153,255,255);
  if (positionX > left && positionX < right) {
    if(positionY > top && positionY < bottom){
      fill(0,200,0);
    }
  }
  // c-ton
  rect(xPositionC, yPositionC , rectW, rectH);
  rect(xPositionC + rectW, yPositionC , rectW, rectH);
  rect(xPositionC + rectW * 2, yPositionC , rectW, rectH);
  text("C", xPositionC, yPositionC + 50);
  
  boundaries();
}
//Grenzen für Ballbewegung 
void boundaries(){
  /*
  if(positionX < 0) { // off left of window
    positionX = 0;
  }
  */
    if(positionX > width) { // off right of window
    positionX = width;
  }
    if(positionY < 0) { // off top of window
    positionY = 0;
  }
    if(positionY > height) { // off bottom of window
    positionY = height;
  }
}
