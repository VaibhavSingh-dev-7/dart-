int binarySearch(List<int> list, int target) {
  int left = 0;
  int right = list.length - 1;

  while (left <= right) {
    int middle = (left + right) ~/ 2;

    if (list[middle] == target) {
      return middle;
    } else if (list[middle] < target) {
      left = middle + 1;
    } else {
      right = middle - 1;
    }
  }
  return -1;
}

void main() {
  List<int> sortedList = [1, 3, 5, 7, 9, 11];
  int target = 7;
  int index = binarySearch(sortedList, target);
  
  if (index != -1) {
    print("Found $target at index $index.");
  } else {
    print("Target $target not found.");
  }
}
