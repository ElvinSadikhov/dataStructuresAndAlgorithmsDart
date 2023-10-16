import 'package:data_structures_and_algorithms/11_quadratic_sorting_algorithms/base/swappable_list.dart';

void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int end = list.length - 1; end > 0; end--) {
    bool isSwapped = false;
    for (int i = 0; i < end; i++) {
      if (list[i].compareTo(list[i + 1]) > 0) {
        list.swap(i, i + 1);
        isSwapped = true;
      }
    }
    if (!isSwapped) return; // leave if everything is good
  }
}

void main() {
  final List<int> list = [9, 4, 10, 3];
  print('Original: $list');

  bubbleSort(list);
  print('Bubble sorted: $list');
}