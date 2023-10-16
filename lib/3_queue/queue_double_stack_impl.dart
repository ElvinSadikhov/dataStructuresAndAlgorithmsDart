
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';

class QueueDoubleStackImpl<E> implements Queue<E> {
  late final List<E> _dequeueStack; // left
  late final List<E> _enqueueStack; // right

  QueueDoubleStackImpl() {
    _dequeueStack = <E>[];
    _enqueueStack = <E>[];
  }

  @override
  bool enqueue(E element) {
    _enqueueStack.add(element);
    return true;
  }

  @override
  E? dequeue() {
    if (_dequeueStack.isEmpty) {
      _dequeueStack.addAll(_enqueueStack.reversed);
      _enqueueStack.clear();
    } 
    return switch (_dequeueStack.isEmpty) {
      true => null,
      false => _dequeueStack.removeLast()
    };
  }

  @override
  bool get isEmpty => _dequeueStack.isEmpty && _enqueueStack.isEmpty;

  @override
  E? get peek => switch (_dequeueStack.isEmpty) {
    true => _enqueueStack.first,
    false => _dequeueStack.last
  };

  int get length => _dequeueStack.length + _enqueueStack.length;

  @override
  String toString() {
    final List<E> combinedQueue = [
      ..._dequeueStack.reversed,
      ..._enqueueStack,
    ];
    return '[${combinedQueue.join(', ')}]';
  }
}

void main() {
  final Queue<String> queue = QueueDoubleStackImpl<String>()
    ..enqueue('Ray')
    ..enqueue('Brian')
    ..enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);
  
  queue.peek;
  print(queue);
}