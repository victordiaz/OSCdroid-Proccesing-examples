/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;



void setup() {
  size(400,400);
  frameRate(25);
  
  noStroke(); 
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12002); 
  
  
  myRemoteLocation = new NetAddress("192.168.251.107", 12001); 
  
 
  
} 

void draw() {

  int r = 125; 
  int g = (int)map(mouseX, 0 , width, 0, 255); 
  int b = (int)map(mouseY, 0, height, 0, 255); 
  fill(r, g, b); 
  rect(0, 0, width, height); 
  
   /* create a new osc message object */
  OscMessage myMessage = new OscMessage("/oscdroid/setbgcolor"); 
  
  myMessage.add(r); /* add an int to the osc message */ 
  myMessage.add(g); /* add an int to the osc message */ 
  myMessage.add(b); /* add an int to the osc message */ 
  //myMessage.add("2.mp3"); /* add an int to the osc message */ 
  
   /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 

} 

