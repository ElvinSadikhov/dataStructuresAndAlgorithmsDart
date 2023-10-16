//! Median of three

import 'package:data_structures_and_algorithms/15_quick_sort/quick_sort_lomuto.dart';

int _medianOfThree<T extends Comparable<dynamic>>(List<T> list, int low, int high) {
  final int center = (low + high) ~/ 2;
  if (list[low].compareTo(list[center]) > 0)  list.swap(low, center);
  if (list[low].compareTo(list[high]) > 0)  list.swap(low, high);
  if (list[center].compareTo(list[high]) > 0) list.swap(center, high);
  return center;
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

void quicksortMedian<E extends Comparable<dynamic>>(List<E> list, int low, int high) {
  if (low >= high) return;
var pivotIndex = _medianOfThree(list, low, high); list.swap(pivotIndex, high);
pivotIndex = _partitionLomuto(list, low, high); quicksortLomuto(list, low, pivotIndex - 1); quicksortLomuto(list, pivotIndex + 1, high);
}

void main() {
  final List<int> list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortMedian(list, 0, list.length - 1);
  print(list);
}