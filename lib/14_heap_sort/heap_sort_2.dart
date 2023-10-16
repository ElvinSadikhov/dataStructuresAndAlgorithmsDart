extension HeapSort<E extends Comparable<dynamic>> on List<E> {
  void heapSortInPlace({bool asceding = true}) {
    if (isEmpty) return;

    // heapify list
    final int start = length ~/ 2 - 1;
    for (int i = start; i >= 0; i--) {
      _sift(start: i, end: length, asceding: asceding);
    }

    for (int end = length - 1; end > 0; end--) {
      _swapValues(0, end);
      _sift(start: 0, end: end, asceding: asceding);
    }
  }

  void _sift({required int start, required int end, bool asceding = true}) {
    var parent = start;
    while (true) {
      final int left = _leftChildIndex(parent);
      final int right = _rightChildIndex(parent);
      int chosen = parent;

      if (left < end && (asceding ? this[left].compareTo(this[chosen]) > 0: this[left].compareTo(this[chosen]) < 0)) {
        chosen = left;
      }
      if (right < end && (asceding ? this[right].compareTo(this[chosen]) > 0: this[right].compareTo(this[chosen]) < 0)) {
        chosen = right;
      }
      if (chosen == parent) return;

      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  void _swapValues(int indexA, int indexB) {
    final E temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }

  int _leftChildIndex(int parentIndex) => 2 * parentIndex + 1;
  int _rightChildIndex(int parentIndex) => 2 * parentIndex + 2;
}

void main() {
  final List<int> list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
  print(list);

  list.heapSortInPlace();
  print(list);

  list.heapSortInPlace(asceding: false);
  print(list);
}