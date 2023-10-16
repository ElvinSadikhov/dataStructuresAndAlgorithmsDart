import 'package:data_structures_and_algorithms/0_additions/ring_buffer/base/ring_buffer.dart';

class RingBufferImpl<E> implements RingBuffer<E> {
  final List<E?> _list;
  int _writerIndex = 0;
  int _readerIndex = 0;
  int _actualSize = 0;

  RingBufferImpl(int length): _list = List.filled(length, null, growable: false);

  @override
  void write(E element) {
    if (isFull) throw Exception("Buffer is full");
    _list[_writerIndex] = element;
    _writerIndex = _movePointer(_writerIndex);
    _actualSize++;
  }

  @override
  E? read() {
    if (isEmpty)  return null;
    final E? element = _list[_readerIndex];
    _readerIndex = _movePointer(_readerIndex);
    _actualSize--;
    return element;
  }

  int _movePointer(int index) => switch (index == _list.length - 1) {
    true => 0,
    false => index + 1
  };

  @override
  bool get isFull => _actualSize == _list.length;

  @override
  bool get isEmpty => _actualSize == 0;

  @override
  E? get peek => switch (isEmpty) {
    true => null,
    false => _list[_readerIndex]
  };

  @override
  String toString() {
    final text = StringBuffer();
    text.write("[");
    int index = _readerIndex;
    while (index != _writerIndex) {
      if (index != _readerIndex) {
        text.write(", ");
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write("]");
    return text.toString();
  }
}