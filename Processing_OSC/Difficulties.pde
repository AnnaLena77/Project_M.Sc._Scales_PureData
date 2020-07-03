class Difficulties
{
  PVector Pos = new PVector(0,0);
  float butWidth =  0;
  float butHeight = 0;
  color butColor;
  String butText;
  Button easy;
  Button medium;
  Button hard;
  
  int actuallyDifficulty;
  
  //Konstruktor
  Difficulties(int x, int y, int w, int h, String t, int r, int g, int b)
  {
    Pos.x = x;
    Pos.y = y;
    butWidth = w;
    butHeight = h;
    butColor = color(r, g, b);
    butText = t;
    easy = new Button(width / 2 - 105, 630, 70, 50, "easy",  0, 215, 0, 255);
    medium = new Button(width / 2 + -35, 630, 70, 50, "medium", 255, 195, 0, 255);
    hard = new Button(width / 2 + 35, 630, 70, 50, "hard", 255, 0, 0, 255);
  }
  public void drawDifficulties(){
    easy.update();
    easy.render();
    medium.update();
    medium.render();
    hard.update();
    hard.render();
    textSize(15);
    text("Difficulty:", width / 2 - 170, 655);
  }
}
