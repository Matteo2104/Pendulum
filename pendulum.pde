float L;
float theta;
float G;

float x0, y0;
float x, y;
float omega, alpha;

void setup() {
  fullScreen();

  L = 350;
  G = 0;
  
  x0 = width / 2;
  y0 = height / 3;
  
  theta = 0;
}

void draw() {
  background(0);
  
  if (keyPressed) {
    if (keyCode == UP) {
      G += 0.0001;
    }
    
    if (keyCode == DOWN) {
      G -= 0.0001;
    }
  }
  
  if (G > 1) {
    G = 1;
  }
  if (G < 0) {
    G = 0;
  }
  
  alpha = -G * sin(theta);
  
  if (mousePressed) {
    theta = PI/2 - atan2(mouseY - y0, mouseX - x0);
  } else {
    omega += alpha;
    omega *= 0.99;
  }
  
  theta += omega;
  x = x0 + L * sin(theta);
  y = y0 + L * cos(theta);
  
  strokeWeight(4);
  stroke(255);
  line(x0, y0, x, y);
  
  noStroke();
  fill(255);
  circle(x, y, 40);
  
  textSize(50);
  text("Gravity: " + nf(G, 0, 4), 50, 80);
}
