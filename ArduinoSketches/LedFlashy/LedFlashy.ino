/*
  LEDFlashy

  LED is on pin 7

  Looks for a Serial Input from Processing
  By Scott Kildall
  
 */

// Global variables
int ledPin = 7;


// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(ledPin, OUTPUT);    // Your LED pin, check out global variables above
  Serial.begin(115200);

  // Flash LED 3 times
  flashLED(3);
}

// the loop function runs over and over again forever
void loop() {
  if (Serial.available())  { // If data is available to read,
    int val = Serial.read(); // read it and store it in val
    flashLED(val);
   }
  
   delay(10); // Wait 10 milliseconds for next reading
}

//-- short delay and turn LED on/off
void flashLED(int numTimes) {
  for( int i = 0; i < numTimes; i++ ) {
    digitalWrite(ledPin,HIGH);
    delay(150);
    digitalWrite(ledPin,LOW);
    delay(150);
   }
}
