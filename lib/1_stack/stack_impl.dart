import 'package:data_structures_and_algorithms/1_stack/base/stack.dart';

class StackImpl<E> implements Stack<E> {
  final List<E> _storage;

  StackImpl(): _storage = <E>[];
  StackImpl.of(Iterable<E> iterable): _storage = List<E>.of(iterable);
  
  @override
  void push(E element) { 
    _storage.add(element);
  }

  @override
  E pop() => _storage.removeLast();

  @override 
  E get peek => _storage.last;

  @override
  bool get isEmpty => _storage.isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
      '${_storage.reversed.join('\n')}'
      '\n-----------';
  }
}