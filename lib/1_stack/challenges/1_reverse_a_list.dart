//! Challenge 1: Reverse a List
// Create a function that prints the contents of a list in reverse order.

import 'package:data_structures_and_algorithms/1_stack/base/stack.dart';
import 'package:data_structures_and_algorithms/1_stack/stack_impl.dart';

List<E> reverseList<E>(List<E> list) {
  final Stack<E> stack = StackImpl<E>.of(list);
  final List<E> reversedList = [];
  while (!stack.isEmpty) {
    reversedList.add(stack.pop());
  }
  return reversedList;
}

void main() {
  final List<int> origList = List.generate(10, (index) => index);
  final List<int> reversedList = reverseList(origList);
  print("$origList -> origList");
  print("$reversedList -> reversedList");
}