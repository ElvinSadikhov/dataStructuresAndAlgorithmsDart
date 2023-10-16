import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';
import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

class PriorityQueueHeapImpl<E extends Comparable<dynamic>> implements Queue<E> {
  late final Heap<E> _heap;

  PriorityQueueHeapImpl({List<E>? elements, Priority priority = Priority.MAX}) {
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  @override
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }
  
  @override
  E? dequeue() => _heap.remove();

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;

}