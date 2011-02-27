/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*; 
import netP5.*; 

OscP5 oscP5; 

int pT = 0; 
float xT = 0; 
float yT = 0; 
float sizeT = 0; 

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
  text(""+pT, xT, yT); 
  ellipse(xT, yT, sizeT * 25, sizeT * 25); 
  
  
} 


void oscEvent(OscMessage theOscMessage) { 
  /* check if theOscMessage has the address pattern we are looking for. */ 
  
  println("timetag: "+theOscMessage.timetag());
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag()); 
  
  if(theOscMessage.checkAddrPattern("/oscdroid/multitouch") == true) {

      pT = theOscMessage.get(0).intValue();  
      xT = theOscMessage.get(1).floatValue(); 
      yT = theOscMessage.get(2).floatValue(); 
      sizeT = theOscMessage.get(3).floatValue(); 
      
      println(" values: " + pT + ", " + xT + ", " + yT + "," + sizeT); 
    
      return; 
  } 
}
