import java.util.*; //<>// //<>//
import processing.sound.*;

ArrayList<Integer> test = new ArrayList<Integer>();

ArrayVisualizer visualizer;

SqrOsc osci;

boolean wait = true;

int targetFrameRate = 60;

void setup() {
  size(640, 480);
  frameRate(targetFrameRate);
  background(0);
  noStroke();

  genRandomList(test, 100, 100, 400); //<>//

  osci = new SqrOsc(this);
  osci.amp(0); //caca in begginging
  osci.play();
  
  visualizer = new ArrayVisualizer(0, 0, width, height, test, osci);
  visualizer.withAlgorithm(new SelectionSort());
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
  
  visualizer.draw();
  
  text("FPS: " + round(frameRate) + " (" + targetFrameRate + ")", 0, 10);
}

void mouseWheel(MouseEvent event){
  targetFrameRate -= event.getCount()*2;
  if (targetFrameRate < 1) targetFrameRate = 1;
  frameRate(targetFrameRate);
}
