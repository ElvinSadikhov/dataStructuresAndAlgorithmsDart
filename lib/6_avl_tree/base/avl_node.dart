import 'package:data_structures_and_algorithms/0_additions/binary_trees/traversable_binary_node.dart';

class AvlNode<T extends Comparable<dynamic>> extends TraversableBinaryNode<T> {
  @override
  T value;
  @override
  AvlNode<T>? leftChild;
  @override
  AvlNode<T>? rightChild;
  
  int height = 0; // the distance to the farest leaf (0 if leaf itself)

  AvlNode(this.value);

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    AvlNode<T>? node, [
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

  int get balanceFactor => leftHeight - rightHeight;
  int get leftHeight => leftChild?.height ?? -1;
  int get rightHeight => rightChild?.height ?? -1;
}