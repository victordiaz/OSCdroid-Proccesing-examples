/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

String textmsg = ""; 

float longitude = 0, latitude = 0, altitude = 0, speed = 0, time = 0; 

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
  text("Text: " + textmsg, 50, 100); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 
  /* check if theOscMessage has the address pattern we are looking for. */ 

  if(theOscMessage.checkAddrPattern("/oscdroid/gps") == true) { 

      longitude = theOscMessage.get(0).floatValue(); 
      latitude = theOscMessage.get(1).floatValue(); 
      altitude = theOscMessage.get(2).floatValue(); 
      speed = theOscMessage.get(3).floatValue(); 
      time = theOscMessage.get(4).floatValue(); 
      //println(" values: " + textmsg); 
      
      println("qq " + longitude + " " + latitude + " " + altitude + " " + speed + " " + time); 
      println(" typetag: "+theOscMessage.typetag()); 
    
      return; 
  } 
  
    
  //println("timetag: "+theOscMessage.timetag());
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag()); 
  
}
