class ArrayVisualizer {
  int x, y, sizex, sizey;
  
  Algorithm algorithm;
  ArrayList<Integer> array;
  
  int index = 0;
  int mode = 0;
  Integer maxArrVal;
  Integer minArrVal;
 
  float barWidthPercentage = 0.9;
  
  SqrOsc osci;
  ArrayVisualizer(int x, int y, int sizex, int sizey, ArrayList<Integer> array, SqrOsc osci) {
    this.x = x;
    this.y = y;
    this.sizex = sizex;
    this.sizey = sizey;
    this.array = array;
    this.osci = osci;
    
    // Me when optimize to one function call WHEN
    maxArrVal = maxArrayListValue(array);
    minArrVal = minArrayListValue(array);
  }
  
  void withAlgorithm(Algorithm algorithm) {
    this.algorithm = algorithm;
    algorithm.setup(array);
  }

  void stop(){
    index = 0;
    mode = 1;
    algorithm = null;
  }

  void draw() {
    // Run algo
    if (algorithm != null) algorithm.iterate(this, osci);
    
    // End check
    if (mode == 1 && index < array.size()){
      osci.freq(array.get(index));
      if (++index == array.size()) {
         delay(300); 
         osci.stop();
      }
    }
    
    // Drawing
    for (int i = 0; i < array.size(); i++) {
      float barWidth = (float)sizex / array.size() * barWidthPercentage;
      float xOffset = i * (float)sizex / array.size();
      float barHeight = map(array.get(i), minArrVal, maxArrVal, 0, sizey);
      
      if (mode == 0){
        if (i == index) fill(255, 0, 0);
        else fill(255);
      } else if (mode >= 1) {
        if (i <= index) fill(0, 255, 0);
        else fill(255);
      }
      rect(xOffset, height, barWidth, -barHeight); //<>//
    }
    
    if (algorithm != null) algorithm.printInfo();
  }
}
