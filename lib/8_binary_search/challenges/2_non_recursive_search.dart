//! Challenge 2: Non-Recursive Search
// Does recursion make your brain hurt? No worries, you can always perform the same task in a non-recursive way. Re-implement binarySearch using a while loop.

int? binarySearch<E extends Comparable<dynamic>>(List<E> list, E value) {
  if (list.isEmpty) return null;

  int startIndex = 0;
  int endIndex = list.length;
  late int middleIndex;

  while (endIndex > startIndex) {
    middleIndex = (startIndex + endIndex) ~/ 2;
    final E foundElement = list[middleIndex];
    if (value.compareTo(foundElement) == 0) {
      return middleIndex;
    } else if (value.compareTo(foundElement) < 0) {
      endIndex = middleIndex;
    } else {  // > 0
      startIndex = middleIndex + 1;
    }
  }

  return null;
}


void main() {
  final List<int> list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  final int search31 = list.indexOf(31);
  final int? binarySearch31 = binarySearch(list, 31);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');
}