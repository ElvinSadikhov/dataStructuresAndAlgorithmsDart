import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';

abstract class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  LinkedList();

  void push(E value);

  void append(E value);

  void insertAfter(Node<E> node, E value);

  E? pop();
  
  E? removeLast();
  
  E? removeAfter(Node<E> node);

  Node<E>? nodeAt(int index);

  bool get isEmpty;
}