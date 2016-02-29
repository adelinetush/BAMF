int xStart = 1;
float test;
int yIndex = 0;
float lastxPoint = 0;
float lastyPoint = 0;
float timer = millis();

int timer2 = second();

void setup() {
  background(#000000);
  size(800, 700);
  
  stroke (255);
  
  
}
void draw () {
  //The X is the Time series. The Y is the value from the XBEE
  text(timer2++/100, 700, 200);
  
  


//Assigned the Points
  float yPoints[] = new float[5];
  yPoints[0] = 150.0F;
  yPoints[1] = 100.0F;
  yPoints[2] = 200.0F;
  yPoints[3] = 380.0F;
  yPoints[4] = 350.0F;


  //println(yPoints);

  //String[] points = loadStrings("yPoints");

  //yPoints = new int[points.length];

  //line(frameCount-1, test, frameCount, 100-frameRate);

  //test = 100;

  //float points = random(height);
  stroke(#456456);
  //Move the timer
  timer++;
  //Every Second draw a line
  if (timer%100==0) {
    //Draw the Last Point and the next points
    if (yIndex==4) {
      yIndex= 0;
    }
    line(lastxPoint, lastyPoint*-1+400, timer/2, yPoints[yIndex]*-1+400);
    lastxPoint = timer/2;
    lastyPoint = yPoints[yIndex];
    yIndex++;
    println(timer);
    
    fill(255, 0, 0);
    
    text(00.00, 10, 403);
    
    text(100, 10, 300);
    
    text(200, 10, 200);
    
    text(300, 10, 100);
    
    text(380, 10, 20);
    
    text(timer/10, timer/2+10, 403);
    
  }


  //rect(200, 200, timer/10++, 300);
  
  


  //xStart = points;
}