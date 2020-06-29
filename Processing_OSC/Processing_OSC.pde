import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
  oscP5 = new OscP5(this, 9001);
  myRemoteLocation = new NetAddress("127.0.0.1", 9001);
  OscMessage myMessage = new OscMessage("/");
  myMessage.add("hallo");
  oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent(OscMessage osgMsg){
  println(osgMsg.get(0).intValue());
}
