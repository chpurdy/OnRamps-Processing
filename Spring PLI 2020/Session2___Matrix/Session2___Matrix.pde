
PImage img;
ArrayList<Letter> letters;
int density;

void setup() {
  //fullScreen(P3D,2);
  img = loadImage("got.jpg");
  surface.setSize(img.width, img.height);
  density = img.width;
  letters = new ArrayList<Letter>();
  initList();
}

void initList() {
  for (int i = 0; i < density; i++) {
    letters.add(new Letter());
  }
}

void draw() {

  image(img, 0, 0);
  
  for (int i = 0; i < letters.size(); i++) {
    Letter let = letters.get(i);
    let.fall();
    let.show();
    if (let.offScreen()) {
      letters.set(i,new Letter());
    }
  }
}
