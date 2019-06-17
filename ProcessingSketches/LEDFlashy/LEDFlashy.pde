/*
  LEDFlashy
  Written by Scott Kildall
  June 2019
  
   Send a number of LED flashes to the Arduino
*/


import processing.serial.*;

Serial myPort;  // Create object from Serial class

int serialPortNum = 1;    // this will change depending on your computer configuration
int numFlashes = 6;

void setup() 
{
  size(200,200);
  
  // List all the available serial ports:
  printArray(Serial.list());
  
  String portName = Serial.list()[serialPortNum]; //change the 0 to a 1 or 2 etc. to match your port
  
  println("Serial port = " + portName);
  
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  background(0);  
}

void keyPressed() {
   myPort.write(numFlashes);
   println("Num flashes = " + numFlashes );
   
   // Uncomment to just do keyboard numbers
   /*
   if( key >= '1' && key <='9' ) {
     println( "key received =" + key );
     // Covert to ASCI (http://www.asciitable.com/)
     int flashCount = key - '1' + 1;  
     
     myPort.write(flashCount);
   }
   */
}
