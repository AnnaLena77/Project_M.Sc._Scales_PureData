class Ball{
  float positionX;
  float positionY;
  float width = 20; 
  Ball(float x, float y){
    this.positionX = x;
    this.positionY = y;
  } 
  public void drawBall(float x, float y){
    this.positionX = x;
    this.positionY = y;
    circle(this.positionX, this.positionY, 20);
  }
  public float getPositionX(){
    return this.positionX;
  }
  public float getPositionY(){
    return this.positionY;
  }
}
