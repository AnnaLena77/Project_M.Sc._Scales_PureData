class Notes{
  float rectH;
  float rectW;
  float xPosition;
  float yPosition;
  NoteRect first;
  NoteRect second;
  NoteRect third;
  char note;
  
  Notes(float xPosition, float yPosition, float rectW, float rectH, char note){
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
  }
  public void cleanNoteRects(){
    first.fill=false;
    second.fill=false;
    third.fill=false;
  }
}
