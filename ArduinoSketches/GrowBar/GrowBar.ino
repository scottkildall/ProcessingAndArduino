/*
  GrowBar

  Arduino to Procesing
  
  by Scott Kildall


  If the switch is on, then the LED turns on, otherwise it turns off
  
  LED is on pin 7
  Button is on pin 4 -- use a pull-down resistor (10K) to ground
  
  
 */

// Global variables
int ledPin = 7;
int switchPin = 12;

// the setup function runs once when you press reset or power the board
void setup() {
  pinMode(ledPin, OUTPUT);    // Your LED pin, check out global variables above
  pinMode(switchPin, INPUT);  // Your switch pin (though technically speaking, this code is not needed)

  Serial.begin(115200);
}

// the loop function runs over and over again forever
void loop() {
  // if button is pressed, turn LED on, otherwise turn it off
  //-- alternate ways, use HIGH instead of true - these evaluate the same thing

  
   if( digitalRead(switchPin) == HIGH  )   {
       digitalWrite(ledPin, HIGH);   
       Serial.println(1);
   }
   
   else { 
      digitalWrite(ledPin, LOW);
      Serial.println(0);
   }

   delay(50);
}
