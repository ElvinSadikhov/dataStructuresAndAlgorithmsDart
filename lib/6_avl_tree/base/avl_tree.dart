import 'package:data_structures_and_algorithms/6_avl_tree/base/avl_node.dart';

abstract class AvlTree<E extends Comparable<dynamic>> {
  AvlNode<E>? root;

  void insert(E value);
  void remove(E value);
  bool contains(E value);
  AvlNode<E> leftRotate(AvlNode<E> node);
  AvlNode<E> rightRotate(AvlNode<E> node);
  AvlNode<E> rightLeftRotate(AvlNode<E> node);
  AvlNode<E> leftRightRotate(AvlNode<E> node);
  AvlNode<E> balanced(AvlNode<E> node);

  @override
  String toString() => root.toString();
}