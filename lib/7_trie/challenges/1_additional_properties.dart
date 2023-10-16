//! Challenge 1: Additional Properties
// The current implementation of StringTrie is missing some notable operations. Your task for this challenge is to augment the current implementation of the trie by adding the following:
// 1. An allStrings property that returns all the collections in the trie.
// 2. A count property that tells you how many strings are currently in the trie.
// 3. An isEmpty property that returns true if the trie is empty, false otherwise.

import 'package:data_structures_and_algorithms/7_trie/base/trie_node.dart';
import 'package:data_structures_and_algorithms/7_trie/strgin_trie.dart';

extension AdvancedStringTrie on StringTrie {
  List<String> get allStrings => _allStrings(root, "");

  int get count => allStrings.length;

  bool get isEmpty => root.children.isEmpty;

  List<String> _allStrings(TrieNode<int>? node, String str) {
    if (node == null) return [];

    final List<String> strings = [];
    if (node.isTerminating) strings.add(str);

    for (final TrieNode<int>? child in node.children.values) {
      final int codeUnit = child!.key!;
      strings.addAll(
        _allStrings(child, str + String.fromCharCode(codeUnit))
      );
    }
    return strings;
  }
}

void main() {
  final StringTrie trie2 = StringTrie();
  trie2.insert('car');
  trie2.insert('card');
  trie2.insert('care');
  trie2.insert('cared');
  trie2.insert('cars');
  trie2.insert('carbs');
  trie2.insert('carapace');
  trie2.insert('cargo');
  print(trie2.allStrings);
  print(trie2.count);
  print(trie2.isEmpty);
}