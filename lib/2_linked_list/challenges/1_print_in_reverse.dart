//! Challenge 1: Print in Reverse
// Create a function that prints the nodes of a linked list in reverse order. For example:

import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/linked_list_impl.dart';


void printInReverse(LinkedList linkedList) {
  while (!linkedList.isEmpty) {
    print(linkedList.removeLast());
  }
}

void main() {
  final LinkedList<int> linkedList = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print("Before: $linkedList");
  printInReverse(linkedList);
}