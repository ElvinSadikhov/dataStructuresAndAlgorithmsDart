//! Challenge 1: Height of a Tree
// Given a binary tree, find the height of the tree. The height of the binary tree is determined by the distance between the root and the furthest leaf. The height of a binary tree with a single node is zero since the single node is both the root and the furthest leaf.

import 'dart:math';

import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_node.dart';

extension HeightDeterminer<T> on BinaryNode<T> {
  int get height {
    int leftHeight = leftChild?.height ?? 0;
    int rightHeight = rightChild?.height ?? 0;
    return 1 + max(leftHeight, rightHeight);
  }
}

BinaryNode<int> createBinaryTree() {
  final BinaryNode<int> zero = BinaryNode(0);
  final BinaryNode<int> one = BinaryNode(1);
  final BinaryNode<int> five = BinaryNode(5);
  final BinaryNode<int> seven = BinaryNode(7);
  final BinaryNode<int> eight = BinaryNode(8);
  final BinaryNode<int> nine = BinaryNode(9);
  final BinaryNode<int> ten = BinaryNode(10);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  five.rightChild = ten;
  return seven;
}

void main() {
  final BinaryNode tree = createBinaryTree();
  print(tree.height);
}