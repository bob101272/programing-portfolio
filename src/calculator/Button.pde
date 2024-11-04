class Button {
  // Meamber Variables
  int w, h, x, y;
  color c1, c2;
  char val;
  boolean on , isNum;

  // Constructor
  Button(int x, int y, char val, boolean isNum) {
    this.x = x;
    this.y = y;
    w = 75;
    h = 55;
    c1 = color(#DE7D06);
    c2 = color(150);
    this.val = val;
    on = false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
