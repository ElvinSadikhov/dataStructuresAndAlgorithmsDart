//! Challenge 2: Serialization
// A common task in software development is representing a complex object using another data type. This process is known as serialization and allows custom types to be used in systems that only support a closed set of data types. An example of serialization is JSON.
// Your task is to devise a way to serialize a binary tree into a list, and a way to deserialize the list back into the same binary tree.

// ignore_for_file: unnecessary_this

import 'package:data_structures_and_algorithms/5_binary_tree/base/binary_node.dart';

extension TreeSerializer<T> on BinaryNode<T> {
  List<T?> serialize() {
    final List<T?> list = [];
    this.traversePreOrderNullable((value) => list.add(value));
    return list;
  }

  void traversePreOrderNullable(void Function(T? value) action) {
    action(value);
    leftChild != null
      ? leftChild!.traversePreOrderNullable(action)
      : action(null);
    rightChild != null
      ? rightChild?.traversePreOrderNullable(action)
      : action(null);
  }
}

extension TreeDeserializer<T> on List<T> {
  // gives O(n^2) because of removeAt(0)
  BinaryNode<T>? deserialize() {  
    if (this.isEmpty) return null;
    final T? value = this.removeAt(0);
    if (value == null)  return null;

    final BinaryNode<T> node = BinaryNode(value);
    node.leftChild = this.deserialize();
    node.rightChild = this.deserialize();
    return node;
  }

  // gives O(n)
  BinaryNode<T>? deserializeFaster() => this.reversed.toList().deserializeReversed();

  BinaryNode<T>? deserializeReversed() {  
    if (this.isEmpty) return null;
    final T? value = this.removeLast(); //!
    if (value == null)  return null;

    final BinaryNode<T> node = BinaryNode(value);
    node.leftChild = this.deserializeReversed();
    node.rightChild = this.deserializeReversed();
    return node;
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
  final BinaryNode<int> tree = createBinaryTree();
  final List<int?> list = tree.serialize();
  print(list);

  final BinaryNode<int?>? newTree1 = List<int?>.from(list).deserialize();
  print(newTree1);
  final BinaryNode<int?>? newTree2 = List<int?>.from(list).deserializeFaster();
  print(newTree2);
}