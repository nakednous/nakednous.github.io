PFont myFont;
MyRect dandelion, util, fpstiming, proscene, bias;
MyRect hover = null;

void setup() {
  size(500,290);
  background(125);
  fill(255);
  proscene = new MyRect(10,10,480,270,"ProScene","http://nakednous.github.io/projects/proscene");
  dandelion = new MyRect(30,50,430,210,"Dandelion","http://nakednous.github.io/projects/dandelion");
  fpstiming = new MyRect(250,90,180,150,"FPSTiming","http://nakednous.github.io/projects/fpstiming");
  bias = new MyRect(50,90,180,150,"BIAS","http://nakednous.github.io/projects/bias");
  util = new MyRect(70,130,100,80,"Util","https://github.com/remixlab/util_tree");
  
  //String[] fontList = PFont.list();
  //println(fontList);  
  
  myFont = createFont("Courier", 22);
  textFont(myFont);
}

void draw() {
  background(255);
  
  updateHover();
  
  pushStyle();
  if( hover == proscene ) fill(0,255,0);
  proscene.draw();
  popStyle();
  
  pushStyle();
  fill(0,0,255);
  dandelion.draw();
  popStyle();
  
  pushStyle();
  if( hover == fpstiming ) fill(0,255,0);
  else fill(255,255,255,80);
  fpstiming.draw();
  popStyle();
  
  pushStyle();
  if( hover == bias ) fill(0,255,0);
  else fill(255,255,255,80);
  bias.draw();
  popStyle();
  
  pushStyle();
  if( hover == util ) fill(0,255,0);
  else fill(255,255,255,80);
  util.draw();
  popStyle();
}

void updateHover() {
  hover = null;
  if( util.hover() )
    hover = util;
  else if( bias.hover() )
    hover = bias;
  else if( fpstiming.hover() )
    hover = fpstiming;
  else if ( dandelion.hover() )
    hover = dandelion;
  else if ( proscene.hover() )
    hover = proscene;
}

void mouseClicked() {
  if( hover != null )
    if( hover != dandelion )
      link(hover.url);
}

public class MyRect {
  float a,b,w,h;
  String name;
  String url;
  
  MyRect(float _a, float _b, float _w, float _h, String _n, String _u) {
    a = _a;
    b = _b;
    w = _w;
    h = _h;
    name = _n;
    url = _u;
  }
  
  boolean hover() {
    return (mouseX > a  && mouseX < a+w) && (mouseY > b  && mouseY < b+h);
  }
  
  void draw() {
    pushStyle();
    stroke(0);
    strokeWeight(4);
    rect(a,b,w,h,7);
    fill(0);
    text(name, a+20, b+30);
    popStyle();
  }
} 
