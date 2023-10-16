//! Median of three

import 'package:data_structures_and_algorithms/15_quick_sort/quick_sort_lomuto.dart';

class Range {
  final int low;
  final int high;
  const Range(this.low, this.high);
}

Range _partitionDutchFlag<T extends Comparable<dynamic>>(List<T> list, int low, int high) {
  final T pivot = list[high];
  int smallerIndex = low;
  int equalIndex = low;
  int largerIndex = high;

  while (equalIndex <= largerIndex) {
    final T equal = list[equalIndex];
    if (equal.compareTo(pivot) < 0) {
      list.swap(smallerIndex++, equalIndex++);
    } else if (equal.compareTo(pivot) > 0) {
      list.swap(equalIndex, largerIndex--);
    } else {
      equalIndex++;
    }
  }

  return Range(smallerIndex, largerIndex);
}

void quicksortDutchFlag<E extends Comparable<dynamic>>(List<int> list, int low, int high) {
  if (low >= high) return;
  final Range middleRange = _partitionDutchFlag(list, low, high); 
  quicksortDutchFlag(list, low, middleRange.low - 1); 
  quicksortDutchFlag(list, middleRange.high + 1, high);
}

void main() {
  final List<int> list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortDutchFlag(list, 0, list.length - 1);
  print(list);
}