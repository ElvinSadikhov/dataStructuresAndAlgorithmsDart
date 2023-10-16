import 'package:data_structures_and_algorithms/0_additions/binary_trees/traversable_binary_node.dart';

class BinaryNode<T> extends TraversableBinaryNode<T> {
  @override
  T value;
  @override
  BinaryNode<T>? leftChild;
  @override
  BinaryNode<T>? rightChild;
  
  BinaryNode(this.value);

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final String left = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ', 
    );
    final String current = '$root${node.value}\n';
    final String right = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$left$current$right';
  }
}

BinaryNode<int> createBinaryTree() {
  final BinaryNode<int> zero = BinaryNode(0);
  final BinaryNode<int> one = BinaryNode(1);
  final BinaryNode<int> five = BinaryNode(5);
  final BinaryNode<int> seven = BinaryNode(7);
  final BinaryNode<int> eight = BinaryNode(8);
  final BinaryNode<int> nine = BinaryNode(9);
  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;
  return seven;
}

void main() {
  final BinaryNode tree = createBinaryTree();
  print(tree);
  
  print("\ntraverse in-order:");
  tree.traverseInOrder(print);
  
  print("\ntraverse pre-order:");
  tree.traversePreOrder(print);
  
  print("\ntraverse post-order:");
  tree.traversePostOrder(print);
}