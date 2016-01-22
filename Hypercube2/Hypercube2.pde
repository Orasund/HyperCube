Tesseract tesseract=new Tesseract();
PFont f;
int tick = 0;

void setup()
{
  fullScreen();
  background(255);
  //size(1024,768);
  strokeWeight(2);
  
  //printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
  
}

void draw()
{
  background(255);
  if(tesseract.A_.x_!=0)
  {
    tesseract.rotatexw();
    tick++;
  }
  strokeWeight(2);
  tesseract.show();
  strokeWeight(10);
  tesseract.A_.show();
  fill(0);
  text(tesseract.A_.x_,30,30);
  text(tesseract.A_.y_,30,50);
  text(tesseract.A_.z_,30,70);
  text(tesseract.A_.w_,30,90);
  text(tesseract.A_.getAngel(),30,190);
  
}