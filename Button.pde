class Button implements Interactable {
  PVector pos;
  PVector size;
  color releasedColor;
  color pressedColor;
  boolean pressed = false;

  Runnable handler;

  Button(int x, int y,
         int width, int height,
         color released, color pressed){
           
    this.pos = new PVector(x, y);
    this.size = new PVector(width, height);
    this.releasedColor = released;
    this.pressedColor = pressed;
  }

  void interact(){
    
  }

  void render() {
    pressed = (mousePressed &&
      mouseX > pos.x &&
      mouseX < pos.x + size.x &&
      mouseY > pos.y &&
      mouseY < pos.y + size.y);

    if (pressed) {
      fill(pressedColor);
      handler.run();
    }
    else fill(releasedColor);

    rect(pos.x, pos.y, size.x, size.y);
  }
}
