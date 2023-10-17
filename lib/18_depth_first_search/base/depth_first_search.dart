import 'package:data_structures_and_algorithms/16_graph/adjacency_list.dart';
import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';
import 'package:data_structures_and_algorithms/1_stack/base/stack.dart';
import 'package:data_structures_and_algorithms/1_stack/stack_impl.dart';

extension DepthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> depthFirstSearch(Vertex<E> source) {
    final Stack<Vertex<E>> stack = StackImpl<Vertex<E>>();
    final Set<Vertex<E>> pushed = {};
    final List<Vertex<E>> visited = [];

    stack.push(source);
    pushed.add(source);
    visited.add(source);

    outerLoop:
    while (!stack.isEmpty) {
      final Vertex<E> vertex = stack.peek;
      final List<Edge<E>> neighbors = edges(vertex);
      for (final edge in neighbors) {
        if (!pushed.contains(edge.destination)) {
          stack.push(edge.destination);
          pushed.add(edge.destination);
          visited.add(edge.destination);
          continue outerLoop;
        }
      }
      stack.pop();
    }

    return visited;
  }
}

void main() {
  final AdjacencyList<String> graph = AdjacencyList<String>();
  final Vertex<String> a = graph.createVertex('A');
  final Vertex<String> b = graph.createVertex('B');
  final Vertex<String> c = graph.createVertex('C');
  final Vertex<String> d = graph.createVertex('D');
  final Vertex<String> e = graph.createVertex('E');
  final Vertex<String> f = graph.createVertex('F');
  final Vertex<String> g = graph.createVertex('G');
  final Vertex<String> h = graph.createVertex('H');
  graph
    ..addEdge(a, b, weight: 1)
    ..addEdge(a, c, weight: 1)
    ..addEdge(a, d, weight: 1)
    ..addEdge(b, e, weight: 1)
    ..addEdge(c, g, weight: 1)
    ..addEdge(e, f, weight: 1)
    ..addEdge(e, h, weight: 1)
    ..addEdge(f, g, weight: 1)
    ..addEdge(f, c, weight: 1);
  
  final List<Vertex<String>> vertices = graph.depthFirstSearch(a);
  vertices.forEach(print);
}