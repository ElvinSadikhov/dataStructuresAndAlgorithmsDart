class DoubleNode<T> {
  DoubleNode({required this.value, this.next, this.previous});

  T value;
  DoubleNode<T>? next;
  DoubleNode<T>? previous;
  
  @override
  String toString() {
    return '$value';
  }
}