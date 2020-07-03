//https://www.youtube.com/watch?v=z903vXot-Lg

class Button 
{
  PVector Pos = new PVector(0,0);
  float butWidth =  0;
  float butHeight = 0;
  color butColor;
  color textColor;
  String butText;
  Boolean pressed = false;
  Boolean clicked = false;
  
  //Konstruktor Button
  Button(int x, int y, int w, int h, String t, int r, int g, int b, int c)
  {
    Pos.x = x;
    Pos.y = y;
    butWidth = w;
    butHeight = h;
    butColor = color(r, g, b);
    textColor = color(c);
    butText = t;
  }
  
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
  
  // Anzeige des Buttons
  void render() 
  {
    fill(butColor);
    //Umrahmung, sobald man auf Button drückt
    if(isClicked())
    {
      strokeWeight(2);
      stroke(255);
    } else {
      noStroke();
    }
    rect(Pos.x, Pos.y, butWidth, butHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    fill(textColor);
    text(butText, Pos.x + (butWidth/2), Pos.y + (butHeight / 2));
  }
  
  // Checken, ob der Button gedrückt wurde
  boolean isClicked()
  {
    return clicked;
  }
  
}
