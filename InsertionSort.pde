class InsertionSort implements Algorithm {
  
  Pointer primary = new Pointer(0, color(255, 0, 0));
  Pointer secondary = new Pointer(0, color(0, 0, 255));
  Pointer aux = new Pointer(0, color(0, 0, 255));
  ArrayVisualizer v;
  SqrOsc osci;
  void setup(ArrayVisualizer v, SqrOsc osc){
    this.v = v;
    this.osci = osc;
    
    v.addPointer(primary);
    v.addPointer(secondary);
    v.addPointer(aux);
  }
  
  void iterate() {
    if (primary.index >= v.getArraySize()) {
      v.stop();
      return;
    }
    
    aux.index = secondary.index - 1;
   
    if (aux.index >= 0 && v.getAtPointer(secondary) < v.getAtPointer(aux)) {
      osci.freq(v.getAtPointer(aux));
      v.swapElements(secondary, aux);
      secondary.index--;
    }
    
    else {
      primary.index++;
      secondary.index = primary.index;
      
    }
    
  }
  
  void printInfo(){
    text("I eat cheeseburgers sometimes", 0, 30);
    text(str(primary.index), 0, 90);
    text(str(secondary.index), 0, 70);
  }
}
