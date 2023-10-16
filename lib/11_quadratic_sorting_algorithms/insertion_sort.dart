import 'package:data_structures_and_algorithms/11_quadratic_sorting_algorithms/base/swappable_list.dart';

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int i = 1; i < list.length; i++) {
    for (int j = i; j > 0; j--) {
      if (list[j].compareTo(list[j - 1]) < 0) {
        list.swap(j, j - 1);
      } else {
        break;
      }
    }
  }
}

void main() {
  final List<int> list = [9, 4, 10, 3];
  print('Original: $list');

  insertionSort(list);
  print('Bubble sorted: $list');
}