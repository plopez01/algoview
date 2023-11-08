class ArrayVisualizer { //<>//
  int x, y, sizex, sizey;

  Algorithm algorithm;
  ArrayList<Integer> array;

  ArrayList<Pointer> pointers = new ArrayList<>();

  int mode = 0;
  Integer maxArrVal;
  Integer minArrVal;

  float barWidthPercentage = 0.9;

  SqrOsc osci;
  Pointer internalPtr = new Pointer(0, color(0, 255, 0));
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
  int getAtPointer(int pointer) {
    return getAtPointer(pointer, 0);
  }

  int getAtPointer(int pointer, int offset) {
    return array.get(pointers.get(pointer).index + offset);
  }

  int getArraySize() {
    return array.size();
  }

  // Setters
  int setAtPointer(int pointer, int value) {
    return setAtPointer(pointer, 0, value);
  }

  int setAtPointer(int pointer, int offset, int value) {
    return array.set(pointers.get(pointer).index + offset, value);
  }
  
  void addPointer(Pointer pointer) {
    pointers.add(pointer);
  }

  void swapElements(int indexA, int indexB) {
    int a = array.get(indexA); // Save arr[A]
    array.set(indexA, array.get(indexB)); // Set arr[A] = b
    array.set(indexB, a);
  }

  void stop() {
    pointers.clear();
    pointers.add(internalPtr);
    mode = 1;
    algorithm = null;
  }

  void draw() {
    // Run algo
    if (algorithm != null) algorithm.iterate();

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
        
        if (mode >= 1) {
          // Algorithm end pass mode
          if (i <= internalPtr.index) fill(0, 255, 0);
          else fill(255);
        }
        
        rect(xOffset, height, barWidth, -barHeight);
      }
    }
    
    if (algorithm != null) algorithm.printInfo();
  }
}
