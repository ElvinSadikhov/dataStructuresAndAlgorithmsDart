import 'package:data_structures_and_algorithms/0_additions/doubly_linked_list.dart/base/doubly_linked_list.dart';
import 'package:data_structures_and_algorithms/0_additions/doubly_linked_list.dart/base/doubly_linked_list_iterator.dart';
import 'package:data_structures_and_algorithms/3_queue/base/double_node.dart';

class DoublyLinkedListImpl<E>  extends Iterable<E> implements DoublyLinkedList<E> {
  @override
  DoubleNode<E>? head;
  @override
  DoubleNode<E>? tail;
  
  @override
  void append(E value) {
    // convert the value to a node
    final DoubleNode<E> newNode = DoubleNode(value: value, previous: tail);

    // update the pointers at the tail of the list
    if (isEmpty) {
      head = newNode;
    } else {
      tail!.next = newNode;
      // handle lists with only one element
      head?.next ??= newNode;
    }
    tail = newNode;
  }
  
  @override
  void push(E value) {
    // convert the value to a node
    final DoubleNode<E> newNode = DoubleNode(value: value, next: head);

    // update the pointers at the tail of the list
    if (isEmpty) {
      tail = newNode;
    } else {
      head!.previous = newNode;
      // handle lists with only one element
      tail?.previous ??= newNode;
    }
    head = newNode;
  }
  
  @override
  E? removeLast() {
    if (isEmpty)  return null;
    if (tail!.previous == null) return pop();
    final E? value = tail?.value;
    
    tail = tail!.previous;
    tail!.next = null;

    return value;
  }

  @override
  E? pop() {
    if (isEmpty)  return null;
    final E? value = head?.value;
    if (head!.next != null) {
      head!.next!.previous = null;
      head = head!.next;
    } else {
      head = null;
      tail = null;
    }

    head = head?.next;
    head?.previous = null;

    return value;
  }

  @override
  bool get isEmpty => head == null;

  @override
  Iterator<E> get iterator => DoublyLinkedListIterator(this);

  @override
  String toString() => '[${join(', ')}]';
}