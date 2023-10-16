//! Hoare's algorithm

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  } 
}

int _partitionHoare<T extends Comparable<dynamic>>(List<T> list, int low, int high) {
  final T pivot = list[low];
  int leftIndex = low - 1;
  int rightIndex = high + 1;

  while (true) {

    do {
      leftIndex++;
    } while (list[leftIndex].compareTo(pivot) < 0);
    
    do {
      rightIndex--;
    } while (list[rightIndex].compareTo(pivot) > 0);
    if (leftIndex < rightIndex) {
      list.swap(leftIndex, rightIndex);
    } else {
      return rightIndex;
    }
  }
}


void quicksortHoare<E extends Comparable<dynamic>>(List<E> list, int low, int high) {
  if (low >= high) return;
  final int leftHigh = _partitionHoare(list, low, high); 
  quicksortHoare(list, low, leftHigh); 
  quicksortHoare(list, leftHigh + 1, high);
}

void main() {
  final List<int> list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortHoare(list, 0, list.length - 1);
  print(list);
}