import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/base/node.dart';

class LinkedListIterator<E> implements Iterator<E> {
  final LinkedList<E> _list;
  Node<E>? _curNode;
  bool _firstPass = true;

  LinkedListIterator(LinkedList<E> list): _list = list;
  
  @override
  E get current => _curNode!.value;
  
  @override
  bool moveNext() {
    if (_firstPass) {
      _curNode = _list.head;
      _firstPass = false;
    } else {
      _curNode = _curNode?.next;
    }
    return _curNode != null;
  }
}