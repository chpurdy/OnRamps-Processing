class Letter {
  int xPos, yPos;
  char value;
  float speed, opacity;
  ArrayList<Character> pastChars;
  color c;


  Letter() {
    xPos = int(random(img.width));
    yPos = 0;
    pastChars = new ArrayList<Character>();
    value = (char)int(random(33, 255));
    speed = random(1, 10);
    opacity = int(random(100, 200));
    textSize(20);
    c = color(20, 200, 20, opacity);
  }

  void fall() {
    yPos += speed;
    pastChars.add(0, value);
    while (pastChars.size() >= 10) {
      pastChars.remove(pastChars.size()-1);
    }
    value = (char)int(random(33, 255));
  }

  boolean offScreen() {
    if (yPos > img.height)
      return true;
    else
      return false;
  }

  void show() {
    fill(c);
    //rotateY(yPos*.1);
    text(value, xPos, yPos);
    for (int i = 0; i< pastChars.size(); i++) {
      Character ch = pastChars.get(i);
      color tCol = color(red(c), green(c), blue(c), alpha(c)-10*i);
      fill(tCol);
      text(ch, xPos, yPos-10*i);
    }
  }
}
