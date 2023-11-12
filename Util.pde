import java.util.stream.*;

int fact(int n){
  int val = 1;
  for (int i = 1; i < n; i++){
    val *= (i+1);
  }
  return val;
}

List<Integer> genRandomList(int amount, int min, int max) {
  Random random = new Random();
  long seed = random.nextLong();
  println("Random seed: " + seed);
  random.setSeed(seed);
  return random
    .ints(min, max, amount)
    .boxed()
    .collect(Collectors.toList());
}
