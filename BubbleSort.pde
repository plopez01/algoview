class BubbleSort implements Algorithm {
  int sorted = 0;
  int comparisons = 0;
  
  ArrayList<Integer> array;
  void setup(ArrayList<Integer> array) {
    this.array = array;
  }

  void iterate(ArrayVisualizer v, SqrOsc osci) {
    if (sorted == array.size()) {
      v.stop();
      return;
    }
    
    comparisons += 4;
    
    if (v.index + 1 < array.size() - sorted) {
      osci.freq(array.get(v.index));
      int a = array.get(v.index);
      int b = array.get(v.index+1);
      if (a > b) {
        // Swap
        osci.freq(array.get(v.index + 1));
        array.set(v.index, b);
        array.set(v.index+1, a);
      }

      v.index++;
    } else {
      v.index = 0;
      sorted++;
    }
  }
  
  void printInfo(){
    text("Remaining Elements: " + str(array.size() - sorted), 0, 20);
    text("Comparisons: " + str(comparisons), 0, 30);
  }
}
