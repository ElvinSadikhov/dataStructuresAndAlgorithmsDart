abstract class Stack<E> {
  Stack();
  Stack.of(Iterable<E> iterable);

  void push(E element);
  E pop();

  E get peek;
  bool get isEmpty;
}