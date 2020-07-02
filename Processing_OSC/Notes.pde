//Klasse zum erstellen von 3 Rechtecken nebenbeinander, die eine Note bilden

class Notes{
  float rectH;
  float rectW;
  float xPosition;
  float yPosition;
  NoteRect first;
  NoteRect second;
  NoteRect third;
  String note;
  int pointer;
  
  Notes(float xPosition, float yPosition, float rectW, float rectH, String note){
    this.note = note;
    this.rectH = rectH;
    this.rectW = rectW;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    this.first = new NoteRect(this.xPosition, this.yPosition , this.rectW, this.rectH);
    this.second = new NoteRect(this.xPosition + this.rectW, this.yPosition , this.rectW, this.rectH);
    this.third = new NoteRect(this.xPosition + this.rectW * 2, this.yPosition , this.rectW, this.rectH);
  }

  public void drawNote(){
    first.drawRect();
    second.drawRect();
    third.drawRect();
    text(note, this.xPosition+rectW, this.yPosition + rectH+10);
    this.pointer=first.pointer+second.pointer+third.pointer;
  }
  
  //Cleaner, um Pointer und Färbung zurückzusetzen
  public void cleanNoteRects(){
    first.pointer=0;
    second.pointer=0;
    third.pointer=0;
    first.fill=false;
    second.fill=false;
    third.fill=false;
  }
  
  //Schwierigkeitstufe verändern
  public void changeDifficulty(int dif){
    first.rectH=dif;
    second.rectH=dif;
    third.rectH=dif;
  }
}
