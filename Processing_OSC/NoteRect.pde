//Klasse für ein einzelnes Rechteck
class NoteRect{

  float rectW;
  float rectH;
  
  float xPositionNote = 0;
  float yPositionNote = 0;
  float left;
  float right;
  float top;
  float bottom;
  boolean fill;
  
  int pointer;
  
  //Konstruktor
  NoteRect(float xPosition, float yPosition, float rectW, float rectH){
    this.rectW = rectW;
    this.rectH = rectH;
    this.xPositionNote = xPosition-rectW/2;
    this.yPositionNote = yPosition-rectH/2;
    
    //Begrenzungen der einzelnen Rechtecke
    this.left = xPositionNote;
    this.right = xPositionNote + rectW;
    this.top = yPositionNote;
    this.bottom = yPositionNote + rectH;
    this.fill=false;
    this.pointer=0;
  }
  
  void drawRect(){
    fill(153,255,255);
    noStroke();
    this.filling();
    if(this.fill){
      fill(0,200,0);
      this.pointer=1;
    }
    rect(xPositionNote, yPositionNote , rectW, rectH);
  }
  
  //Methode zum Füllen eines einzelnen Rechtecks
  void filling(){
    if (ball.getPositionX() > this.left && ball.getPositionX() < this.right) {
      if(ball.getPositionY() > this.top && ball.getPositionY() < this.bottom){
        this.fill = true;
      }
    }
  }
}
