//! Challenge 4: Double-Ended Queue
// A doubled-ended queue — a.k.a. deque — is, as its name suggests, a queue where elements can be added or removed from the front or back.

import 'package:data_structures_and_algorithms/0_additions/doubly_linked_list.dart/base/doubly_linked_list.dart';
import 'package:data_structures_and_algorithms/0_additions/doubly_linked_list.dart/doubly_linked_list_impl.dart';
import 'package:data_structures_and_algorithms/3_queue/base/deque.dart';
import 'package:data_structures_and_algorithms/3_queue/base/direction.dart';

class DequeImpl<E> implements Deque<E> {
  final DoublyLinkedList _list;

  DequeImpl(): _list = DoublyLinkedListImpl<E>();

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case Direction.FRONT:
        _list.push(element);
        break;
      case Direction.BACK:
        _list.append(element);
        break;
    }
    return true;
  }

  @override
  E? dequeue(Direction from) => switch (from) {
    Direction.FRONT => _list.pop(),
    Direction.BACK => _list.removeLast(),
  };

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) => switch (from) {
    Direction.FRONT => _list.head?.value,
    Direction.BACK => _list.tail?.value,
  };

  @override
  String toString() => _list.toString();
}

void main() {
  final Deque deque = DequeImpl<int>()
    ..enqueue(1, Direction.BACK)
    ..enqueue(2, Direction.BACK)
    ..enqueue(3, Direction.BACK)
    ..enqueue(4, Direction.BACK);
  print(deque);

  deque.enqueue(5, Direction.FRONT);
  print(deque);

  deque
    ..dequeue(Direction.BACK)
    ..dequeue(Direction.BACK)
    ..dequeue(Direction.BACK)
    ..dequeue(Direction.FRONT)
    ..dequeue(Direction.FRONT)
    ..dequeue(Direction.FRONT);
  print(deque);
}