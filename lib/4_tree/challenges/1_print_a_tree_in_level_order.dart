//! Challenge 1: Print a Tree in Level Order
// Print all the values in a tree in order based on their level. Nodes in the same level should be printed on the same line.

// ignore_for_file: file_names

import 'package:data_structures_and_algorithms/3_queue/queue_double_stack_impl.dart';
import 'package:data_structures_and_algorithms/4_tree/base/tree_node.dart';

extension PrettyPrinter<T> on TreeNode<T> { 
  void printByLevel() {
    final StringBuffer buffer = StringBuffer();
    final QueueDoubleStackImpl<TreeNode<T>> queue = QueueDoubleStackImpl<TreeNode<T>>();
    int nodesLeftInCurrentLevel = 0;

    queue.enqueue(this);
    while (!queue.isEmpty) {
      nodesLeftInCurrentLevel = queue.length;

      while (nodesLeftInCurrentLevel > 0) {
        final TreeNode<T>? node = queue.dequeue();
        buffer.write("$node${nodesLeftInCurrentLevel != 1 ? ", " : ""}");
        node?.children.forEach(queue.enqueue);
        nodesLeftInCurrentLevel--;
      }
      buffer.write("\n");
    }
    print(buffer.toString());
  }
}

TreeNode<String> makeBeverageTree() {
  final TreeNode<String> tree = TreeNode<String>('beverages');
  final TreeNode<String> hot = TreeNode<String>('hot');
  final TreeNode<String> cold = TreeNode<String>('cold');
  final TreeNode<String> tea = TreeNode<String>('tea');
  final TreeNode<String> coffee = TreeNode<String>('coffee');
  final TreeNode<String> chocolate = TreeNode<String>('cocoa');
  final TreeNode<String> blackTea = TreeNode<String>('black');
  final TreeNode<String> greenTea = TreeNode<String>('green');
  final TreeNode<String> chaiTea = TreeNode<String>('chai');
  final TreeNode<String> soda = TreeNode<String>('soda');
  final TreeNode<String> milk = TreeNode<String>('milk');
  final TreeNode<String> gingerAle = TreeNode<String>('ginger ale');
  final TreeNode<String> bitterLemon = TreeNode<String>('bitter lemon');

  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}

void main() {
  final TreeNode<String> tree = makeBeverageTree();

  tree.printByLevel();
}