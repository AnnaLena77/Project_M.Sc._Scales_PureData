import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float positionX = 20;
float positionY = 360;

Scale cDur;
Ball ball;

void setup(){
  size(1080,720);
  oscP5 = new OscP5(this, 9001);
  myRemoteLocation = new NetAddress("192.168.178.36", 9002);
  cDur = new Scale('C', 20, 20);
  ball = new Ball(this.positionX, this.positionY);
  //OscMessage myMessage = new OscMessage("/test");
  //myMessage.add("");
  //oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent(OscMessage osgMsg){
  //println(osgMsg.get(0).floatValue());
  float value = osgMsg.get(0).floatValue();
  float singingfield = 720.0/3.0 + 720.0/3.0;
  positionY = ((singingfield/12 * (value-72))*-1)+(20*(value-60));
}

void draw(){
  background(0);
  fill(255);
  ball.drawBall(positionX, positionY);
  positionX = positionX+1.5;
  cDur.drawScale();
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
