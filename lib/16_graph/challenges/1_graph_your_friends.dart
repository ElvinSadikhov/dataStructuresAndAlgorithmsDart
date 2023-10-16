//! Challenge 1: Graph Your Friends
// Megan has three friends: Sandra, Pablo and Edith. Pablo has friends as well: Ray, Luke, and a mutual friend of Megan’s. Edith is friends with Manda and Vicki. Manda is friends with Pablo and Megan. Create an adjacency list that represents this friendship graph. Which mutual friend do Pablo and Megan share?

import 'package:data_structures_and_algorithms/16_graph/adjacency_list.dart';
import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

Set<T> findMutualFriends<T>(Vertex<T> friend1, Vertex<T> friend2, AdjacencyList<T> graph) {
  final Set<T> friendsOfFirst = Set.of(
    graph.edges(friend1).map((edge) {
      return edge.destination.data;
  }), );
  final Set<T> friendsOfSecond = Set.of(
    graph.edges(friend2).map((edge) {
      return edge.destination.data;
  }), );

  return friendsOfFirst.intersection(friendsOfSecond);
}

void main() {
  final AdjacencyList graph = AdjacencyList<String>();
  final Vertex<dynamic> megan = graph.createVertex('Megan');
  final Vertex<dynamic> sandra = graph.createVertex('Sandra');
  final Vertex<dynamic> pablo = graph.createVertex('Pablo');
  final Vertex<dynamic> edith = graph.createVertex('Edith');
  final Vertex<dynamic> ray = graph.createVertex('Ray');
  final Vertex<dynamic> luke = graph.createVertex('Luke');
  final Vertex<dynamic> manda = graph.createVertex('Manda');
  final Vertex<dynamic> vicki = graph.createVertex('Vicki');
  graph
    ..addEdge(megan, sandra, weight: 1)
    ..addEdge(megan, pablo, weight: 1)
    ..addEdge(megan, edith, weight: 1)
    ..addEdge(pablo, ray, weight: 1)
    ..addEdge(pablo, luke, weight: 1)
    ..addEdge(edith, manda, weight: 1)
    ..addEdge(edith, vicki, weight: 1)
    ..addEdge(manda, pablo, weight: 1)
    ..addEdge(manda, megan, weight: 1);

  print(graph);

  final Set<dynamic> mutualFriends = findMutualFriends(megan, pablo, graph);
  print("`Megan` and `Pablo` have ${mutualFriends.length} mutual friends: $mutualFriends");
}