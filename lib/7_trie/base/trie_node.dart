class TrieNode<T> {
  T? key;
  TrieNode<T>? parent;
  Map<T, TrieNode<T>?> children = {};

  TrieNode({this.key, this.parent});
  
  bool isTerminating = false;
}