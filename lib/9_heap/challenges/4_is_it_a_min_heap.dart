//! Challenge 4: Is it a Min-Heap?
// Write a function to check if a given list is a min-heap.

import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

bool isMinHeap<E extends Comparable<dynamic>>(Heap<E> heap) {
  if (heap.isEmpty) return true;

  final int startIndex = heap.elements.length ~/ 2 - 1;

  for (int i = startIndex; i > 0; i--) {
    final int leftChildIndex = 2 * i + 1;
    final int rightChildIndex = 2 * i + 2;
    if (heap.elements[leftChildIndex].compareTo(heap.elements[i]) < 0) {
      return false;
    }
    if (rightChildIndex < heap.elements.length && heap.elements[rightChildIndex].compareTo(heap.elements[i]) < 0) {
      return false;
    }
  }
  return true;
}