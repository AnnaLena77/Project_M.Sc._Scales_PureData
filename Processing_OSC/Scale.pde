//Klasse, um eine gesamte Tonleiter zu erstellen

class Scale {
  
  int difficulty;
  int noteWidth;
  String note;
  
  //Tonleiter besteht aus 8 Noten
  Notes one;
  Notes two;
  Notes three;
  Notes four;
  Notes five;
  Notes six;
  Notes seven;
  Notes eight;
  
  //Notenfolge
  String[] notes = {"C", "D", "E", "F", "G", "A", "H", "C", "D", "E", "F", "G", "A", "H", "C"};
  
  Scale(String note, int difficulty, int noteWidth){
    //Die einzelnen Notenfolgen der Tonleitern werden aufgebaut.
    int save=0;
    for (int i = 0; i<notes.length; i++){
      if(notes[i].equals(note)){
        save = i;
        break;
      }
    }
    
    //Die Verschiedenen Tonleitern bestehen nicht nur aus "natürlichen" Tönen, dies wird hier entsprechend angepasst  
    if(note.equals("D")){
      notes[3]="fis";
      notes[7]="cis";
      
    }
    if(note.equals("E")){
      notes[3]="fis";
      notes[4]="gis";
      notes[7]="cis";
      notes[8]="dis";
    }
    if(note.equals("F")){
      notes[6]="b";
    }
    if(note.equals("G")){
      notes[10]="fis";
    }
    if(note.equals("A")){
      notes[7]="cis";
      notes[10]="fis";
      notes[11]="gis";
    }
    if(note.equals("H")){
      notes[7]="cis";
      notes[8]="dis";
      notes[10]="fis";
      notes[11]="gis";
      notes[12]="ais";
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
  
  //Punkteberechnung
  public int showPoints(){
    return one.pointer+two.pointer+three.pointer+four.pointer+five.pointer+six.pointer+seven.pointer+eight.pointer;
  }
  
  //Cleanen der Färbung und Points
  public void cleanScale(){
    one.cleanNoteRects();
    two.cleanNoteRects();
    three.cleanNoteRects();
    four.cleanNoteRects();
    five.cleanNoteRects();
    six.cleanNoteRects();
    seven.cleanNoteRects();
    eight.cleanNoteRects();
  }
  
  //Verändern der Schwierigkeitstufe
  public void changeDifficulty(int dif){
    one.changeDifficulty(dif);
    two.changeDifficulty(dif);
    three.changeDifficulty(dif);
    four.changeDifficulty(dif);
    five.changeDifficulty(dif);
    six.changeDifficulty(dif);
    seven.changeDifficulty(dif);
    eight.changeDifficulty(dif);
  }
}
