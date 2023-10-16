// ignore_for_file: avoid_renaming_method_parameters

import 'package:data_structures_and_algorithms/7_trie/base/trie_node.dart';

// class StringTrie extends Trie<int> {
class StringTrie {
  final TrieNode<int> root = TrieNode(key: null, parent: null); // in Dart String is UTF-16 int collection, so it is <int>, not <String>

  void insert(String text) {
    TrieNode<int> current = root;
    for (final int codeUnit in text.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  bool contains(String text) {
    TrieNode<int> current = root;
    for (final int element in text.codeUnits) {
      final TrieNode<int>? child = current.children[element];
      if (child == null)  return false;
      current = child;
    }
    return current.isTerminating;
  }

  void remove(String text) {
    TrieNode<int> current = root;
    for (final codeUnit in text.codeUnits) {
      final TrieNode<int>? child = current.children[codeUnit];
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

  List<String> matchPrefix(String prefix) {
    TrieNode<int> current = root;

    for (final int codeUnit in prefix.codeUnits) {
      final TrieNode<int>? child = current.children[codeUnit];
      if (child == null)  return [];
      current = child;
    }
    
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    final List<String> matches = [];
    if (node.isTerminating) {
      matches.add(prefix);
    }

    for (final TrieNode<int>? child in node.children.values) {
      final int codeUnit = child!.key!;
      matches.addAll(
        _moreMatches(
          prefix + String.fromCharCode(codeUnit),
          child
        )
      );
    }
    return matches;
  }
}

void main() {
  final StringTrie trie1 = StringTrie();
  trie1.insert('cut');
  trie1.insert('cute');
  assert(trie1.contains('cut'));
  print('"cut" is in the trie');
  assert(trie1.contains('cute'));
  print('"cute" is in the trie');

  print('\n--- Removing "cut" ---');
  trie1.remove('cut');
  assert(!trie1.contains('cut'));
  print('"cute" is NOT in the trie');
  assert(trie1.contains('cute'));
  print('"cute" is still in the trie');

  print('\n');

  final StringTrie trie2 = StringTrie();
  trie2.insert('car');
  trie2.insert('card');
  trie2.insert('care');
  trie2.insert('cared');
  trie2.insert('cars');
  trie2.insert('carbs');
  trie2.insert('carapace');
  trie2.insert('cargo');
  print('Collections starting with "car"');
  final prefixedWithCar = trie2.matchPrefix('car');
  print(prefixedWithCar);
  print('\nCollections starting with "care"');
  final prefixedWithCare = trie2.matchPrefix('care');
  print(prefixedWithCare);
}