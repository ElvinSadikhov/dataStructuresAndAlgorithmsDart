//! Challenge 1: Binary Tree or Binary Search Tree?
// Write a function that checks if a binary tree is a binary search tree.

import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_node.dart';

extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {

  bool isBinarySearchTree() {
    return _isBST(this);
  }

  bool _isBST(BinaryNode<E>? tree, {E? min, E? max}) {
    if (tree == null) return true;

    if (min != null && tree.value.compareTo(min) < 0) return false;
    if (max != null && tree.value.compareTo(max) > 0) return false;

    return _isBST(tree.leftChild, min: min, max: tree.value) && _isBST(tree.rightChild, min: tree.value, max: max); 
  }
}