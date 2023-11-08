class BubbleSort implements Algorithm {
  int sorted = 0;
  int comparisons = 0;
  
  ArrayVisualizer v;
  SqrOsc osci;
  Pointer primary = new Pointer(0, color(255, 0, 0));
  void setup(ArrayVisualizer v, SqrOsc osci) {
    this.v = v;
    this.osci = osci;
    
    v.addPointer(primary);
  }

  void iterate() {
    if (sorted == v.getArraySize()) {
      v.stop();
      return;
    }
    
    comparisons += 4;
    
    if (primary.index + 1 < v.getArraySize() - sorted) {
      osci.freq(v.getAtPointer(0));
      int a = v.getAtPointer(0);
      int b = v.getAtPointer(0, 1);
      
      if (a > b) {
        // Swap
        osci.freq(v.getAtPointer(0, 1));
        v.setAtPointer(0, b);
        v.setAtPointer(0, a, 1);
      }

      primary.index++;
    } else {
      primary.index = 0;
      sorted++;
    }
  }
  
  void printInfo(){
    text("Remaining Elements: " + str(v.getArraySize() - sorted), 0, 20);
    text("Comparisons: " + str(comparisons), 0, 30);
  }
}
