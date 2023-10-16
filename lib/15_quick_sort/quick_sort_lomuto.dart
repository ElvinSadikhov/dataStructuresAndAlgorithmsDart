//! Lomuto's algorithm

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  } 
}

int _partitionLomuto<T extends Comparable<dynamic>>(List<T> list, int low, int high) {
  final T pivot = list[high];

  int pivotIndex = low;
  for (int i = low; i < high; i++) {
    if (list[i].compareTo(pivot) <= 0) {
      list.swap(pivotIndex++, i);
    }
  }
  list.swap(pivotIndex, high);
  return pivotIndex;
}

void quicksortLomuto<E extends Comparable<dynamic>>(List<E> list, int low, int high){
  if (low >= high) return;
  final int pivotIndex = _partitionLomuto(list, low, high); 
  quicksortLomuto(list, low, pivotIndex - 1); 
  quicksortLomuto(list, pivotIndex + 1, high);
}

void main() {
  final List<int> list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortLomuto(list, 0, list.length - 1);
  print(list);
}