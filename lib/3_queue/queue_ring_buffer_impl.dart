
import 'package:data_structures_and_algorithms/0_additions/ring_buffer/base/ring_buffer.dart';
import 'package:data_structures_and_algorithms/0_additions/ring_buffer_impl.dart';
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';

class QueueRingBufferImpl<E> implements Queue<E> {
  final RingBuffer<E> _ringBuffer;

  QueueRingBufferImpl(int length): _ringBuffer = RingBufferImpl<E>(length);

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    } else {
      _ringBuffer.write(element);
      return true;
    }
  }

  @override
  E? dequeue() {
    return _ringBuffer.read();
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

void main() {
  final Queue<String> queue = QueueRingBufferImpl<String>(32)
    ..enqueue('Ray')
    ..enqueue('Brian')
    ..enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);
  
  queue.peek;
  print(queue);
}