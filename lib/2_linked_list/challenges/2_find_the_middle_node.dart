//! Challenge 2: Find the Middle Node
// Create a function that finds the middle node of a linked list. For example:

import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';
import 'package:data_structures_and_algorithms/2_linked_list/linked_list_impl.dart';


// Runner's techniqaaue
E? findTheMiddleNode<E>(LinkedList<E> linkedList) {
  Node<E>? fastRunner = linkedList.head;
  Node<E>? slowRunner = linkedList.head;
  
  while (fastRunner?.next != null) {
    fastRunner = fastRunner?.next?.next;
    slowRunner = slowRunner?.next;
  }
  return slowRunner?.value;
}

void main() {
  final LinkedList<int> linkedList1 = LinkedListImpl<int>()
    ..push(4)
    ..push(3)
    ..push(2)
    ..push(1);
  print("Before: $linkedList1");

  final int? middleNode1 = findTheMiddleNode(linkedList1);
  print(middleNode1);

  final LinkedList<int> linkedList2 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);
  print("Before: $linkedList2");

  final int? middleNode2 = findTheMiddleNode(linkedList2);
  print(middleNode2);
}