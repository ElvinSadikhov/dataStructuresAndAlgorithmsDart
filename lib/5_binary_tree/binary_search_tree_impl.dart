import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_node.dart';
import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_search_tree.dart';

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}

class BinarySearchTreeImpl<E extends Comparable<dynamic>> implements BinarySearchTree<E> {
  BinaryNode<E>? root;

  @override
  void insert(E value) {
    root = _insertAt(root, value);
  }

  @override
  void remove(E value) {
    root = _remove(root, value);
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
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
    return node;
  }

  @override
  bool contains(E value) {
    return _optimizedContains(value);
  }

  bool _optimizedContains(value) {
    if (root == null) return false;
    
    BinaryNode<E>? current = root;

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

  bool _simpleContains(value) {
    if (root == null) return false;
    
    bool isFound = false;
    root!.traverseInOrder((otherValue) {
      if (otherValue == value) {
        isFound = true;
      }
    });
    return isFound;
  }

  BinaryNode<E>? _insertAt(BinaryNode<E>? node, E value) {
    if (node == null) return BinaryNode(value);

    switch (value.compareTo(node.value) < 0) {
      case true:
        node.leftChild = _insertAt(node.leftChild, value);
        break;
      case false:
        node.rightChild = _insertAt(node.rightChild, value);
        break;
    }

    return node;
  }

  @override
  String toString() => root.toString();
}

BinarySearchTree<int> buildExampleTree() {
  final BinarySearchTree<int> tree = BinarySearchTreeImpl<int>()
    ..insert(3)
    ..insert(1)
    ..insert(4)
    ..insert(0)
    ..insert(2)
    ..insert(5);
  return tree;
}

void main() {
  // final BinarySearchTree tree = BinarySearchTreeImpl<int>();
  // for (var i = 0; i < 5; i++) {
  //   tree.insert(i);
  // }
  final BinarySearchTree tree = buildExampleTree();
  print(tree);

  if (tree.contains(5)) {
    print("Found 5!");
  } else {
    print("Couldn’t find 5");
  }

  print('Tree before removal:');
  print(tree);
  tree.remove(3);
  print('Tree after removing root:');
  print(tree);
}