//! Challenge 3: Combining Two Heaps
// Write a method that combines two heaps.

import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

extension Merger<E extends Comparable<dynamic>> on Heap<E> {
  void merge(Heap otherHeap) {
    elements.add(otherHeap.elements as E);
    buildHeap();
  }
}