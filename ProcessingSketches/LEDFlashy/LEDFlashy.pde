/*
  LEDFlashy
  Written by Scott Kildall
  June 2019
  
  Will send out a single byte to Arduino to indicate the number
  of times we will flash an LED
  
*/


import processing.serial.*;

Serial myPort;  // Create object from Serial class

int serialPortNum = 4;    // this will change depending on your computer configuration

void setup() 
{
  size(200,200);
  
  // List all the available serial ports: change the serialPortNum based on the output
  printArray(Serial.list());
  
  //change the 0, 1, 2 etc. to match your port
  String portName = Serial.list()[serialPortNum]; 
  
  // Show what we have set
  println("Serial port = " + portName);
  
  // allocate a serial port object. The new keyword will dynamically-allocatye an object
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  background(0);  
}

void keyPressed() {
   int numFlashes = 6;
  // myPort.write(numFlashes);
  // println("Num flashes = " + numFlashes );
   
   // Uncomment to just do keyboard numbers

   if( key >= '1' && key <='9' ) {
     println( "key received = " + key );
     // Covert to ASCI (http://www.asciitable.com/)
     numFlashes = key - '1' + 1;  
     
     myPort.write(numFlashes);
   }
}
