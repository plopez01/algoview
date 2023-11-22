class ArrayVisualizer { //<>//
  int x, y, sizex, sizey;

  Algorithm algorithm;
  List<Integer> array;

  ArrayList<Pointer> pointers = new ArrayList<>();

  int mode = 0;
  int maxArrVal;
  int minArrVal;

  float barWidthPercentage = 0.9;

  SqrOsc osci;
  Pointer internalPtr = new Pointer(0, color(0, 255, 0));
  ArrayVisualizer(int x, int y, int sizex, int sizey, List<Integer> array, SqrOsc osci) {
    this.x = x;
    this.y = y;
    this.sizex = sizex;
    this.sizey = sizey;
    this.array = array;
    this.osci = osci;

    // Me when optimize to one function call WHEN
    maxArrVal = Collections.max(array);
    minArrVal = Collections.min(array);
  }


  // <<<<PUBLIC API>>>>
  void withAlgorithm(Algorithm algorithm) {
    this.algorithm = algorithm;
    algorithm.setup(this, osci);
  }

  // Getters
  int getAtPointer(Pointer pointer) {
    return getAtPointer(pointer, 0);
  }

  int getAtPointer(Pointer pointer, int offset) {
    return array.get(pointer.index + offset);
  }

  int getArraySize() {
    return array.size();
  }

  // Setters
  int setAtPointer(Pointer pointer, int value) {
    return setAtPointer(pointer, value, 0);
  }

  int setAtPointer(Pointer pointer, int value, int offset) {
    return array.set(pointer.index + offset, value);
  }

  void addPointer(Pointer pointer) {
    pointers.add(pointer);
  }

  void swapElements(Pointer a, Pointer b) {
    int aux = array.get(a.index); // Save arr[A]
    array.set(a.index, array.get(b.index)); // Set arr[A] = b
    array.set(b.index, aux);
  }

  void stop() {
    pointers.clear();
    pointers.add(internalPtr);
    mode = 1;
    algorithm = null;
  }

  void runAlgorithm(){
    // Run algo
    if (algorithm != null) algorithm.iterate();
  }

  void draw() {
    // End check
    if (mode == 1 && internalPtr.index < array.size()) {
      osci.freq(array.get(internalPtr.index));
      if (++internalPtr.index == array.size()) {
        delay(300);
        osci.stop();
      }
    }

    // Drawing
    for (int i = 0; i < array.size(); i++) {
      float barWidth = (float)sizex / array.size() * barWidthPercentage;
      float xOffset = i * (float)sizex / array.size();
      float barHeight = map(array.get(i), minArrVal, maxArrVal, 0, sizey);

      if (mode == 0) {
        boolean found = false;

        for (Pointer pointer : pointers) {
          if (i == pointer.index) {
            fill(pointer.c);
            found = true;
            break;
          }
        }

        if (!found) fill(255);
      } else if (mode >= 1) {
        // Algorithm end pass mode
        if (i <= internalPtr.index) fill(0, 255, 0);
        else fill(255);
      }
      rect(xOffset, height, barWidth, -barHeight);
    }

    if (algorithm != null) algorithm.printInfo();
  }
}
