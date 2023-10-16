//! Challenge 4: Remove All Occurrences
// Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the removeAfter method that you implemented earlier. For example:

import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';
import 'package:data_structures_and_algorithms/2_linked_list/linked_list_impl.dart';


extension RemovableLinkedList on LinkedList {
  void removeAllOccurrencesOf(dynamic value) {
    // remove all occurrences at the beggining
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    Node? previous = head;
    Node? current = head?.next;
    while (current != null) {
      // unlinking nodes
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
    // as current == null, previous is tail
    tail = previous;
  }
}

void main() {
  final LinkedList<int> linkedList1 = LinkedListImpl<int>()
    ..push(3)
    ..push(4)
    // ..push(3)
    ..push(2)
    // ..push(3)
    ..push(3);
  print("Before: $linkedList1");

  linkedList1.removeAllOccurrencesOf(3);
  print("After: $linkedList1");
  print("Head: ${linkedList1.head}");
  print("Tail: ${linkedList1.tail}");
}