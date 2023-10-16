//! Challenge 1: Find the Nth Smallest Integer
// Write a function to find the nth smallest integer in an unsorted list. For example, given the following list:

import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

int? findNthSmallestInteger(List<int> list, int n) {
  if (n <= 0 || n > list.length)  return null;
  if (n == list.length) {
    final Heap maxHeap = Heap<int>(elements: list);
    return maxHeap.remove() as int;
  }
  final Heap minHeap = Heap<int>(elements: list, priority: Priority.MIN);

  late int value;
  for (int i = 0; i < n; i++) {
    value = minHeap.remove() as int;
  }

  return value;
}

void main() {
  final int? value = findNthSmallestInteger([3, 10, 18, 5, 21, 100], 3);
  print(value);
}