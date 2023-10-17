import 'package:data_structures_and_algorithms/16_graph/adjacency_list.dart';
import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

extension CyclicGraph<E> on Graph<E> {
  bool hasCycle(Vertex<E> source) {
    Set<Vertex<E>> pushed = {};
    return _hasCycle(source, pushed);
  }

  bool _hasCycle(Vertex<E> source, Set<Vertex<E>> pushed) {
    pushed.add(source);
    final List<Edge<E>> neighbors = edges(source);
    for (final edge in neighbors) {
      if (!pushed.contains(edge.destination)) {
        if (_hasCycle(edge.destination, pushed)) {
          return true;
        }
      } else {
        return true;
      }
    }
    pushed.remove(source);
    return false;
  }
}

void main() {
  final AdjacencyList<String> graph = AdjacencyList<String>();
  final Vertex<String> a = graph.createVertex('A');
  final Vertex<String> b = graph.createVertex('B');
  final Vertex<String> c = graph.createVertex('C');
  final Vertex<String> d = graph.createVertex('D');
  graph.addEdge(a, b, edgeType: EdgeType.DIRECTED);
  graph.addEdge(a, c, edgeType: EdgeType.DIRECTED);
  graph.addEdge(c, a, edgeType: EdgeType.DIRECTED);
  graph.addEdge(b, c, edgeType: EdgeType.DIRECTED);
  graph.addEdge(c, d, edgeType: EdgeType.DIRECTED);
  print(graph);
  print(graph.hasCycle(a));
}