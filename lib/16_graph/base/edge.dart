// ignore_for_file: constant_identifier_names

import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

class Edge<T> {
  final Vertex<T> source;
  final Vertex<T> destination;

  const Edge(
    this.source,
    this.destination, [
    this.weight,
  ]);
  
  final double? weight;
}

enum EdgeType { DIRECTED, UNDIRECTED }