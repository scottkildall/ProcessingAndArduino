/*
  GrowBar
  Written by Scott Kildall
  June 2019
  
  Receives a 1 or 0 from the Arduino, and will grow/shrink the
  rectangle accordingly
*/


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int serialPortNum = 1;    // this will change depending on your computer configuration

int barWidth = 30;
int barHeight = 500;
int barMargin = 50;    // from bottom of screen
int barTop;
int barLeft = 80;
int barBottom;
int growBarHeight = 0;

boolean growBar = false;

void setup() 
{
  size(600,600);
  rectMode(CORNER);    // draw from upper-left corner
  
  
  // List all the available serial ports:
  printArray(Serial.list());
  
  String portName = Serial.list()[serialPortNum]; //change the 0 to a 1 or 2 etc. to match your port
  
  println("Serial port = " + portName);
  
  myPort = new Serial(this, portName, 115200);
  
  //-- set bar drawing points
  barTop = barMargin;
  barBottom = barTop + barHeight;
  
  
  strokeWeight(1);
  stroke(128);
  
}

void draw() {
  background(0); 
  
  //-- draw growBar
  drawGrowBar();
  
  //-- draw the outline rect
  noFill();
  rect( barLeft, barTop, barWidth, barHeight);
  
  processSerial();
  
  adjustGrowBar();
  
 
}

void drawGrowBar() {
  fill(255,0,128);
  rect( barLeft, barTop, barWidth, growBarHeight);
}

void processSerial() {
  char val;
  
  if( myPort.available() > 0) {
    val = myPort.readChar();       
    if( val == '0' ) {
      growBar = false;
      println(growBar);
    }
    else if( val == '1' ) {
      growBar = true;
      println(growBar); 
    }
    else
      println("error: received invalid value: " + val );
  } 
}

void adjustGrowBar() {
  //-- add to growBarTop for next round
  if( growBar ) {
    growBarHeight += 1;
    if( growBarHeight > barHeight )    // check for overflow
      growBarHeight = barHeight;
  }
  else {
     growBarHeight -= 1;
    if( growBarHeight < 0 )    // check for overflow
      growBarHeight = 0;
  }   
}
