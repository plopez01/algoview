class ArrayVisualizer {
  int x, y, sizex, sizey;
  
  Algorithm algorithm;
  ArrayList<Integer> array;
  
  int primaryIndex = 0;
  int secondaryIndex = -1;
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
    algorithm.setup(this, osci);
  }
  
  // Getters
  int getAtPrimary() {
    return getAtPrimary(0);
  }
  
  int getAtPrimary(int offset) {
    return array.get(primaryIndex + offset);
  }
  
  int getAtSecondary() {
    return getAtSecondary(0);
  }
  
  int getAtSecondary(int offset) {
    return array.get(secondaryIndex + offset);
  }
  
  int getArraySize() {
    return array.size();
  }
  
  // Setters
  void setAtPrimary(int value) {
    setAtPrimary(value, 0);
  }
  
  void setAtPrimary(int value, int offset) {
    array.set(primaryIndex + offset, value);
  }
  
  void setAtSecondary(int value) {
    setAtSecondary(value, 0);
  }
  
  void setAtSecondary(int value, int offset) {
    array.set(secondaryIndex + offset, value);
  }
  
  void swapElements(int indexA, int indexB) {
    int a = array.get(indexA); // Save arr[A]
    array.set(indexA, array.get(indexB)); // Set arr[A] = b
    array.set(indexB, a);
  }

  void stop(){
    primaryIndex = 0;
    secondaryIndex = -1;
    mode = 1;
    algorithm = null;
  }

  void draw() {
    // Run algo
    if (algorithm != null) algorithm.iterate();
    
    // End check
    if (mode == 1 && primaryIndex < array.size()){
      osci.freq(array.get(primaryIndex));
      if (++primaryIndex == array.size()) {
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
        if (i == primaryIndex) fill(255, 0, 0);
        else if (i == secondaryIndex) fill(0, 0, 255);
        else fill(255);
      } else if (mode >= 1) {
        // Algorithm end pass mode
        if (i <= primaryIndex) fill(0, 255, 0);
        else fill(255);
      }
      rect(xOffset, height, barWidth, -barHeight); //<>//
    }
    
    if (algorithm != null) algorithm.printInfo();
  }
}
