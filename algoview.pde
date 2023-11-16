import java.util.*; //<>// //<>//
import processing.sound.*;

List<Integer> test;

ArrayVisualizer visualizer;

SqrOsc osci;

boolean wait = true;

int targetFrameRate = 60;

void setup() {
  size(640, 480);
  frameRate(targetFrameRate);
  background(0);
  noStroke();
  test = genRandomList(7, 100, 400);

  osci = new SqrOsc(this);
  osci.amp(0); //caca in begginging
  osci.play();
  
  visualizer = new ArrayVisualizer(0, 0, width, height, test, osci);
  visualizer.withAlgorithm(new BogoSort());
  visualizer.draw();
  
  String startText = "PRESS ANY KEY TO START";
  text(startText, 0, 10);
}

void draw() {
  if (wait) {
      if (!keyPressed) return;
      osci.amp(0.05);
      wait = false;
  }
  background(0);
  
  visualizer.runAlgorithm();
  visualizer.draw();
  
  text("FPS: " + round(frameRate) + " (" + targetFrameRate + ")", 0, 10);
}

void mouseWheel(MouseEvent event){
  targetFrameRate -= event.getCount()*2;
  if (targetFrameRate < 1) targetFrameRate = 1;
  frameRate(targetFrameRate);
}
