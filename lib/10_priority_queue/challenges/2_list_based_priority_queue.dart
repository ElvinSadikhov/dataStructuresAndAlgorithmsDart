//! Challenge 2: List-Based Priority Queue
// You’ve learned how to construct a priority queue by implementing the Queue interface with an internal heap data structure. Now your challenge is to do it again, but this time with a List.

import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';

enum Priority { 
  MAX, 
  MIN 
}

class PriorityQueueListImpl<E extends Comparable<dynamic>> implements Queue<E> {
  late final List<E> _elements;
  final Priority priority;

  PriorityQueueListImpl({List<E>? elements, this.priority = Priority.MAX}) {
    _elements = elements ?? [];
    _elements.sort((a, b) => _compareByPriority(a, b));
  }

  @override
  bool enqueue(E element) {
    for (int i = 0; i < _elements.length; i++) {
      if (_compareByPriority(element, _elements[i]) < 0) {  // finds first place where it has lower priority than current element
        _elements.insert(i, element);
        return true;
      }
    }
    _elements.add(element);
    return true;
  }
  
  @override
  E? dequeue() => switch (_elements.isEmpty) {
    true => null,
    false => _elements.removeLast(),
  };


  int _compareByPriority(E a, E b) => switch (priority) {
    Priority.MAX => a.compareTo(b),
    Priority.MIN => b.compareTo(a),
  };

  @override
  String toString() => _elements.toString();

  @override
  bool get isEmpty => _elements.isEmpty;
  @override
  E? get peek => _elements.isNotEmpty ? _elements.last : null;

}

void main() {
  final Queue priorityQueue = PriorityQueueListImpl(elements: [1, 12, 3, 4, 1, 6, 8, 7]);
  print(priorityQueue);

  priorityQueue
    ..enqueue(5)
    ..enqueue(0)
    ..enqueue(10);
  print(priorityQueue);
  
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue());
  }
}