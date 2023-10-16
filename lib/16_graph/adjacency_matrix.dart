import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

class AdjacencyMatrix<E> implements Graph<E> {
  final List<Vertex<E>> _vertices = [];
  final List<List<double?>?> _weights = [];
  
  int _nextIndex = 0;
  
  
  @override
  void addEdge(Vertex<E> source, Vertex<E> destination, {EdgeType edgeType = EdgeType.UNDIRECTED, double? weight}) {
    _weights[source.index]?[destination.index] = weight;
    if (edgeType == EdgeType.UNDIRECTED) {
      _weights[destination.index]?[source.index] = weight;
    }
  }

  @override
  Vertex<E> createVertex(E data) {
    final Vertex<E> vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _vertices.add(vertex);
    for (int i = 0; i < _weights.length; i++) {
      _weights[i]?.add(null);
    }
    final List<double?> row = List<double?>.filled(
      _vertices.length,
      null,
      growable: true,
    );
    _weights.add(row);
    return vertex;
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    final List<Edge<E>> edges = [];
    for (int column = 0; column < _weights.length; column++) {
      final weight = _weights[source.index]?[column];
      if (weight == null) continue;
      final Vertex<E> destination = _vertices[column];
      edges.add(Edge(source, destination, weight));
    }
    return edges;
  }

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) => _weights[source.index]?[destination.index];
  
  @override
  Iterable<Vertex<E>> get vertices => _vertices;

  @override
  String toString() {
    final StringBuffer output = StringBuffer(); 
    for (final vertex in _vertices) {
      output.writeln('${vertex.index}: ${vertex.data}');
    } 
    for (int i = 0; i < _weights.length; i++) {
      for (int j = 0; j < _weights.length; j++) {
        final value = (_weights[i]?[j] ?? '.').toString();
        output.write(value.padRight(6));
      }
      output.writeln();
    }
    return output.toString();
  }
}

void main() {
  final AdjacencyMatrix<String> graph = AdjacencyMatrix<String>();
  final Vertex<String> singapore = graph.createVertex('Singapore');
  final Vertex<String> tokyo = graph.createVertex('Tokyo');
  final Vertex<String> hongKong = graph.createVertex('Hong Kong');
  final Vertex<String> detroit = graph.createVertex('Detroit');
  final Vertex<String> sanFrancisco = graph.createVertex('San Francisco');
  final Vertex<String> washingtonDC = graph.createVertex('Washington DC');
  final Vertex<String> austinTexas = graph.createVertex('Austin Texas');
  final Vertex<String> seattle = graph.createVertex('Seattle');

  graph
    ..addEdge(singapore, hongKong, weight: 300)
    ..addEdge(singapore, tokyo, weight: 500)
    ..addEdge(hongKong, tokyo, weight: 250)
    ..addEdge(tokyo, detroit, weight: 450)
    ..addEdge(tokyo, washingtonDC, weight: 300)
    ..addEdge(hongKong, sanFrancisco, weight: 600)
    ..addEdge(detroit, austinTexas, weight: 50)
    ..addEdge(austinTexas, washingtonDC, weight: 292)
    ..addEdge(sanFrancisco, washingtonDC, weight: 337)
    ..addEdge(washingtonDC, seattle, weight: 277)
    ..addEdge(sanFrancisco, seattle, weight: 218)
    ..addEdge(austinTexas, sanFrancisco, weight: 297);

  print(graph);

  final int? cost = graph.weight(singapore, tokyo)?.toInt();
  print('It costs \$$cost to fly from Singapore to Tokyo.');

  print('San Francisco Outgoing Flights: ');
  print('-------------------------------- ');
  for (final edge in graph.edges(sanFrancisco)) {
    print('${edge.source} to ${edge.destination}');
  }
}