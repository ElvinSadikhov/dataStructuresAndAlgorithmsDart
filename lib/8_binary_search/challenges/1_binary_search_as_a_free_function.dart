//! Challenge 1: Binary Search as a Free Function
// In this chapter, you implemented binary search as an extension of List. Since binary search only works on sorted lists, exposing binarySearch for every list (including unsorted ones) opens it up to being misused.
// Your challenge is to implement binary search as a free function.

int? binarySearch<E extends Comparable<dynamic>>(List<E> list, E value, [int? start, int? end]) {
  final int startIndex = start ?? 0;
    final int endIndex = end ?? list.length;
    if (endIndex <= startIndex)  return null;

    final int middleIndex = (startIndex + endIndex) ~/ 2;
    final E foundElement = list[middleIndex];

    if (foundElement.compareTo(value) == 0) {
      return middleIndex;
    } else if (foundElement.compareTo(value) < 0) {
      return binarySearch(list, value, startIndex, middleIndex);
    } else {  // > 0
      return binarySearch(list, value, middleIndex + 1, endIndex);
    }
}