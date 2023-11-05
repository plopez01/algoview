class BubbleSort implements Algorithm {
  int sorted = 0;
  int comparisons = 0;
  
  ArrayVisualizer v;
  SqrOsc osci;
  void setup(ArrayVisualizer v, SqrOsc osci) {
    this.v = v;
    this.osci = osci;
  }

  void iterate() {
    if (sorted == v.getArraySize()) {
      v.stop();
      return;
    }
    
    comparisons += 4;
    
    if (v.primaryIndex + 1 < v.getArraySize() - sorted) {
      osci.freq(v.getAtPrimary());
      int a = v.getAtPrimary();
      int b = v.getAtPrimary(1);
      
      if (a > b) {
        // Swap
        osci.freq(v.getAtPrimary(1));
        v.setAtPrimary(b);
        v.setAtPrimary(a, 1);
      }

      v.primaryIndex++;
    } else {
      v.primaryIndex = 0;
      sorted++;
    }
  }
  
  void printInfo(){
    text("Remaining Elements: " + str(v.getArraySize() - sorted), 0, 20);
    text("Comparisons: " + str(comparisons), 0, 30);
  }
}
