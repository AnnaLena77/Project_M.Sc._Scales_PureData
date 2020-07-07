import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//Schwierigkeitsgrad (Standard: 20 = Medium)
int difficulty=20;
//Anzeige der erreichten Punkte des Nutzers
int result;
//Anzeigen des aktuellen Schwierigkeitsgrads
String diffIndex = "medium";

/*Position des Balls, Hilfsvariable "ballPositionY", um die Werte der empfangenen Töne
  so anzupassen, dass alle Tonleitern im gleichen Bereich des Bildschirms gesungen werden
  können*/
float positionX = 20;
float positionY = 360;
float ballPositionY=0;

//Tonleitern
Scale cDur, dDur, eDur, fDur, gDur, aDur, hDur, cDur2, pressedButton;

//Ball, der die gesungene Tonhöhe anzeigt
Ball ball;

//Initialisierung der Buttons
Button cDurButton, dDurButton, eDurButton, fDurButton, gDurButton, aDurButton, hDurButton, cDurButton2, okButton;
Difficulties diffBut;

//Booleans, zum ermitteln der aktuellen "Phase" (Listening, Singing)
boolean startBall= false;
boolean listeningPhase = false;

void setup(){
  size(1080,720);
  
  //oscP5 = "Listener" auf Port 9001, wartet auf eingehende Messages
  oscP5 = new OscP5(this, 9001);
  //RemoteLocation = "Sender" auf Port 9002
  // unter Windows IP: 127.0.0.1 nutzen
  // unter MacOS IP: 192.168.178.36
  myRemoteLocation = new NetAddress("192.168.178.36", 9002);

  ball = new Ball(this.positionX, this.positionY);
  
  cDur = new Scale("C", difficulty, 20);
  dDur = new Scale("D", difficulty, 20);
  eDur = new Scale("E", difficulty, 20);
  fDur = new Scale("F", difficulty, 20);
  gDur = new Scale("G", difficulty, 20);
  aDur = new Scale("A", difficulty, 20);
  hDur = new Scale("H", difficulty, 20);
  cDur2 = new Scale("C", difficulty, 20);
  
  //Buttons (Tonleitern) im oberen Bereich des Bildschirms
  cDurButton = new Button(75, 50, 80, 50, "C-Dur(2)", 0, 0, 200, 255);
  dDurButton = new Button(195, 50, 80, 50, "D-Dur", 0, 0, 200, 255);  
  eDurButton = new Button(315, 50, 80, 50, "E-Dur", 0, 0, 200, 255);  
  fDurButton = new Button(435, 50, 80, 50, "F-Dur", 0, 0, 200, 255);
  gDurButton = new Button(555, 50, 80, 50, "G-Dur", 0, 0, 200, 255);
  aDurButton = new Button(675, 50, 80, 50, "A-Dur", 0, 0, 200, 255);
  hDurButton = new Button(795, 50, 80, 50, "H-Dur", 0, 0, 200, 255);
  cDurButton2 = new Button(915, 50, 80, 50, "C-Dur(3)", 0, 0, 200, 255);
  
  //Reihe von Buttons zur Auswahl der Schwierigkeitsgrade
  diffBut = new Difficulties(600, 50, 70, 50, "difficulty", 0, 200, 200);
  
  //Button zum Bestätigen des Results
  okButton = new Button(width/2 - 40, height/2, 80, 50, "OK", 200, 200, 200, 0);
}

//Methode wird dann aufgerufen, wenn eine Message empfangen wurde
/*
  Bildschirm wurde auf die Werte des 2. C-Dur angepasst. Alle anderen Werte der Tonleitern müssen
  deshalb diesen Werten angepasst werden, sodass sich der Ball auf passender Höhe mit den statisch 
  gesetzten Rechtecken befindet.
  Daher wird die für jede Tonleiter individuell berechnete ballPositionY, jeweils auf den D-Dur-
  Wert aufaddiert.
*/
void oscEvent(OscMessage osgMsg){
  try{
    //Empfängt das mitgesendete Value der Message
    float value = osgMsg.get(0).floatValue()+ballPositionY;
    println(value);
    float singingfield = 720.0/3.0 + 720.0/3.0;
    positionY = ((singingfield/12 * (value-72))*-1)+(20*(value-60)); //Berechnung des mittleren Teils des Bildschirms anhand der 2. C-Dur-Werte
    
  //Wird in der eingehenden Message kein Value-Wert mitgeschickt, kommt es zu einer Exception
  }catch (Exception e){
    //String mit dem Pfad, der versendet wurde
    String msg = osgMsg.toString();
    //Wenn "/end"-Pfad empfangen wird, ist Tonleiter fertig gespielt, die Listening-Phase ist zu ende und die Singing-Phase startet
    if(msg.contains("/end")){
      listeningPhase = false;
      startBall = true;
    }
  }
}

void draw(){
  background(0);
 
  //cDur(1)
  if(cDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("cDur");
    cleaner(cDur);
    pressedButton = cDur;
    ballPosition(48);
  }
  cDurButton.update();
  cDurButton.render();
  
  //D-Dur
  if(dDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("dDur");
    cleaner(dDur);
    pressedButton = dDur;
    ballPosition(50);
  }
  dDurButton.update();
  dDurButton.render();
  
 //E-Dur
 if(eDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("eDur");
    cleaner(eDur);
    pressedButton = eDur;
    ballPosition(52);
  }
  eDurButton.update();
  eDurButton.render();
  
  //F-Dur
  if(fDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("fDur");
    cleaner(fDur);
    pressedButton = fDur;
    ballPosition(53);
  }
  fDurButton.update();
  fDurButton.render();
  
  //G-Dur
  if(gDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("gDur");
    cleaner(gDur);
    pressedButton = gDur;
    ballPosition(55);
  }
  gDurButton.update();
  gDurButton.render();
  
  //A-Dur
  if(aDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("aDur");
    cleaner(aDur);
    pressedButton = aDur;
    ballPosition(57);
  }
  aDurButton.update();
  aDurButton.render();  
  
  //H-Dur
  if(hDurButton.isClicked())
  {
    listeningPhase=true;
    sendMessage("hDur");
    cleaner(hDur);
    pressedButton = hDur;
    ballPosition(59);
  }
  hDurButton.update();
  hDurButton.render();
  
  //C-Dur(2)
  if(cDurButton2.isClicked())
  {
    listeningPhase=true;
    sendMessage("cDur2");
    cleaner(cDur2);
    pressedButton = cDur2;
    ballPosition(60);
  }
  cDurButton2.update();
  cDurButton2.render();
  
  diffBut.drawDifficulties();
  showCurrentDifficulty();
  boundaries();
  
  //Das ist die "Zuhör-Phase", während die entsprechende Tonleiter abgespielt wird.
  if(listeningPhase){
    fill(100, 100, 100, 210);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Listen!", width/2, height/2);
  }
  
  //Start der Singing-Phase
  if(startBall){
    pressedButton.changeDifficulty(difficulty);
    fill(255);
    ball.drawBall(positionX, positionY);
    positionX = positionX+1.6;
    pressedButton.drawScale();
  }
  
  //Wenn der Ball am rechten Bildschirm-Rand angekommen ist, ist die Singing-Phase abgeschlossen, der Nutzer bekommt seine erreichten Punkte angezeigt
  if(ball.positionX==width){
    result = points(pressedButton);
    fill(100, 100, 100, 210);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Your result is " + result + " out of 24", width/2, height/2 - 70);
    okButton.update();
    okButton.render();
    ball.positionX=20;
    ball.positionY=360;
    //das Result wird mit einem Button vom Nutzer bestätigt 
    if(okButton.isClicked()){
      startBall = false;
      println("startball ist false");
      cleaner(pressedButton);
    }
  }  
  
  //Buttons für Änderung der Schwierigkeit
  if(diffBut.easy.isClicked()){
    this.difficulty= 30;
    diffIndex = "easy";
  }
  if(diffBut.medium.isClicked()){
    this.difficulty=20;
    diffIndex = "medium";
  }
  if(diffBut.hard.isClicked()){
    this.difficulty=10;
    diffIndex = "hard";
  }
  
}
//Grenzen für Ballbewegung 
void boundaries(){
    if(positionX > width) { // off right of window
    positionX = width;
  }
    if(positionY < 110) { // off top of window
    positionY = 110;
  }
    if(positionY > 620) { // off bottom of window
    positionY = 620;
  }
}

//Senden einer Message an PureData
//Es wird als "key" die entsprechende Tonart übergeben und diese als Pfad an PureData gesendet
void sendMessage(String key){
  OscMessage myMessage = new OscMessage("/" + key);
  myMessage.add("");
  oscP5.send(myMessage, myRemoteLocation);
}

//Wenn ein Durchgang abgeschlossen ist, muss der Ball an den Anfang gesetzt und die Rechtecke wieder entfärbt werden
void cleaner(Scale sc){
  positionX = 0;
  sc.cleanScale();
}

//Methode um die ballPositionY zu berechnen, die für die Anpassung der Ballhöhe bei den verschiedenen Tonarten zuständig ist
void ballPosition(float x){
  this.ballPositionY = 60-x;
}  

//Erreichte Punkte in der jeweiligen Tonart ausgeben
int points(Scale sc){
  return sc.showPoints();
}

void showCurrentDifficulty(){
  fill(255);
  text("Currently: " + diffIndex, width / 2 + 220, 655);
}
