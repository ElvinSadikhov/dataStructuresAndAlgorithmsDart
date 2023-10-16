import 'package:data_structures_and_algorithms/7_trie/base/trie_node.dart';

class Trie<T extends Iterable<E>, E> {
  final TrieNode<E> root = TrieNode(key: null, parent: null); // always this way

  void insert(T collection) {
    TrieNode<E> current = root;
    for (final E element in collection) {
      current.children[element] ??= TrieNode(
        key: element,
        parent: current,
      );
      current = current.children[element]!;
    }
    current.isTerminating = true;
  }

  bool contains(T collection) {
    TrieNode<E> current = root;
    for (final E element in collection) {
      final TrieNode<E>? child = current.children[element];
      if (child == null)  return false;
      current = child;
    }
    return current.isTerminating;
  }

  void remove(T collection) {
    TrieNode<E> current = root;
    for (final element in collection) {
      final TrieNode<E>? child = current.children[element];
      if (child == null)  return;
      current = child;
    }
    if (!current.isTerminating) return;
    
    current.isTerminating = false;
    while (current.parent != null && current.children.isEmpty && !current.isTerminating) {  // remove until it has no parent, has other children, or isTerminating
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  List<List<E>> matchPrefix(List<E> prefix) {
    TrieNode<E> current = root;

    for (final E element in prefix) {
      final TrieNode<E>? child = current.children[element];
      if (child == null)  return [];
      current = child;
    }
    
    return _moreMatches(prefix, current);
  }

  List<List<E>> _moreMatches(List<E> prefix, TrieNode<E> node) {
    final List<List<E>> matches = [];
    if (node.isTerminating) {
      matches.add(prefix);
    }


    for (final TrieNode<E>? child in node.children.values) {
      final E key = child!.key!;
      matches.addAll(
        _moreMatches(
          prefix..add(key),
          child
        )
      );
    }
    return matches;
  }
}