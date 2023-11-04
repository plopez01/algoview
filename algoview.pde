import java.util.*; //<>// //<>//
import processing.sound.*;

ArrayList<Integer> test = new ArrayList<Integer>();

ArrayVisualizer visualizer;

SqrOsc osci;

boolean wait = true;

void setup() {
  size(640, 480);
  frameRate(60);
  background(0);
  noStroke();

  genRandomList(test, 100, 100, 400); //<>//

  osci = new SqrOsc(this);
  osci.amp(0); //caca in begginging
  osci.play();
  
  visualizer = new ArrayVisualizer(0, 0, width, height, test, osci);
  visualizer.withAlgorithm(new BubbleSort());
  visualizer.draw();
}

void draw() {
  if (wait) {
      delay(1000);
      osci.amp(0.3);
      wait = false;
  }
  background(0);
  
  visualizer.draw();
  
  text("FPS: " + round(frameRate), 0, 10);
}
