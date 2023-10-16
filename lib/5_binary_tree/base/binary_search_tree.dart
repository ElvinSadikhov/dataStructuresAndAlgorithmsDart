import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_node.dart';

abstract class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value);
  void remove(E value);
  bool contains(E value);

  @override
  String toString() => root.toString();
}