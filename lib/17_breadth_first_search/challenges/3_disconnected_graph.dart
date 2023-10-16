//! Challenge 3: Disconnected Graph
// Add a method to Graph to detect if a graph is disconnected. An example of a disconnected graph is shown below:

import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';
import 'package:data_structures_and_algorithms/17_breadth_first_search/base/breadth_first_search.dart';

extension Connected<E> on Graph<E> {
  bool isConnected() {
    if (vertices.isEmpty) return true;
    final List<Vertex<E>> visited = breadthFirstSearch(vertices.first);
    return vertices.length == visited.length;
  }
}