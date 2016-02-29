//PGraphics pg;

color backgroundColor;


//float angle = 0.0;
int timer = second();

//float timer2;

void setup() {
  size(600, 800);
  //smooth();
  //background(backgroundColor);
  //pg = createGraphics(100,100);
 
}

void draw() {
  background(backgroundColor);
 

  //ellipse(700, 700, 500, 500);
  
  textSize(80);
  
  
  text(timer++/100, 400, 200);
  fill(#456456);
  println(timer);
  
  
}