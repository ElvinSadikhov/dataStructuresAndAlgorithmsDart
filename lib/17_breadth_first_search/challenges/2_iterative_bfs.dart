//! Challenge 2: Iterative BFS
// In this chapter, you create an iterative implementation of breadth-first search. Now write a recursive solution.

import 'package:data_structures_and_algorithms/16_graph/adjacency_list.dart';
import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';
import 'package:data_structures_and_algorithms/3_queue/base/queue.dart';
import 'package:data_structures_and_algorithms/3_queue/queue_double_stack_impl.dart';

extension BreadthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> breadthFirstSearch(Vertex<E> source) {
    final Queue<Vertex<E>> queue = QueueDoubleStackImpl<Vertex<E>>();
    final Set<Vertex<E>> enqueued = {};
    final List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);
    _recursiveBFS(queue, enqueued, visited);
    return visited;
  }

  void _recursiveBFS(Queue<Vertex<E>> queue, Set<Vertex<E>> enqueued, List<Vertex<E>> visited) {
    final Vertex<E>? current = queue.dequeue();

    if (current == null)  return;
    visited.add(current);
    final List<Edge<E>> neighbors = edges(current);
    for (int i = 0; i < neighbors.length; i++) {
      final Vertex<E> neighbor = neighbors[i].destination;
      if (!enqueued.contains(neighbor)) {
        queue.enqueue(neighbor);
        enqueued.add(neighbor);
      }
    }

    _recursiveBFS(queue, enqueued, visited);
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
    ..addEdge(c, f, weight: 1)
    ..addEdge(c, g, weight: 1)
    ..addEdge(e, h, weight: 1)
    ..addEdge(e, f, weight: 1)
    ..addEdge(f, g, weight: 1);

  final List<Vertex<String>> vertices = graph.breadthFirstSearch(a);
  vertices.forEach(print);
}