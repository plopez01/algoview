class SelectionSort implements Algorithm {
  int minVal;
  int minPos;
  int comparisons = 0;
  
  
  ArrayVisualizer v;
  SqrOsc osci;
  void setup(ArrayVisualizer v, SqrOsc osci) {
    this.v = v;
    this.osci = osci;
    
    v.secondaryIndex = v.primaryIndex;
    minVal = v.getAtPrimary();
    minPos = v.primaryIndex;
  }
  
  void iterate() {
    if (v.primaryIndex >= v.getArraySize() - 1) {
      v.stop();
      return;
    }
    
    comparisons += 3;
    
    if (v.secondaryIndex < v.getArraySize()) {
      
      // Search for smallest value
      int secondaryVal = v.getAtSecondary();
      osci.freq(secondaryVal);
      
      if (secondaryVal < minVal) {
        minVal = secondaryVal;
        minPos = v.secondaryIndex;
      }
      
      v.secondaryIndex++;
    } else {
      // Swap elements
      osci.freq(v.getAtPrimary());
      v.swapElements(v.primaryIndex, minPos);
      
      v.primaryIndex++;
      
      // Set new min value and advance secondary to save one comparison with ouselves
      v.secondaryIndex = v.primaryIndex;
      minVal = v.getAtSecondary();
      minPos = v.secondaryIndex;
      
      v.secondaryIndex++;
    }
  }
  
  void printInfo() {
    text("Remaining Elements: " + str(v.getArraySize() - v.primaryIndex), 0, 20);
    text("Comparisons: " + str(comparisons), 0, 30);
  }
}
