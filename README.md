# andrew,s portfolio 2024-25
##### my name is andrew and at the time i am writing this i am 15 years old and am in 10th grade
## Term 1 
//andrew misco | ship | 10/28/24
void setup() {
  size(500,500);
}

void draw() {
  background(0);
  drawShip(mouseX,mouseY+40);
}

void drawShip(int tempX, int tempY) {
  fill(100);
  triangle( tempX, tempY - 20,tempX + 40, tempY + 30, tempX-40, tempY+30);
  fill(127);
  triangle( tempX, tempY - 30,tempX + 20, tempY + 30, tempX-20, tempY+30);
  fill(#0ACAF7);
  triangle( tempX, tempY - 20,tempX + 8, tempY + 17, tempX-8, tempY+17);
  fill(#505A5D);
  rectMode(CENTER);
  rect(tempX-13 ,tempY+30,10,20);
  rect(tempX+13 ,tempY+30,10,20);
  fill(#FC8608);
  rect(tempX-13 ,tempY+40,10,5);
  rect(tempX+13 ,tempY+40,10,5);
  
}
## Term 2
