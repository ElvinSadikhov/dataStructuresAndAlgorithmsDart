//! Challenge 3: Is it a Subtree?
// Create a method that checks if the current tree contains all the elements of another tree.

import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_search_tree.dart';
import 'package:data_structures_and_algorithms/5_binary_tree/binary_search_tree_impl.dart';

extension SubtreeChecker<E extends Comparable<dynamic>> on BinarySearchTree<E> {
  bool isSubtree(BinarySearchTree<E> tree) {
    if (tree.root == null)  return true;
    if (root == null && tree.root != null)  return false;
    bool isSubtree = true;

    final List<E> list1 = [];
    root!.traverseInOrder((value) => list1.add(value));
    
    tree.root!.traverseInOrder((value) {
      if (!list1.contains(value)) {
        isSubtree = false;
      }
    });

    return isSubtree;
  }
}

void main() {
  final BinarySearchTree<int> tree1 = BinarySearchTreeImpl<int>()
    ..insert(3)
    ..insert(1)
    ..insert(4)
    ..insert(0)
    ..insert(2)
    ..insert(5);
  print(tree1.toString());
  final BinarySearchTree<int> tree2 = BinarySearchTreeImpl<int>()
    // ..insert(9)
    ..insert(0)
    ..insert(2)
    ..insert(5);
  print(tree2.toString());

  final bool isSubtree = tree1.isSubtree(tree2);
  print(isSubtree);
}