
import 'package:data_structures_and_algorithms/2_linked_list/base/linked_list.dart';
import 'package:data_structures_and_algorithms/2_linked_list/linked_list_impl.dart';
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';

class QueueLinkedListImpl<E> implements Queue<E> {
  final LinkedList<E> _list;

  QueueLinkedListImpl(): _list = LinkedListImpl();

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  E? dequeue() {
    return _list.pop();
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

void main() {
  final Queue<String> queue = QueueLinkedListImpl<String>()
    ..enqueue('Ray')
    ..enqueue('Brian')
    ..enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);
  
  queue.peek;
  print(queue);
}