
import controlP5.*;
import java.util.*;

Timer timer ;
MinuteTimer minuteTimer;
SecondsCountdownTimer secondsCountdownTimer;
MinutesCountdownTimer minutesCountdownTimer;    // I made different two timers, one counts upwards normally, and the other one counts down. They each have classes for minutes and seconds.

Button start, pause, cont; 
color background, button, text;

boolean mousePressed;

int publicCounter = 0;

int publicMinuteCounter = 0;



ControlP5 timeCountdown;      //for the dropdown list

void setup() {
  println("Inititalizaing Program");
  size(displayWidth, displayHeight);

  timeCountdown = new ControlP5(this);
  List list = Arrays.asList("5 Seconds", "10 Seconds", "20 Seconds", "30 Seconds", "1 Minute", "5 Minutes", "10 Minutes", "20 Minutes", "30 Minutes");  // for the dropdown of countdown time
  /* add a ScrollableList, by default it behaves like a DropdownList */
  timeCountdown.addScrollableList("dropdown")
    .setPosition(displayWidth*0.6, displayHeight*0.3)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(list)
    // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
    ;

  timer = new Timer(displayWidth*0.8, displayHeight*0.2) ;     // define position for the main timer (seconds)
  timer.start() ;
  
  minuteTimer = new MinuteTimer(displayWidth*0.7, displayHeight*0.2) ; // define position for the main timer (minutes)
  minuteTimer.start() ;
  
  secondsCountdownTimer = new SecondsCountdownTimer(displayWidth*0.5, displayHeight*0.5);  // define position for the countdown timer (seconds)
  secondsCountdownTimer.start();
  
  minutesCountdownTimer = new MinutesCountdownTimer(displayWidth*0.4, displayHeight*0.5);  // define position for the countdown timer (minutes)
  minutesCountdownTimer.start();
  

  background = color(#124344);
  button = color(#345678);
 


  //BUTTONS 
  
  start = new Button(displayWidth*0.2, displayHeight*0.2, "START/RESTART");
  pause = new Button(displayWidth*0.2, displayHeight*0.4, "PAUSE");
  cont = new Button(displayWidth*0.2, displayHeight*0.6, "CONTINUE");
}

void mousePressed() {
  //println("mouse pressed");
  mouseHandler();
}

void draw() {
  background(background);
  //rect(x, height*0.2, 1, height*0.6); 
  //x= x+2;
  
  //Start the timers

  textSize(80);
  timer.DisplayTime();
  minuteTimer.DisplayMinutes();
  
  
  secondsCountdownTimer.countdown();
  minutesCountdownTimer.countdown();

  textSize(69);
  start.draw();

  pause.draw();
  cont.draw();


  if (mousePressed == true) {
    println("Click Active");
    mouseHandler();
  } else {

    //timer.pause();
  }


  //text(0, displayWidth*0.8, displayHeight*0.2); 
  fill(#456456);
}


void dropdown(int n) {
  /* request the selected item based on index n */
  println(n, timeCountdown.get(ScrollableList.class, "dropdown").getItem(n));


  CColor c = new CColor();
  c.setBackground(color(255, 0, 0));
  timeCountdown.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);


  //Depending on the selection from the dropbox, change the amount of time on the countdown
  //and then start the countdown
 
  if (n == 0) {
    publicCounter = 5;
    secondsCountdownTimer.countdown();
  }
  if (n == 1) {
    publicCounter = 10;
    publicMinuteCounter = 1;
    secondsCountdownTimer.countdown();
  }
  if (n == 2) {
    publicCounter = 20;
    secondsCountdownTimer.countdown();
  }
  if (n == 3) {
    publicCounter = 30;
    secondsCountdownTimer.countdown();
  }
  if (n == 4) {
    publicCounter = 59;
    publicMinuteCounter = 0;
    if(publicMinuteCounter >= 0) {
      publicCounter = 59;
    }
    secondsCountdownTimer.countdown();
  }
  if (n == 5) {
    publicCounter = 59;
    publicMinuteCounter = 4;
    if(publicMinuteCounter >= 0) {
      publicCounter = 59;
    }
    secondsCountdownTimer.countdown();
  }
  if (n == 6) {
    publicCounter = 59;
    publicMinuteCounter = 9;
    secondsCountdownTimer.countdown();
    if (n == 7) {
      publicCounter = 59;
      publicMinuteCounter = 19;
      secondsCountdownTimer.countdown();
    }
    if (n == 8) {
      publicCounter = 59;
    publicMinuteCounter = 29;
      secondsCountdownTimer.countdown();
    } else {
    }
  }
}
void keyPressed() {
  switch(key) {
    case('1'):
    /* make the ScrollableList behave like a ListBox */
    timeCountdown.get(ScrollableList.class, "dropdown").setType(ControlP5.LIST);
    break;
    case('2'):
    /* make the ScrollableList behave like a DropdownList */
    timeCountdown.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
    break;
    case('3'):
    /*change content of the ScrollableList */
    List l = Arrays.asList("a-1", "b-1", "c-1", "d-1", "e-1", "f-1", "g-1", "h-1", "i-1", "j-1", "k-1");
    timeCountdown.get(ScrollableList.class, "dropdown").setItems(l);
    break;
    case('4'):
    /* remove an item from the ScrollableList */
    timeCountdown.get(ScrollableList.class, "dropdown").removeItem("k-1");
    break;
    case('5'):
    /* clear the ScrollableList */
    timeCountdown.get(ScrollableList.class, "dropdown").clear();
    break;
  }
}


class Button {
  float x, y;
  String buttonName;

  Button(float x, float y, String buttonName) {
    this.x = x;
    this.y = y;
    this.buttonName = buttonName;
  }

  void draw() {
    rectMode(CENTER);
    fill(button);
    rect(x, y, textWidth(buttonName+100), 120, 20);
    fill(#455455);

    textSize(80);

    switch (buttonName.length()) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    case 5:
      text(buttonName, x-85, y+30);
      break;
    case 6:
      text(buttonName, x-140, y+30);
      break;
    case 7:
      break;
    case 8:
      text(buttonName, x-200, y+30);
      break;
    case 9:
      break;
    case 10:
      break;
    case 11:
      break;
    case 12:
      break;
    case 13:
      text(buttonName, x-300, y+30);
      break;


    default:
      break;
    }
  }
}

void mouseHandler () {
  if (mouseX > displayWidth*0.2 && mouseY > displayHeight*0.2 && mouseX < displayWidth* 0.3 && mouseY < displayHeight*0.3) {
    //mousePressed = !mousePressed;
    timer.restart();
    secondsCountdownTimer.restart();
    minuteTimer.restart();
    minutesCountdownTimer.restart();
  } else {
  }
  if (mouseX > displayWidth*0.2 && mouseY > displayHeight*0.4 && mouseX < displayWidth* 0.3 && mouseY < displayHeight*0.5) {
    //mousePressed = !mousePressed;
    timer.pause();
  } else {
  }
  if (mouseX > displayWidth*0.2 && mouseY > displayHeight*0.6 && mouseX < displayWidth* 0.3 && mouseY < displayHeight*0.7) {
    //mousePressed = !mousePressed;
    timer.continueRunning();
  } else {
  }
}

class Timer {   //---------------------------------------------------Default Seconds
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  Timer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayTime() {    
    int theTime ; 
    String output = "";     
    theTime = currentTime() ;
    if (theTime > 59) {
      running = true ;     
      startTime = millis() ;
    }

    output = output + theTime ;
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  
}



class MinuteTimer {   // -------------------------------- default minutes
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  MinuteTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  int minutes() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }


  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      


  void DisplayMinutes() {    
    int theTime ;    
    String output = "";     
    theTime = minutes() ;    
    output = output + theTime ;       
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }

}



class SecondsCountdownTimer {   //--------------------------------------------------- Countdown Seconds
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  SecondsCountdownTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayTime() {    
    int theTime ; 
    String output = "";     
    theTime = currentTime() ;
    //if (theTime > 59) {
    //  running = true ;     
    //  startTime = millis() ;
    //}

    output = output + theTime ;
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  void setToZero(){
    text(0, x, y);
  }
  void countdown () {

    int theTime;
    int newCounter = publicCounter;

    theTime = currentTime();

    newCounter= newCounter - theTime;

    //when counter is below 0, stop running
    if (newCounter < 0) {
      running = false;
    }
    
    //if (!(newCounter == 0) && publicMinuteCounter > 0 && mousePressed == true){
    //  newCounter = 59;
    //  running = true;
    //}

    text(newCounter, x, y);
  }
}



class MinutesCountdownTimer {   //--------------------------------------------------- Countdown Minutes
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  MinutesCountdownTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }
  
  int minutes() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayMinutes() {    
    int theTime ;    
    String output = "";     
    theTime = minutes() ;    
    output = output + theTime ;       
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  void countdown () {

    int theTime;
    int newCounter = publicMinuteCounter;
    theTime = currentTime();

    newCounter= newCounter - theTime;
    if (newCounter < 0) {
      running = false;
    }
    color(#111111);
    text(newCounter, x, y);
    
     
  }
}