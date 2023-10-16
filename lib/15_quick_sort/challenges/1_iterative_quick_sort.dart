//! Challenge 1: Iterative Quicksort
// In this chapter, you learned how to implement quicksort recursively. Your challenge here is to implement it iteratively. Choose any partition strategy.

import 'package:data_structures_and_algorithms/1_stack/base/stack.dart';
import 'package:data_structures_and_algorithms/1_stack/stack_impl.dart';

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

void quicksortIterativeLomuto<E extends Comparable<dynamic>>(List<E> list) {
  final Stack indexStack = StackImpl<int>()
    ..push(0)
    ..push(list.length - 1);

  while (!indexStack.isEmpty) {
    final int highIndex = indexStack.pop();
    final  int lowIndex = indexStack.pop();
    final int pivotIndex = _partitionLomuto(list, lowIndex, highIndex);

    if (pivotIndex - 1 > lowIndex) {
      indexStack.push(lowIndex);
      indexStack.push(pivotIndex - 1);
    } 
    if (pivotIndex + 1 < highIndex) {
      indexStack.push(pivotIndex + 1);
      indexStack.push(highIndex);
    }
  }
}

void main() {
  final List<int> list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortIterativeLomuto(list);
  print(list);
}
