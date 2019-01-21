Star [] stars = new Star[1200];
float speed = 0;

float camx = width/2;
float camy = height/2;

float omx;
float omy;

float inc = 0.01;
float detail;


void setup() {
  size(800, 800);
  for (int i=0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  detail = map(speed, 0, 200, 0.4, 0.1); 
  noiseDetail(4, detail);
  //PerlinSpace();
  translate(camx, camy);
  for (int i= 0; i < stars.length; i++) {
   stars[i].update();
   stars[i].show();
  }
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      speed += ((800-speed)/15);
    } else if (keyCode == DOWN) {
      speed += ((0-speed)/15);
    } 
  }
}
void mousePressed() {
  omx = mouseX;
  omy = mouseY;
}

void mouseDragged() {
 camx += (mouseX - omx);
 camy += (mouseY - omy);
   if (camx > 800) {
   camx = 0;
  }
  if (camx < 0) {
   camx = 800;
  }
  if (camy > 800) {
   camy = 0; 
  }
  if (camy < 0) {
   camy = 800; 
  }
 omx = mouseX;
 omy = mouseY;
}

void PerlinSpace(){
 loadPixels();
 float xoff = 0.0;
 for (int x = 0; x < width; x++) {
   xoff += inc;
   float yoff = 0.0;
   for (int y = 0; y < height; y++) {
     yoff += inc;
     colorMode(HSB);
     float h = noise(xoff, yoff) * 255;
     float s = noise(xoff + 1000, yoff + 1000) * 200;
     float b = noise(xoff - 1000, yoff - 1000) * 60;
     pixels[x+y*width] = color(h, s, b);
   }
 }
 updatePixels();
}