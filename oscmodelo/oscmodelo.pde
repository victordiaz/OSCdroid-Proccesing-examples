/* 
 * OSCdroid multitouch example 
 * Victor Diaz 
 * 
 */ 

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float[] slider = new float[10];

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12002); 
  
  
  myRemoteLocation = new NetAddress("192.168.1.4", 12001); 
  
    /* create a new osc message object */
  OscMessage myMessage = new OscMessage("/smssend"); 
  
  myMessage.add("645865008"); /* add an int to the osc message */ 
  myMessage.add("hola"); /* add a float to the osc message */ 
  
}

void draw() {
  background((int)slider[1]);  
  
  
} 


void mousePressed() {
  /* create a new osc message object */
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(mouseX); /* add an int to the osc message */ 
  myMessage.add(12.34); /* add a float to the osc message */ 
  myMessage.add("some text"); /* add a string to the osc message */
  

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}


void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  
  if(theOscMessage.checkAddrPattern("/slider1")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("i")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      int firstValue = theOscMessage.get(0).intValue();  
      //float secondValue = theOscMessage.get(1).floatValue();
      //String thirdValue = theOscMessage.get(2).stringValue();
      //print("### received an osc message /test with typetag ifs.");
      //println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
      println(" values: "+firstValue);
      return;
    }  
  } 
  
  if(theOscMessage.checkAddrPattern("/test")==true) 
    slider[1] = theOscMessage.get(0).floatValue();
    
  
  println("timetag: "+theOscMessage.timetag());
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(theOscMessage.get(0).floatValue());

}
