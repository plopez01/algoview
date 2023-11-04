void genRandomList(ArrayList<Integer> arr, int amount, int min, int max){
  for (int i = 0; i < amount; i++) {
    arr.add(round(random(min, max)));
  }
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
