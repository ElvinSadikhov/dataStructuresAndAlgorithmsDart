//! Challenge 2: Recursive DFS
// In this chapter, you learned an iterative implementation of depth-first search. Now write a recursive implementation.

import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

extension RecursiveDfs<E> on Graph<E> {
  List<Vertex<E>> dfs(Vertex<E> start) {
    final List<Vertex<E>> visited = [];
    final Set<Vertex<E>> pushed = {};
    _dfs(start, visited, pushed);
    return visited;
  }

  void _dfs(Vertex<E> source, List<Vertex<E>> visited, Set<Vertex<E>> pushed) {
    pushed.add(source);
    visited.add(source);
    final List<Edge<E>> neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        _dfs(edge.destination, visited, pushed);
      }
   } 
  }
}