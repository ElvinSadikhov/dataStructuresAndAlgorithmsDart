import 'package:data_structures_and_algorithms/16_graph/base/vertex.dart';

class Pair<T> implements Comparable<Pair<T>> {
  double distance;
  Vertex<T>? vertex;
  
  Pair(this.distance, [this.vertex]);

  @override
  int compareTo(Pair<T> other) {
    if (distance == other.distance) return 0;
    if (distance > other.distance) return 1;
    return -1;
  }

  @override
  String toString() => '($distance, $vertex)';
}