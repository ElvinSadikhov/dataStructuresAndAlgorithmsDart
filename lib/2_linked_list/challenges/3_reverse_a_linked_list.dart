//! Challenge 3: Reverse a Linked List
// Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction. For example:

// ignore_for_file: avoid_init_to_null

import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';
import 'package:data_structures_and_algorithms/2_linked_list/linked_list_impl.dart';


extension ReversableLinkedList on LinkedList {
  void reverseList() {
    tail = head;
    Node? previous = head;
    Node? current = head?.next;
    Node? next = null;
    previous?.next = null;

    while (current != null) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    head = previous;
  }
}

void main() {
  final LinkedList<int> linkedList1 = LinkedListImpl<int>()
    ..push(4)
    ..push(3)
    ..push(2)
    ..push(1);
  print("Before: $linkedList1");

  linkedList1.reverseList();
  print("After: $linkedList1");
}