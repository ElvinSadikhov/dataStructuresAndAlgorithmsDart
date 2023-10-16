
import 'package:data_structures_and_algorithms/0_additions/doubly_linked_list.dart/base/doubly_linked_list.dart';
import 'package:data_structures_and_algorithms/3_queue/base/double_node.dart';

class DoublyLinkedListIterator<E> implements Iterator<E> {
  final DoublyLinkedList<E> _list;
  DoublyLinkedListIterator(DoublyLinkedList<E> list) : _list = list;
  DoubleNode<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}