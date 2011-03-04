/* 
 * OSCdroid barcode example 
 * Victor Diaz 
 * http://victordiaz.github.com
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

String barcodeType = ""; 
String barcodeMsg = ""; 


int port = 12002; 

void setup() {
  size(500,500); 
  frameRate(25); 
  smooth(); 
 
  //start osc sever 
  oscP5 = new OscP5(this, port); 
  
}

void draw() {
  background(0); 
  
  fill(255); 
  text("Type: " + barcodeType, 50, 100); 
  text("Message: " + barcodeMsg, 50, 120); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 
  
  if(theOscMessage.checkAddrPattern("/oscdroid/barcode") == true) { 

      barcodeType = theOscMessage.get(0).stringValue(); 
      barcodeMsg = theOscMessage.get(1).stringValue(); 

      
      println(barcodeType + " " + barcodeMsg); 
    
      return; 
  } 
}
