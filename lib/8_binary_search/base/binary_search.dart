// ignore_for_file: unnecessary_this

extension SortedList<E extends Comparable<dynamic>> on List<E> {
  int? binarySearch(E value, [int? start, int? end]) {
    final int startIndex = start ?? 0;
    final int endIndex = end ?? this.length;
    if (endIndex <= startIndex)  return null;

    final int middleIndex = (startIndex + endIndex) ~/ 2;
    final E foundElement = this[middleIndex];

    if (value.compareTo(foundElement) == 0) {
      return middleIndex;
    } else if (value.compareTo(foundElement) < 0) {
      return binarySearch(value, startIndex, middleIndex);
    } else {  // > 0
      return binarySearch(value, middleIndex + 1, endIndex);
    }
  } 
}

void main() {
  final List<int> list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  final int search31 = list.indexOf(31);
  final int? binarySearch31 = list.binarySearch(31);
  print('indexOf: $search31');
  print('binarySearch: $binarySearch31');
}