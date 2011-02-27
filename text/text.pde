/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

String textmsg = ""; 


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
  
  //println("timetag: "+theOscMessage.timetag());
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag()); 
  
  if(theOscMessage.checkAddrPattern("/oscdroid/text") == true) { 

      textmsg = theOscMessage.get(0).stringValue(); 
      
      println(" values: " + textmsg); 
    
      return; 
  } 
}
