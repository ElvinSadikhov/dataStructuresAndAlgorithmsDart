class Vertex<T> {
  final int index;
  final T data;

  const Vertex({
    required this.index,
    required this.data,
  });
  
  @override
  String toString() => data.toString();
}