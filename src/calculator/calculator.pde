// andrew misco | calculator | Oct/2/2024
Button b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, bp, bn, bd, bmu, be, bm, b10, b11, b12, b13, b14, b15, b16, b17, b18;
Button[] buttons = new Button[25];
String dVal = "0";
char op;
float l, r, result;
boolean left, right;
void setup() {
  size(400, 400);
  background(0);
  left = true;
  op = ' ';
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(40, 370, '0', true);
  buttons[1] = new Button(40, 310, '1', true);
  buttons[2] = new Button(120, 310, '2', true);
  buttons[3] = new Button(200, 310, '3', true);
  buttons[4] = new Button(280, 310, 'N', false);
  buttons[5] = new Button(360, 310, '=', false);
  buttons[6] = new Button(40, 250, '4', true);
  buttons[7] = new Button(120, 250, '5', true);
  buttons[8] = new Button(200, 250, '6', true);
  buttons[9] = new Button(360, 250, '/', false);
  buttons[10] = new Button(40, 190, '7', true);
  buttons[11] = new Button(120, 190, '8', true);
  buttons[12] = new Button(200, 190, '9', true);
  buttons[13] = new Button(280, 190, '+', false);
  buttons[14] = new Button(360, 190, '-', false);
  buttons[15] = new Button(280, 250, 'x', false);
  buttons[16] = new Button(120, 370, 'C', false);
  buttons[17] = new Button(200, 370, 'D', false);
  buttons[18] = new Button(280, 370, '_', false);
  buttons[19] = new Button(360, 370, '?', false);
  buttons[20] = new Button(40, 110, '.', false);
  buttons[21] = new Button(120, 110, '_', false);
  buttons[22] = new Button(200, 110, '_', false);
  buttons[23] = new Button(280, 110, '_', false);
  buttons[24] = new Button(360, 110, '_', false);
}
void draw() {
  //println(" Left: " + l + " op: " + op + " Right: " + r + " result: " + result);
  //println();
  //println();



  background(0);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }



  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(255);
  rect(width/2, 25, 400, 80);
  fill(0);
  if (dVal.length() <= 15) {
    textSize(35);
  } else if (dVal.length() >=16) {
    textSize(20);
  }
  textAlign(RIGHT);
  text(dVal, width-100, 50);
}

void mousePressed () {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      dVal += str(buttons[i].val);
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 20) {
      dVal += str(buttons[i].val);
      r = float(dVal);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('+')) {
      dVal = "0";
      op = '+';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('/')) {
      dVal = "0";
      op = '/';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('-')) {
      dVal = "0";
      op = '-';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('x')) {
      dVal = "0";
      op = 'x';
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('C')) {
      left = true;
      op = ' ';
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('=')) {
      performCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('N')) {
      if (left) {
        l = -l;
        if ((int)l == l) {
          dVal = str(int(l));
        } else {
          dVal = str(l);
        }
      } else {
        r = -r;
        if ((int)r == r) {
          dVal = str(int(r));
        } else {
          dVal = str(r);
        }
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('.')) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == ('?')) {
      exit();
    }
  }
  //if (buttons[i].on == true) {
  //  if (buttons[i].val == ('C')) {
  //    dVal = "0.0";
  //    op = ' ';
  //    l = 0.0;
  //    r = 0.0;
  //    result = 0.0;
  //  } else if (dVal.equals("0.0")) {
  //    dVal = str(buttons[i].val);
  //  } else {
  //    if (left == true) {
  //      dVal += str(buttons[i].val);
  //      l = float(dVal);
  //    }
  //  }
  //}
}
// prenreces"()" dont work yet


void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  }
  dVal = str(result);
}
void handleEvent(String keyVal, boolean isNum) {
  //handel numbers
  if ( left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  }
}

void keyPressed() {
  println("key:" + key );
  println("keycode:" + keyCode);
  if (key == 0) {
    handleEvent("0", true);
  } else if (key == '1' || keyCode == 97) {
    handleEvent("1", true);
  } else if (key == '2' || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == '3' || keyCode == 99) {
    handleEvent("3", true);
  } else if (key == '4' || keyCode == 100) {
    handleEvent("4", true);
  } else if (key == '5' || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == '6' || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == '7' || keyCode == 103) {
    handleEvent("7", true);
  } else if (key == '8' || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == '9' || keyCode == 105) {
    handleEvent("9", true);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '+' || keyCode == 61) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '-' || keyCode == 45) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == 'C' || keyCode == 67) {
    handleEvent("C", false);
  } else if (key == '/' || keyCode == 47) {
    handleEvent("/", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);
  }else if (key == '.' || keyCode == 110) {
    handleEvent(".", false);
  }else if (key == '.' || keyCode == 46) {
    handleEvent(".", false);
  }
}
