import 'package:data_structures_and_algorithms/3_queue/base/direction.dart';

abstract class Deque<E> {
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
  bool get isEmpty;
  E? peek(Direction from);
}