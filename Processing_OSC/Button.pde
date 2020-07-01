//https://www.youtube.com/watch?v=z903vXot-Lg

class Button 
{
  PVector Pos = new PVector(0,0);
  float butWidth =  0;
  float butHeight = 0;
  color butColor;
  String butText;
  Boolean pressed = false;
  Boolean clicked = false;
  
  //Konstruktoren um Button zu erzeugen 
  Button(int x, int y, int w, int h, String t, int r, int g, int b)
  {
    Pos.x = x;
    Pos.y = y;
    butWidth = w;
    butHeight = h;
    butColor = color(r, g, b);
    butText = t;
  }
  //Button Klick in void draw benutzen
  void update()
  {
    if(mousePressed == true && mouseButton == LEFT && pressed==false) 
    { 
      pressed = true;
      if(mouseX >= Pos.x && mouseX <= Pos.x + butWidth && mouseY >= Pos.y && mouseY <= Pos.y + butHeight) 
      {
        clicked = true;
      }
    } else 
    {
      clicked = false;
    }
    if(mousePressed != true) 
    {
      pressed = false;
    }
  }
  // in void draw() platzieren um den button zu rendern
  void render() 
  {
    fill(butColor);
    rect(Pos.x, Pos.y, butWidth, butHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    text(butText, Pos.x + (butWidth/2), Pos.y + (butHeight / 2));
  }
  // in if statements benutzen um zu checken ob der button gedrückt wurde
  boolean isClicked()
  {
    return clicked;
  }
  
}
