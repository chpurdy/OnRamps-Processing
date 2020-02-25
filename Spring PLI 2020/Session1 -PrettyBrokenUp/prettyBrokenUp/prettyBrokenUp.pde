PImage img;
int boxWidth, boxHeight;
int squares;

void setup() {
  squares = 10;

  img = loadImage("got.jpg");



  img.resize(img.width/squares*squares, img.height/squares*squares);
  boxWidth = img.width / squares;
  boxHeight = img.height / squares;
  surface.setSize(img.width, img.height);


  noLoop();
}

void swapBox(int r1, int c1, int r2, int c2) {

  for (int row = 3; row < boxHeight-3; row++) {
    for (int col = 3; col < boxWidth-3; col++) {
      int from = (r1+row) * img.width + (c1+col);  
      int to = (r2+row)*img.width+ (c2+col);
      //println(from + " " + to + " " + img.pixels.length);
      color temp = img.pixels[from];
      img.pixels[from] = img.pixels[to];
      img.pixels[to] = temp;
    }
  }
}


void draw() {
  img.loadPixels();


  for (int i = 0; i < 50; i++) {
    int row1 = (int)random(squares)*boxHeight;
    int col1 = (int)random(squares)*boxWidth;
    int row2 = (int)random(squares)*boxHeight;
    int col2 = (int)random(squares)*boxWidth;
    swapBox(row1, col1, row2, col2);
  }


  img.updatePixels();



  image(img, 0, 0);
}
