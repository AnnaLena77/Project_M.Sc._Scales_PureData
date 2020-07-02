import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float positionX = 20;
float positionY = 360;

Scale cDur;
Ball ball;
Button cDurButton;
Button dDurButton;
Button eDurButton;
Button fDurButton;
Button gDurButton;
Button aDurButton;
Button hDurButton;
Button cDurButton2;
Difficulties diffBut;
boolean startBall= false;

void setup(){
  size(1080,720);
  oscP5 = new OscP5(this, 9001);
  myRemoteLocation = new NetAddress("192.168.178.36", 9002);
  cDur = new Scale('C', 20, 20);
  ball = new Ball(this.positionX, this.positionY);
  
  //scale buttons
  cDurButton = new Button(75, 50, 80, 50, "C-Dur", 0, 0, 200, 255);
  dDurButton = new Button(195, 50, 80, 50, "D-Dur", 0, 0, 200, 255);  
  eDurButton = new Button(315, 50, 80, 50, "E-Dur", 0, 0, 200, 255);  
  fDurButton = new Button(435, 50, 80, 50, "F-Dur", 0, 0, 200, 255);
  gDurButton = new Button(555, 50, 80, 50, "G-Dur", 0, 0, 200, 255);
  aDurButton = new Button(675, 50, 80, 50, "A-Dur", 0, 0, 200, 255);
  hDurButton = new Button(795, 50, 80, 50, "H-Dur", 0, 0, 200, 255);
  cDurButton2 = new Button(915, 50, 80, 50, "C-Dur(2)", 0, 0, 200, 255);
  
  diffBut = new Difficulties(600, 50, 70, 50, "difficulty", 0, 200, 200);
  //OscMessage myMessage = new OscMessage("/test");
  //myMessage.add("");
  //oscP5.send(myMessage, myRemoteLocation);
}

void oscEvent(OscMessage osgMsg){
  try{
    float value = osgMsg.get(0).floatValue();
    float singingfield = 720.0/3.0 + 720.0/3.0;
    positionY = ((singingfield/12 * (value-72))*-1)+(20*(value-60));
  }catch (Exception e){
    String msg = osgMsg.toString();
    System.out.println(msg);
    if(msg.contains("/end")){
      startBall=true;
    }
  }
}

void draw(){
  background(0);
  //cDur.drawScale();
  if(cDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    cDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    cDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  cDurButton.update();
  cDurButton.render();
  
  //D-Dur
  //cDur.drawScale();
  if(dDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //dDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //dDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  dDurButton.update();
  dDurButton.render();
  
  //E-Dur
  if(eDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //eDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //eDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  eDurButton.update();
  eDurButton.render();
  
  //F-Dur
  if(fDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //fDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //fDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  fDurButton.update();
  fDurButton.render();
  
  //G-Dur
  if(gDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //gDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //gDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  gDurButton.update();
  gDurButton.render();
  
  //A-Dur
  if(aDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //aDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //aDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  aDurButton.update();
  aDurButton.render();  
  
  //H-Dur
  if(hDurButton.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //hDur.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //hDur.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  hDurButton.update();
  hDurButton.render();
  
  //C-Dur(2)
  if(cDurButton2.isClicked())
  {
    OscMessage myMessage = new OscMessage("/cDur");
    myMessage.add("");
    oscP5.send(myMessage, myRemoteLocation);
    positionX = 0;
    //cDur2.cleanScale();
  }
  if(startBall){
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.5;
    //cDur2.drawScale();
  }
  if(ball.positionX==width){
    startBall = false;
    ball.positionX=0;
  }
  cDurButton2.update();
  cDurButton2.render();  
  
  diffBut.drawDifficulties();
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
