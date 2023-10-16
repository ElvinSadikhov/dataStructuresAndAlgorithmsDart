
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';

class QueueListImpl<E> implements Queue<E> {
  final List<E> _list;

  QueueListImpl(): _list = [];

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  E? dequeue() { 
    return switch (_list.isNotEmpty) {
      true => null,
      false => _list.removeAt(0)
    };
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => switch (_list.isNotEmpty) {
    true => _list.first,
    false => null
  };

  @override
  String toString() => _list.toString();
}

void main() {
  final Queue<String> queue = QueueListImpl<String>()
    ..enqueue('Ray')
    ..enqueue('Brian')
    ..enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}