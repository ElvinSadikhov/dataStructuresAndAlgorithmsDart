import 'package:data_structures_and_algorithms/10_priority_queue/priority_queue_heap_impl.dart';
import 'package:data_structures_and_algorithms/16_graph/adjacency_list.dart';
import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';
import 'package:data_structures_and_algorithms/19_dijkstra_algorithm/base/pair.dart';
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';
import 'package:data_structures_and_algorithms/9_heap/base/heap.dart';

class Dijkstra<E> {
  final Graph<E> graph;
  Dijkstra(this.graph);

  Map<Vertex<E>, Pair<E>?> shortestPaths(Vertex<E> source) {
    final Queue<Pair<E>> queue = PriorityQueueHeapImpl<Pair<E>>(priority: Priority.MIN);
    final Map<Vertex<E>, Pair<E>?> paths = {};
    final Set<Vertex<E>> visited = {};

    for (final vertex in graph.vertices) {
      paths[vertex] = null;
    }

    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0);
    visited.add(source);

    while (!queue.isEmpty) {
      final Pair<E> current = queue.dequeue()!;
      final double savedDistance = paths[current.vertex]!.distance;
      if (current.distance > savedDistance) continue;
      visited.add(current.vertex!);

      for (final edge in graph.edges(current.vertex!)) {
        final Vertex<E> neighbor = edge.destination;
        if (visited.contains(neighbor)) continue;
        final double weight = edge.weight ?? double.infinity;
        final double totalDistance = current.distance + weight;
        final double knownDistance = paths[neighbor]?.distance ?? double.infinity;
        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, current.vertex);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      } 
    }  

    return paths;
  }

  List<Vertex<E>> shortestPath(Vertex<E> source, Vertex<E> destination, {Map<Vertex<E>, Pair<E>?>? paths}) {
    final Map<Vertex<E>, Pair<E>?> allPaths = paths ?? shortestPaths(source);
    if (!allPaths.containsKey(destination)) return [];
    Vertex<E> current = destination;
    final List<Vertex<E>> path = [current];
    while (current != source) {
      final Vertex<E>? previous = allPaths[current]?.vertex;
      if (previous == null) return [];
      path.add(previous);
      current = previous;
    }

    return path.reversed.toList();
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
    ..addEdge(a, b, weight: 8, edgeType: EdgeType.DIRECTED)
    ..addEdge(a, f, weight: 9, edgeType: EdgeType.DIRECTED)
    ..addEdge(a, g, weight: 1, edgeType: EdgeType.DIRECTED)
    ..addEdge(g, c, weight: 3, edgeType: EdgeType.DIRECTED)
    ..addEdge(c, b, weight: 3, edgeType: EdgeType.DIRECTED)
    ..addEdge(c, e, weight: 1, edgeType: EdgeType.DIRECTED)
    ..addEdge(e, b, weight: 1, edgeType: EdgeType.DIRECTED)
    ..addEdge(e, d, weight: 2, edgeType: EdgeType.DIRECTED)
    ..addEdge(b, e, weight: 1, edgeType: EdgeType.DIRECTED)
    ..addEdge(b, f, weight: 3, edgeType: EdgeType.DIRECTED)
    ..addEdge(f, a, weight: 2, edgeType: EdgeType.DIRECTED)
    ..addEdge(h, g, weight: 5, edgeType: EdgeType.DIRECTED)
    ..addEdge(h, f, weight: 2, edgeType: EdgeType.DIRECTED);

  final Dijkstra<String> dijkstra = Dijkstra<String>(graph);
  final Map<Vertex<dynamic>, Pair<dynamic>?> allPaths = dijkstra.shortestPaths(a);
  print(allPaths);

  final List<Vertex<String>> path = dijkstra.shortestPath(a, d);
  print(path);
}

