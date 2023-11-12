import java.util.stream.*;

int fact(int n){
  int val = 1;
  for (int i = 1; i < n; i++){
    val *= (i+1);
  }
  return val;
}

ArrayList<Integer> genRandomList(int amount, int min, int max) {
  Random random = new Random();
  long seed = random.nextLong();
  println("Random seed: " + seed);
  random.setSeed(seed);
  return random
    .ints(min, max, amount)
    .collect(Collectors.toList());
}

Integer maxArrayListValue(ArrayList<Integer> arr){
  if (arr.size() == 0) return 0;
  
  Integer max = arr.get(0);
  for (int i = 1; i < arr.size(); i++) {
    if (arr.get(i) > max) max = arr.get(i);
  }
  
  return max;
}

Integer minArrayListValue(ArrayList<Integer> arr){
  if (arr.size() == 0) return 0;
  
  Integer min = arr.get(0);
  for (int i = 1; i < arr.size(); i++) {
    if (arr.get(i) < min) min = arr.get(i);
  }
  
  return min;
}
