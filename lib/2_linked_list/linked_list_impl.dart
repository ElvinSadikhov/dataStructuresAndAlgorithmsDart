import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list_iterator.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';

class LinkedListImpl<E> extends Iterable<E> implements LinkedList<E> {
  LinkedListImpl();

  @override
  Node<E>? head;

  @override
  Node<E>? tail;

  @override
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  @override
  void append(E value) {
    if (isEmpty) {
      push(value);
    } else { 
      tail!.next = Node(value: value);
      tail = tail!.next;
    }
  }

  @override
  void insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
    } else {
      node.next = Node(value: value, next: node.next);
    }
  }
  
  @override
  E? pop() {
    final Node<E>? firstNode = head;
    final Node<E>? secondNode = head?.next;
    head = secondNode;
    if (isEmpty) {
      tail = null;
    } 
    firstNode?.next = null;
    return firstNode?.value;
  }

  @override
  E? removeLast() {
    if (head == tail) {
      return pop();
    } else {
      Node<E>? curNode = head;

      while (curNode?.next != tail) {
        curNode = curNode?.next;
      }
      final Node<E>? lastNode = curNode?.next;  // == tail
      tail = curNode;
      tail?.next = null;
      
      return lastNode?.value; // == tail?.value
    }
  }
  
  @override
  E? removeAfter(Node<E> node) {
    final Node<E>? nextNode = node.next;
    node.next = nextNode?.next;
    if (node.next == null) {
      tail = node;
    }
    return nextNode?.value;
  }

  @override
  Node<E>? nodeAt(int index) {
    Node<E>? curNode = head;
    int curIndex = 0;

    while (curIndex < index && curNode != null) {
      curNode = curNode.next;
      curIndex++;
    }
    return curNode;
  }
  
  @override
  bool get isEmpty => head == null;

  @override
  String toString() => isEmpty ? "Empty linked list" : head.toString();
  
  @override
  Iterator<E> get iterator => LinkedListIterator(this);
}

void main() {
  final list1 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);
    
  print("Before1: $list1");

  final Node<int> middleNode = list1.nodeAt(1)!;
  list1.insertAfter(middleNode, 42);

  print("After1:  $list1");

  final list2 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print("Before2: $list2");

  final int? poppedValue = list2.pop();

  print("After2:  $list2");
  print("Popped value2: $poppedValue");

  final list3 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print("Before3: $list3");

  final int? removedValue3 = list3.removeLast();

  print("After3:  $list3");
  print("Removed value3: $removedValue3");

  final list4 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print("Before4: $list4");

  final firstNode = list4.nodeAt(0);
  final removedValue4 = list4.removeAfter(firstNode!);

  print("After4:  $list4");
  print("Removed value4: $removedValue4");

  final list5 = LinkedListImpl<int>()
    ..push(3)
    ..push(2)
    ..push(1);

  print("list5: $list5");

  for (final element in list5) {
    print(element);
  } 
}