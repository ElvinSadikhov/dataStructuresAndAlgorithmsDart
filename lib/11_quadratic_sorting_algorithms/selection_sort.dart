import 'package:data_structures_and_algorithms/11_quadratic_sorting_algorithms/base/swappable_list.dart';

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int i = 0; i < list.length; i++) {
    int smallestIndex = i;
    for (int j = i; j < list.length; j++) {
      if (list[j].compareTo(list[smallestIndex]) < 0) {
        smallestIndex = j;
      }
    }
    list.swap(smallestIndex, i);
  }
}

void main() {
  final List<int> list = [9, 4, 10, 3];
  print('Original: $list');

  selectionSort(list);
  print('Bubble sorted: $list');
}