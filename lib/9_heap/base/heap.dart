enum Priority { 
  MAX, 
  MIN 
}

class Heap<E extends Comparable<dynamic>> {
  late final List<E> elements;
  final Priority priority;
  
  Heap({List<E>? elements, this.priority = Priority.MAX}) {
    this.elements = elements ?? [];
    buildHeap();
  }
  
  void buildHeap() {
    if (elements.isEmpty) return;
    final int startIndex = elements.length ~/ 2 - 1;  // we skip the last half as they are all leafs, and there is no need to shift them down
    for (int i = startIndex; i >= 0; i--) {
      _shiftDown(i);
    }
  }

  void insert(E value) {
    elements.add(value);
    _shiftUp(elements.length - 1);
  }

  E? remove() { // removes root
    if (isEmpty)  return null;

    _swapValues(0, elements.length - 1);
    final E removedValue = elements.removeLast();
    _shiftDown(0);
    return removedValue;
  }

  E? removeAt(int index) {
    if (index < 0 || index >= elements.length)  return null;

    if (index == 0) return remove();
    if (index == elements.length - 1) return elements.removeLast();
    
    _swapValues(index, elements.length - 1);
    final E removedValue = elements.removeLast();
    _shiftUp(index);
    _shiftDown(index);

    return removedValue;
  }

  int indexOf(E value, {int index = 0}) {
    if (index >= elements.length) return -1;

    // if the value is bigger than current node, there is no point in going down through heap
    if (_firstHasHigherPriority(value, elements[index]))  return -1;

    if (value == elements[index]) return index;

    final int leftIndex = indexOf(value, index: _leftChildIndex(index));
    return leftIndex != -1 ? leftIndex : indexOf(value, index: _rightChildIndex(index));
  }

  void _shiftUp(int index) {
    int childIndex = index;
    int parentIndex = _parentIndex(childIndex);
    while (childIndex > 0 && childIndex == _higherPriority(childIndex, parentIndex)) {
      _swapValues(childIndex, parentIndex);
      childIndex = parentIndex;
      parentIndex = _parentIndex(childIndex);
    } 
  }

  void _shiftDown(int index) {
    int parentIndex = index;

    while (true) {
      final int leftChildIndex = _leftChildIndex(parentIndex);
      final int rightChildIndex = _rightChildIndex(parentIndex);

      // find the highest priority between parent, left and right children
      int chosenIndex = _higherPriority(leftChildIndex, parentIndex);
      chosenIndex = _higherPriority(rightChildIndex, chosenIndex);

      if (chosenIndex == parentIndex) return;
      _swapValues(parentIndex, chosenIndex);
      parentIndex = chosenIndex;
    }
  }
  
  void _swapValues(int indexA, int indexB) {
    final E temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  bool _firstHasHigherPriority(E valueA, E valueB) {
    if (priority == Priority.MAX) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final E valueA = elements[indexA];
    final E valueB = elements[indexB];
    final bool isFirst = _firstHasHigherPriority(valueA, valueB);
    return isFirst ? indexA : indexB;
  }

  int _leftChildIndex(int parentIndex) => 2 * parentIndex + 1;
  int _rightChildIndex(int parentIndex) => 2 * parentIndex + 2;
  int _parentIndex(int childIndex) => (childIndex - 1) ~/ 2;

  @override
  String toString() => elements.toString();

  bool get isEmpty => elements.isEmpty;
  int get size => elements.length;
  E? get peek => isEmpty ? null : elements.first;
}

void main() {
  final Heap<int> heap = Heap<int>()
    ..insert(8)
    ..insert(6)
    ..insert(5)
    ..insert(4)
    ..insert(3)
    ..insert(2)
    ..insert(1);
  print(heap);

  heap.insert(7);
  print(heap);

  final int? root = heap.remove();
  print(root);
  print(heap);


  heap.removeAt(1);
  print(heap);

  final int index = heap.indexOf(7);
  print(index);

  final Heap heap2 = Heap(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(heap2);
  while (!heap2.isEmpty) {
    print(heap2.remove());
  }

  final Heap heap3 = Heap(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
    priority: Priority.MIN,
  );
  print(heap3);
  while (!heap3.isEmpty) {
    print(heap3.remove());
  }
}