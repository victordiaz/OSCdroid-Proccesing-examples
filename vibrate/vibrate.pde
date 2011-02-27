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
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12002); 
  
  

  
}

void draw() {

  
  
  
} 



void mousePressed() { 
  println("hola");  
 
  myRemoteLocation = new NetAddress("192.168.43.1", 12001); 
  
    /* create a new osc message object */
  OscMessage myMessage = new OscMessage("/oscdroid/vibrate"); 
  
  myMessage.add("1000"); /* add an int to the osc message */ 
  
   /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
  
} 

