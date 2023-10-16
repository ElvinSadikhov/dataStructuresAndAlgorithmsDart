abstract class RingBuffer<E> {
  RingBuffer(int length);

  void write(E element);
  E? read();

  bool get isFull;
  bool get isEmpty;
  E? get peek;
}