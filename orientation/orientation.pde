/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

float x = 0; 
float y = 0; 
float z = 0; 

//circle position 
float cX = 0; 
float cY = 0; 
float cZ = 0; 



void setup() {
  size(500,500); 
  frameRate(25); 
  smooth(); 
  
  x = width / 2; 
  y = height / 2; 
  
  //start osc sever 
  oscP5 = new OscP5(this, 12002); 
  
}

void draw() {
  background(0); 
  
  cX = x; 
  cY = y; 
  cZ = 25; // * Math.abs(z); 
  
  fill(255); 
  ellipse(cX, cY, cZ, cZ); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 
  /* check if theOscMessage has the address pattern we are looking for. */ 
  
  //println("timetag: "+theOscMessage.timetag());
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag()); 
  
  if(theOscMessage.checkAddrPattern("/oscdroid/gps") == true) { 

      //x = theOscMessage.get(0).floatValue(); 
      //y = theOscMessage.get(1).floatValue(); 
      //z = theOscMessage.get(2).floatValue(); 
      
      println(" hola "); 
    
      return; 
  } 
}
