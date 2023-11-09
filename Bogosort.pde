class BogoSort implements Algorithm {
  ArrayVisualizer v;
  SqrOsc osc;  
  
  int etaFact;
  float eta;
  long startTime = 0;
  boolean started = false;
  
  Pointer primary = new Pointer(0, color(255, 0, 0));
  void setup(ArrayVisualizer v, SqrOsc osc) {
    this.v = v;
    this.osc = osc;
    
    v.addPointer(primary);
    etaFact = fact(v.getArraySize());
    eta = calculateEta();
    startTime = millis();
  }
  
  // We should count how many possibilities we tried to get the eta to update with frameRate changes, also we aren't accounting for repeated tries.
  float calculateEta(){
    return etaFact / (frameRate - v.getArraySize()/2);
  }
  
  void iterate() {
    // TODO visualize shuffle and maybe extend interface
    if (!started){
      started = true;
      startTime = millis();
    }
    
    boolean sorted = true;
    eta = calculateEta();
    if (primary.index < v.getArraySize() - 1){
      if (v.getAtPointer(primary) > v.getAtPointer(primary, 1)){
        sorted = false;
        Collections.shuffle(v.array); // This hould be illegal
        primary.index = 0;
        return;
      }
      primary.index++;
    } else v.stop();
  }
  
  void printInfo() {
    text("Estimated time: " + (round(eta) - (millis() - startTime)/1000) + "s (" + (round(eta/60) - (millis() - startTime)/60000) + "m)", 0, 20);
  }
}
