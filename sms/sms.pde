/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

String phone = ""; 
String sms = ""; 


void setup() {
  size(500,500); 
  frameRate(25); 
  smooth(); 

  //start osc sever 
  oscP5 = new OscP5(this, 12002); 
  
}

void draw() {
  background(0); 
  
  fill(255); 
  text("From: " + phone, 50, 50); 
  text("Message: " + sms, 50, 100); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 
  /* check if theOscMessage has the address pattern we are looking for. */ 
  
  println("timetag: "+theOscMessage.timetag());
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag()); 
  
  if(theOscMessage.checkAddrPattern("/oscdroid/smsreceive") == true) { 

      phone = theOscMessage.get(0).stringValue(); 
      sms = theOscMessage.get(1).stringValue(); 
      
      println(" values: " + sms); 
    
      return; 
  } 
}
