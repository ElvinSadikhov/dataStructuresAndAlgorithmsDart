import 'package:data_structures_and_algorithms/3_queue/queue_double_stack_impl.dart';

class TreeNode<T> {
  TreeNode(this.value): _children = [];

  T value;
  final List<TreeNode<T>> _children;
  
  void add(TreeNode<T> child) {
    _children.add(child);
  }

  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final QueueDoubleStackImpl<TreeNode<T>> queue = QueueDoubleStackImpl<TreeNode<T>>();
    performAction(this);
    children.forEach(queue.enqueue);
    TreeNode<T>? node = queue.dequeue();
    while (node != null) {
      performAction(node);
      node.children.forEach(queue.enqueue);
      node = queue.dequeue();
    } 
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;  // will get the last refference. but if we use ??= operator, it will get the first match
      }
    });
    return result;
  }

  List<TreeNode<T>> get children => _children;

  @override
  String toString() => value.toString();
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

  tree.forEachDepthFirst((node) => print(node.value));

  print("\n--------------------------------\n");

  tree.forEachLevelOrder((node) => print(node.value));
  
  print("\n--------------------------------\n");
  final TreeNode<String>? searchResult1 = tree.search('ginger ale');
  print(searchResult1?.value); // ginger ale
  final TreeNode<String>? searchResult2 = tree.search('water');
  print(searchResult2?.value); // null
}