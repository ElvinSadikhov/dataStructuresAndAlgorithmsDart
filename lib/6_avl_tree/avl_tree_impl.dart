import 'package:data_structures_and_algorithms/6_avl_tree/base/avl_node.dart';
import 'package:data_structures_and_algorithms/6_avl_tree/base/avl_tree.dart';
import 'dart:math' as math;

extension _MinFinder<E extends Comparable<dynamic>> on AvlNode<E> {
  AvlNode<E> get min => leftChild?.min ?? this;
}

class AvlTreeImpl<E extends Comparable<dynamic>> implements AvlTree<E> {
  @override
  AvlNode<E>? root;

  @override
  void insert(E value) {
    root = _insertAt(root, value);
  }

  @override
  void remove(E value) {
    root = _remove(root, value);
  }

  @override
  bool contains(E value) {
    return _optimizedContains(value);
  }

  @override
  AvlNode<E> leftRotate(AvlNode<E> node) {  // applied when all 2/3 (left, itself, and right) are on right side
    final AvlNode<E> pivot = node.rightChild!;
    node.rightChild = pivot.leftChild;
    pivot.leftChild = node;

    node.height = 1 +
      math.max(
        node.leftHeight,
        node.rightHeight,
      );
    pivot.height = 1 +
      math.max(
        pivot.leftHeight,
        pivot.rightHeight,
      );
      
    return pivot;
  }

  @override
  AvlNode<E> rightRotate(AvlNode<E> node) { // applied when all 2/3 (left, itself, and right) are on left side
    final AvlNode<E> pivot = node.leftChild!;
    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;

    node.height = 1 +
      math.max(
        node.leftHeight,
        node.rightHeight,
      );
    pivot.height = 1 +
      math.max(
        pivot.leftHeight,
        pivot.rightHeight,
      );
      
    return pivot;
  }

  @override
  AvlNode<E> rightLeftRotate(AvlNode<E> node) { // applied when itself->right->left
    if (node.rightChild == null)  return node;
    node.rightChild = rightRotate(node.rightChild!);
    return leftRotate(node);
  }

  @override
  AvlNode<E> leftRightRotate(AvlNode<E> node) { // applied when itself->left->right
    if (node.leftChild == null)  return node;
    node.leftChild = leftRotate(node.leftChild!);
    return rightRotate(node);
  }

  @override
  AvlNode<E> balanced(AvlNode<E> node) {
    switch (node.balanceFactor) {
      case 2: // left is heavier
        final AvlNode<E>? left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return leftRightRotate(node);
        } else {
          return rightRotate(node);
        }
      case -2:  // left is heavier
        final AvlNode<E>? right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          return rightLeftRotate(node);
        } else {
          return leftRotate(node);
        }
      default:
        return node;
    }
  }

  AvlNode<E> _insertAt(AvlNode<E>? node, E value) {
    if (node == null) {
      return AvlNode(value);
    }
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    final balancedNode = balanced(node);
    balancedNode.height = 1 +
      math.max(
        balancedNode.leftHeight,
        balancedNode.rightHeight,
      );
    return balancedNode;
  }

  AvlNode<E>? _remove(AvlNode<E>? node, E value) {
    if (node == null) return null;

    if (value == node.value) {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
      // set right min value, and remove it from right subtree
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    final AvlNode<E> balancedNode = balanced(node);
    balancedNode.height = 1 +
      math.max(
        balancedNode.leftHeight,
        balancedNode.rightHeight,
      );
    return balancedNode;
  }

  bool _optimizedContains(value) {
    if (root == null) return false;
    
    AvlNode<E>? current = root;

    while (current != null) {
      final int comparisonResult = value.compareTo(current.value);
      if (comparisonResult < 0) {
        current = current.leftChild;
      } else if (comparisonResult > 0) {
        current = current.rightChild;
      } else {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() => root.toString();
}

void main() {
  final AvlTree<int> tree = AvlTreeImpl<int>();
  // for (var i = 0; i < 15; i++) {
  //   tree.insert(i);
  // }
  // print(tree);
  tree.insert(15);
  tree.insert(10);
  tree.insert(16);
  tree.insert(18);
  print(tree);
  tree.remove(10);
  print(tree);
}