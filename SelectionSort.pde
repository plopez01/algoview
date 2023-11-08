class SelectionSort implements Algorithm {
  int minVal;
  int minPos;
  int comparisons = 0;
  
  ArrayVisualizer v;
  SqrOsc osci;
  Pointer primary = new Pointer(0, color(255, 0, 0));
  Pointer secondary = new Pointer(1, color(0, 0, 255));
  Pointer minValPtr = new Pointer(-1, color(0, 138, 255));
  
  void setup(ArrayVisualizer v, SqrOsc osci) {
    this.v = v;
    this.osci = osci;
    
    v.addPointer(primary);
    v.addPointer(secondary);
    v.addPointer(minValPtr);
    
    secondary.index = primary.index;
    minVal = v.getAtPointer(0);
    minPos = primary.index;
  }
  
  void iterate() {
    if (primary.index >= v.getArraySize() - 1) {
      v.stop();
      return;
    }
    
    comparisons += 3;
    
    if (secondary.index < v.getArraySize()) {
      
      // Search for smallest value
      int secondaryVal = v.getAtPointer(1);
      osci.freq(secondaryVal);
      
      if (secondaryVal < minVal) {
        minVal = secondaryVal;
        minPos = secondary.index;
        minValPtr.index = minPos;
      }
      
      secondary.index++;
    } else {
      // Swap elements
      osci.freq(v.getAtPointer(0));
      v.swapElements(primary.index, minPos);
      
      primary.index++;
      
      // Set new min value and advance secondary to save one comparison with ouselves
      secondary.index = primary.index;
      minVal = v.getAtPointer(1);
      minPos = secondary.index;
      
      secondary.index++;
    }
  }
  
  void printInfo() {
    text("Remaining Elements: " + str(v.getArraySize() - primary.index), 0, 20);
    text("Comparisons: " + str(comparisons), 0, 30);
  }
}
