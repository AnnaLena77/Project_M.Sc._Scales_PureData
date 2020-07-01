class Scale {
  
  int difficulty;
  int noteWidth;
  String note;
  Notes one;
  Notes two;
  Notes three;
  Notes four;
  Notes five;
  Notes six;
  Notes seven;
  Notes eight;
  
  char[] notes = {'C', 'D', 'E', 'F', 'G', 'A', 'H', 'C', 'D', 'E', 'F', 'G', 'A', 'H', 'C'};
  
  Scale(char note, int difficulty, int noteWidth){
    int save=0;
    for (int i = 0; i<notes.length; i++){
      if(notes[i]==(note)){
        save = i;
        break;
      }
    }
    
    this.difficulty = difficulty;
    this.one = new Notes((800/8)-noteWidth*3+200, 480, 30, difficulty, notes[save]);  
    this.two = new Notes(((800/8)*2)-noteWidth*3+200, 440, 30, difficulty, notes[save+1]);  
    this.three = new Notes(((800/8)*3)-noteWidth*3+200, 400, 30, difficulty, notes[save+2]); 
    this.four = new Notes(((800/8)*4)-noteWidth*3+200, 380, 30, difficulty, notes[save+3]); 
    this.five = new Notes(((800/8)*5)-noteWidth*3+200, 340, 30, difficulty, notes[save+4]); 
    this.six = new Notes(((800/8)*6)-noteWidth*3+200, 300, 30, difficulty, notes[save+5]); 
    this.seven = new Notes(((800/8)*7)-noteWidth*3+200, 260, 30, difficulty, notes[save+6]); 
    this.eight = new Notes(((800/8)*8)-noteWidth*3+200, 240, 30, difficulty, notes[save+7]); 
  }
  public void drawScale(){
    one.drawNote();
    two.drawNote();
    three.drawNote();
    four.drawNote();
    five.drawNote();
    six.drawNote();
    seven.drawNote();
    eight.drawNote();
  }
}
