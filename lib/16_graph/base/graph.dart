import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

abstract class Graph<E> {
  Vertex<E> createVertex(E data);
  
  void addEdge(Vertex<E> source, Vertex<E> destination, {
    EdgeType edgeType = EdgeType.UNDIRECTED,
    double? weight,
  });

  double? weight(Vertex<E> source, Vertex<E> destination);

  List<Edge<E>> edges(Vertex<E> source);

  Iterable<Vertex<E>> get vertices;
}