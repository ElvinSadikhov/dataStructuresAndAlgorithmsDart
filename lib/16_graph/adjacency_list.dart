import 'package:data_structures_and_algorithms/16_graph/base/edge.dart';
import 'package:data_structures_and_algorithms/16_graph/base/graph.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  int _nextIndex = 0;
  
  @override
  void addEdge(Vertex<E> source, Vertex<E> destination, {
    EdgeType edgeType = EdgeType.UNDIRECTED, 
    double? weight,
  }) {
    _connections[source]!.add(Edge(
      source,
      destination,
      weight,
    ));

    if (edgeType == EdgeType.UNDIRECTED) {
      _connections[destination]!.add(Edge(
        destination,
        source,
        weight,
      ));
    }
  }

  @override
  Vertex<E> createVertex(E data) {
    final Vertex<E> vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }
  
  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    final Iterable<Edge<E>> match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }
  
  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  String toString() {
    final StringBuffer result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final String destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}

void main() {
  final AdjacencyList<String> graph = AdjacencyList<String>();
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