import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//int durchmesserBreite = 5;
//int durchmesserHoehe = 5;
int positionX = 250;
float positionY = 250;

void setup(){
  size(500,500);
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
  ellipse(positionX, positionY, 10, 10);
}
