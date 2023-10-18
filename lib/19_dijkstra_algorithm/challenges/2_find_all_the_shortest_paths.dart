//! Challenge 2: Find All the Shortest Paths
// Add an extension on Dijkstra that returns all the shortest paths in list form from a given starting vertex. Here’s the method signature to get you started:

import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';
import 'package:data_structures_and_algorithms/19_dijkstra_algorithm/base/pair.dart';
import 'package:data_structures_and_algorithms/19_dijkstra_algorithm/dijkstra.dart';

extension ShortestPaths<E> on Dijkstra<E> {Map<Vertex<E>, List<Vertex<E>>> 
  shortestPathsLists(Vertex<E> source) {
    final Map<Vertex<E>, List<Vertex<E>>> allPathsLists = {};
    final Map<Vertex<E>, Pair<E>?> allPaths = shortestPaths(source);
    for (final vertex in graph.vertices) {
      final List<Vertex<E>> path = shortestPath(
        source,
        vertex,
        paths: allPaths,
      );
      allPathsLists[vertex] = path;
    }
    return allPathsLists;
  }
}