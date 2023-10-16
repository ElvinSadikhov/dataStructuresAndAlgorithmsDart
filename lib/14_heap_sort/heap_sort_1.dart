import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

List<E> heapsort<E extends Comparable<dynamic>>(List<E> list) {
  final Heap<E> heap = Heap<E>(
    elements: list.toList(),
    priority: Priority.MIN,
  );
  final List<E> sorted = <E>[]; // not in-space, and creates space complexity
  while (!heap.isEmpty) {
    final value = heap.remove();
    sorted.add(value!);
  }
  return sorted;
}

void main() {
  final List<int> sorted = heapsort([6, 12, 2, 26, 8, 18, 21, 9, 5]);
  print(sorted);
}