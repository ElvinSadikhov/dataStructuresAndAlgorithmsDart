//! Challenge 2: Equality
// Given two binary trees, how would you test if they are equal or not?

// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:collection/collection.dart';
import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_search_tree.dart';
import 'package:data_structures_and_algorithms/5_binary_tree/binary_search_tree_impl.dart';

extension EqualityChecker<E extends Comparable<dynamic>> on BinarySearchTree<E> {
  bool equals(BinarySearchTree<E> tree) {
    if (root == null || tree.root == null)  return root == null && tree.root == null;

    final List<E> list1 = [];
    root!.traverseInOrder((value) => list1.add(value));
    final List<E> list2 = [];
    tree.root!.traverseInOrder((value) => list2.add(value));

    return ListEquality().equals(list1, list2);
  }
}

BinarySearchTree<int> buildShuffledExampleTree({required bool randomSize}) {
  final int length = randomSize ? 5 + Random().nextInt(5) : 10;
  final List<int> indexes = List.generate(length, (index) => index)..shuffleRange(0, length);
  final List<int> values = List.generate(length, (index) => index);
  final BinarySearchTree<int> tree = BinarySearchTreeImpl<int>();
  
  for (final int index in indexes) {
    tree.insert(values[index]);
  }
  return tree;
}

void main() {
  final BinarySearchTree<int> tree1 = buildShuffledExampleTree(randomSize: false);
  final BinarySearchTree<int> tree2 = buildShuffledExampleTree(randomSize: false);
  print(tree1.toString());
  print(tree2.toString());

  final bool isEqual = tree1.equals(tree2);
  print("isEqual = $isEqual");
}