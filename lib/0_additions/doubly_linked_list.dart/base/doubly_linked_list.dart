import 'package:data_structures_and_algorithms/3_queue/base/double_node.dart';

abstract class DoublyLinkedList<E> {
  DoubleNode<E>? head;
  DoubleNode<E>? tail;
  bool get isEmpty;
  void append(E value);
  void push(E value);
  E? pop();
  E? removeLast();
}